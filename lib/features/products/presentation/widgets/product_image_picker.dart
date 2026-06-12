import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/extensions/theme_extensions.dart';
import 'package:test_flutter_template/core/providers/api_config_provider.dart';
import 'package:test_flutter_template/core/theme/app_theme.dart';
import 'package:test_flutter_template/core/utils/media_url_helper.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

class ProductImagePicker extends ConsumerWidget {
  final File? selectedImageFile;
  final String? existingImagePath;
  final VoidCallback onPickFromGallery;
  final VoidCallback onTakePhoto;
  final VoidCallback? onRemoveImage;

  const ProductImagePicker({
    required this.onPickFromGallery,
    required this.onTakePhoto,
    this.selectedImageFile,
    this.existingImagePath,
    this.onRemoveImage,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final AsyncValue<String> baseUrlAsync = ref.watch(apiBaseUrlProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(l10n.productImage, style: context.themeLabelLarge),
        const SizedBox(height: AppTheme.spacingSm),
        AspectRatio(
          aspectRatio: 16 / 9,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.themeSurface,
              borderRadius: BorderRadius.circular(AppTheme.spacingSm),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.spacingSm),
              child: _buildPreview(context, baseUrlAsync),
            ),
          ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        Row(
          children: [
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onPickFromGallery,
                icon: const Icon(Icons.photo_library_outlined),
                label: Text(l10n.chooseFromGallery),
              ),
            ),
            const SizedBox(width: AppTheme.spacingSm),
            Expanded(
              child: OutlinedButton.icon(
                onPressed: onTakePhoto,
                icon: const Icon(Icons.photo_camera_outlined),
                label: Text(l10n.takePhoto),
              ),
            ),
          ],
        ),
        if (onRemoveImage != null) ...[
          const SizedBox(height: AppTheme.spacingSm),
          TextButton(
            onPressed: onRemoveImage,
            child: Text(
              l10n.removeImage,
              style: context.themeBodyLarge.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPreview(BuildContext context, AsyncValue<String> baseUrlAsync) {
    if (selectedImageFile != null) {
      return Image.file(
        selectedImageFile!,
        fit: BoxFit.cover,
        width: double.infinity,
      );
    }

    return baseUrlAsync.when(
      data: (String baseUrl) {
        final String? imageUrl =
            resolveProductImageUrl(baseUrl, existingImagePath);
        if (imageUrl == null) {
          return _buildPlaceholder(context);
        }

        return Image.network(
          imageUrl,
          fit: BoxFit.cover,
          width: double.infinity,
          errorBuilder: (_, _, _) => _buildPlaceholder(context),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (_, _) => _buildPlaceholder(context),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Center(
      child: Icon(
        Icons.image_outlined,
        size: AppTheme.spacingXl * 2,
        color: context.themeTextSecondary,
      ),
    );
  }
}
