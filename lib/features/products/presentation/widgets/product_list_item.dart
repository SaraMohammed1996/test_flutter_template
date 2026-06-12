import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/extensions/theme_extensions.dart';
import 'package:test_flutter_template/core/providers/api_config_provider.dart';
import 'package:test_flutter_template/core/theme/app_theme.dart';
import 'package:test_flutter_template/core/utils/media_url_helper.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

class ProductListItem extends ConsumerWidget {
  final Product product;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const ProductListItem({
    required this.product,
    this.onEdit,
    this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;
    final AsyncValue<String> baseUrlAsync = ref.watch(apiBaseUrlProvider);

    return Card(
      color: context.themeSurface,
      margin: const EdgeInsetsDirectional.only(bottom: AppTheme.spacingMd),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProductThumbnail(
                  imagePath: product.image,
                  baseUrlAsync: baseUrlAsync,
                ),
                const SizedBox(width: AppTheme.spacingMd),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product.name,
                              style: context.themeTitleLarge,
                            ),
                          ),
                          if (onEdit != null)
                            IconButton(
                              onPressed: onEdit,
                              icon: Icon(
                                Icons.edit_outlined,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              tooltip: l10n.editProduct,
                            ),
                          if (onDelete != null)
                            IconButton(
                              onPressed: onDelete,
                              icon: Icon(
                                Icons.delete_outline,
                                color: Theme.of(context).colorScheme.error,
                              ),
                              tooltip: l10n.deleteProduct,
                            ),
                        ],
                      ),
                      if (product.description != null &&
                          product.description!.isNotEmpty) ...[
                        const SizedBox(height: AppTheme.spacingSm),
                        Text(
                          product.description!,
                          style: context.themeBodyLarge.copyWith(
                            color: context.themeTextSecondary,
                          ),
                        ),
                      ],
                      const SizedBox(height: AppTheme.spacingSm),
                      Text(
                        l10n.productPrice(product.price.toStringAsFixed(2)),
                        style: context.themeLabelLarge,
                      ),
                      const SizedBox(height: AppTheme.spacingXs),
                      Text(
                        l10n.productQuantity(product.quantity),
                        style: context.themeLabelMedium,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductThumbnail extends StatelessWidget {
  final String? imagePath;
  final AsyncValue<String> baseUrlAsync;

  const _ProductThumbnail({
    required this.imagePath,
    required this.baseUrlAsync,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppTheme.spacingSm),
      child: SizedBox(
        width: AppTheme.spacingXl * 2,
        height: AppTheme.spacingXl * 2,
        child: baseUrlAsync.when(
          data: (String baseUrl) {
            final String? imageUrl =
                resolveProductImageUrl(baseUrl, imagePath);
            if (imageUrl == null) {
              return _buildPlaceholder(context);
            }

            return Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) => _buildPlaceholder(context),
            );
          },
          loading: () => _buildPlaceholder(context),
          error: (_, _) => _buildPlaceholder(context),
        ),
      ),
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Icon(
        Icons.image_outlined,
        color: context.themeTextSecondary,
      ),
    );
  }
}
