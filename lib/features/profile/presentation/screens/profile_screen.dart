import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/extensions/theme_extensions.dart';
import 'package:test_flutter_template/core/theme/app_theme.dart';
import 'package:test_flutter_template/core/widgets/primary_button.dart';
import 'package:test_flutter_template/core/widgets/refreshable_content.dart';
import 'package:test_flutter_template/features/auth/domain/models/user.dart';
import 'package:test_flutter_template/features/auth/presentation/providers/auth_provider.dart';
import 'package:test_flutter_template/features/profile/presentation/providers/profile_notifier.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final GlobalKey<FormState> _nameFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  bool _isEditingName = false;
  bool _isUpdatingName = false;

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profileDataProvider.notifier).loadProfile();
    });
  }

  void _startEditingName(String currentName) {
    setState(() {
      _nameController.text = currentName;
      _isEditingName = true;
    });
  }

  void _cancelEditingName() {
    setState(() => _isEditingName = false);
  }

  Future<void> _saveName() async {
    if (!_nameFormKey.currentState!.validate()) {
      return;
    }

    final String name = _nameController.text.trim();
    setState(() => _isUpdatingName = true);

    final Result<User> result =
        await ref.read(profileDataProvider.notifier).updateName(name);

    if (!mounted) {
      return;
    }

    setState(() {
      _isUpdatingName = false;
    });

    final AppLocalizations l10n = AppLocalizations.of(context)!;

    switch (result) {
      case Success<User>(:final data):
        ref.read(authProvider.notifier).updateUser(data);
        setState(() => _isEditingName = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.profileUpdatedSuccessfully)),
        );
      case Failure<User>(:final message):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
    }
  }

  Future<void> _logout() async {
    await ref.read(authProvider.notifier).logout();
    if (mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: context.themeBackground,
      appBar: AppBar(
        backgroundColor: context.themeSurface,
        title: Text(l10n.profile, style: context.themeTitleLarge),
      ),
      body: RefreshableContent<User>(
        state: ref.watch(profileDataProvider),
        onRefresh: () => ref.read(profileDataProvider.notifier).loadProfile(),
        onRetry: () => ref.read(profileDataProvider.notifier).loadProfile(),
        childBuilder: (User user) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsetsDirectional.all(AppTheme.spacingLg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  color: context.themeSurface,
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.all(AppTheme.spacingLg),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                l10n.name,
                                style: context.themeLabelMedium,
                              ),
                            ),
                            if (!_isEditingName)
                              IconButton(
                                onPressed: () => _startEditingName(user.name),
                                icon: const Icon(Icons.edit_outlined),
                              ),
                          ],
                        ),
                        const SizedBox(height: AppTheme.spacingXs),
                        if (_isEditingName)
                          Form(
                            key: _nameFormKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextFormField(
                                  controller: _nameController,
                                  textInputAction: TextInputAction.done,
                                  enabled: !_isUpdatingName,
                                  onFieldSubmitted: (_) => _saveName(),
                                  decoration: InputDecoration(
                                    labelText: l10n.name,
                                    border: const OutlineInputBorder(),
                                  ),
                                  validator: (String? value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return l10n.nameRequired;
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: AppTheme.spacingMd),
                                Row(
                                  children: [
                                    Expanded(
                                      child: OutlinedButton(
                                        onPressed: _isUpdatingName
                                            ? null
                                            : _cancelEditingName,
                                        child: Text(l10n.cancel),
                                      ),
                                    ),
                                    const SizedBox(width: AppTheme.spacingMd),
                                    Expanded(
                                      child: PrimaryButton(
                                        label: l10n.save,
                                        isLoading: _isUpdatingName,
                                        onPressed: _saveName,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        else
                          Text(
                            user.name,
                            style: context.themeTitleLarge,
                          ),
                        const SizedBox(height: AppTheme.spacingMd),
                        Text(
                          l10n.email,
                          style: context.themeLabelMedium,
                        ),
                        const SizedBox(height: AppTheme.spacingXs),
                        Text(
                          user.email,
                          style: context.themeBodyLarge,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingLg),
                PrimaryButton(
                  label: l10n.logout,
                  onPressed: _logout,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
