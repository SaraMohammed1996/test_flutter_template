import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/extensions/theme_extensions.dart';
import 'package:test_flutter_template/core/theme/app_theme.dart';
import 'package:test_flutter_template/core/widgets/paginated_list_view.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';
import 'package:test_flutter_template/features/products/presentation/providers/products_notifier.dart';
import 'package:test_flutter_template/features/products/presentation/screens/product_form_screen.dart';
import 'package:test_flutter_template/features/products/presentation/widgets/product_list_item.dart';
import 'package:test_flutter_template/features/products/presentation/widgets/products_empty_state.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

class ProductsScreen extends ConsumerStatefulWidget {
  const ProductsScreen({super.key});

  @override
  ConsumerState<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends ConsumerState<ProductsScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(() => setState(() {}));
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(productsListProvider.notifier).loadProducts();
    });
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 400), () {
      ref.read(productsListProvider.notifier).searchProducts(query);
    });
  }

  void _clearSearch() {
    _searchDebounce?.cancel();
    _searchController.clear();
    ref.read(productsListProvider.notifier).searchProducts(null);
  }

  Future<void> _openProductForm({Product? product}) async {
    final bool? saved = await Navigator.of(context).push<bool>(
      MaterialPageRoute<bool>(
        builder: (BuildContext context) => ProductFormScreen(product: product),
      ),
    );

    if (saved == true && mounted) {
      await ref.read(productsListProvider.notifier).loadProducts();
    }
  }

  Future<void> _confirmDeleteProduct(Product product) async {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(l10n.deleteProduct),
          content: Text(l10n.deleteProductConfirmation(product.name)),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(l10n.cancel),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(
                l10n.delete,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            ),
          ],
        );
      },
    );

    if (confirmed != true || !mounted) {
      return;
    }

    final Result<void> result =
        await ref.read(productsListProvider.notifier).deleteProduct(product.id);

    if (!mounted) {
      return;
    }

    switch (result) {
      case Success<void>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(l10n.productDeletedSuccessfully)),
        );
      case Failure<void>(:final message):
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(message)),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: context.themeBackground,
      appBar: AppBar(
        backgroundColor: context.themeSurface,
        title: Text(l10n.products, style: context.themeTitleLarge),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openProductForm(),
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              AppTheme.spacingMd,
              AppTheme.spacingMd,
              AppTheme.spacingMd,
              AppTheme.spacingSm,
            ),
            child: TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              onChanged: _onSearchChanged,
              onSubmitted: (String query) {
                _searchDebounce?.cancel();
                ref.read(productsListProvider.notifier).searchProducts(query);
              },
              decoration: InputDecoration(
                hintText: l10n.searchProducts,
                prefixIcon: Icon(
                  Icons.search,
                  color: context.themeTextSecondary,
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        onPressed: _clearSearch,
                        icon: Icon(
                          Icons.clear,
                          color: context.themeTextSecondary,
                        ),
                      )
                    : null,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: PaginatedListView<Product>(
              state: ref.watch(productsListProvider),
              onRefresh: () =>
                  ref.read(productsListProvider.notifier).loadProducts(),
              onLoadMore: () =>
                  ref.read(productsListProvider.notifier).loadMoreProducts(),
              emptyWidget: const ProductsEmptyState(),
              padding: const EdgeInsets.fromLTRB(
                AppTheme.spacingMd,
                AppTheme.spacingSm,
                AppTheme.spacingMd,
                AppTheme.spacingMd,
              ),
              itemBuilder: (BuildContext context, Product product, int index) {
                return ProductListItem(
                  product: product,
                  onEdit: () => _openProductForm(product: product),
                  onDelete: () => _confirmDeleteProduct(product),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
