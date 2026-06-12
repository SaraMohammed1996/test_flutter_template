import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_flutter_template/core/domain/result.dart';
import 'package:test_flutter_template/core/extensions/theme_extensions.dart';
import 'package:test_flutter_template/core/theme/app_theme.dart';
import 'package:test_flutter_template/core/widgets/primary_button.dart';
import 'package:test_flutter_template/features/products/domain/models/product.dart';
import 'package:test_flutter_template/features/products/domain/use_cases/create_product_use_case.dart';
import 'package:test_flutter_template/features/products/domain/use_cases/update_product_use_case.dart';
import 'package:test_flutter_template/features/products/presentation/providers/products_provider.dart';
import 'package:test_flutter_template/features/products/presentation/widgets/product_image_picker.dart';
import 'package:test_flutter_template/l10n/app_localizations.dart';

class ProductFormScreen extends ConsumerStatefulWidget {
  final Product? product;

  const ProductFormScreen({
    this.product,
    super.key,
  });

  @override
  ConsumerState<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends ConsumerState<ProductFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  File? _selectedImageFile;
  bool _isLoading = false;

  bool get _isEditing => widget.product != null;

  @override
  void initState() {
    super.initState();
    final Product? product = widget.product;
    if (product != null) {
      _nameController.text = product.name;
      _descriptionController.text = product.description ?? '';
      _priceController.text = product.price.toStringAsFixed(2);
      _quantityController.text = product.quantity.toString();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _imagePicker.pickImage(
      source: source,
      imageQuality: 85,
    );

    if (pickedFile == null || !mounted) {
      return;
    }

    setState(() {
      _selectedImageFile = File(pickedFile.path);
    });
  }

  void _removeSelectedImage() {
    setState(() => _selectedImageFile = null);
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isLoading = true);

    final String name = _nameController.text.trim();
    final String? description = _descriptionController.text.trim().isEmpty
        ? null
        : _descriptionController.text.trim();
    final double price = double.parse(_priceController.text.trim());
    final int quantity = int.parse(_quantityController.text.trim());

    final Result<Product> result;
    if (_isEditing) {
      final UpdateProductUseCase useCase =
          await ref.read(updateProductUseCaseProvider.future);
      result = await useCase.execute(
        id: widget.product!.id,
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        imageFile: _selectedImageFile,
      );
    } else {
      final CreateProductUseCase useCase =
          await ref.read(createProductUseCaseProvider.future);
      result = await useCase.execute(
        name: name,
        description: description,
        price: price,
        quantity: quantity,
        imageFile: _selectedImageFile,
      );
    }

    if (!mounted) {
      return;
    }

    setState(() => _isLoading = false);

    final AppLocalizations l10n = AppLocalizations.of(context)!;

    switch (result) {
      case Success<Product>():
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              _isEditing
                  ? l10n.productUpdatedSuccessfully
                  : l10n.productCreatedSuccessfully,
            ),
          ),
        );
        Navigator.of(context).pop(true);
      case Failure<Product>(:final message):
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
        title: Text(
          _isEditing ? l10n.editProduct : l10n.addProduct,
          style: context.themeTitleLarge,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsetsDirectional.all(AppTheme.spacingMd),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ProductImagePicker(
                  selectedImageFile: _selectedImageFile,
                  existingImagePath: widget.product?.image,
                  onPickFromGallery: () => _pickImage(ImageSource.gallery),
                  onTakePhoto: () => _pickImage(ImageSource.camera),
                  onRemoveImage:
                      _selectedImageFile != null ? _removeSelectedImage : null,
                ),
                const SizedBox(height: AppTheme.spacingMd),
                TextFormField(
                  controller: _nameController,
                  textInputAction: TextInputAction.next,
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
                TextFormField(
                  controller: _descriptionController,
                  textInputAction: TextInputAction.next,
                  maxLines: 3,
                  decoration: InputDecoration(
                    labelText: l10n.description,
                    border: const OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: AppTheme.spacingMd),
                TextFormField(
                  controller: _priceController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    labelText: l10n.price,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.priceRequired;
                    }
                    final double? price = double.tryParse(value.trim());
                    if (price == null || price < 0) {
                      return l10n.invalidPrice;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppTheme.spacingMd),
                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => _submit(),
                  decoration: InputDecoration(
                    labelText: l10n.quantity,
                    border: const OutlineInputBorder(),
                  ),
                  validator: (String? value) {
                    if (value == null || value.trim().isEmpty) {
                      return l10n.quantityRequired;
                    }
                    final int? quantity = int.tryParse(value.trim());
                    if (quantity == null || quantity < 0) {
                      return l10n.invalidQuantity;
                    }
                    return null;
                  },
                ),
                const SizedBox(height: AppTheme.spacingLg),
                PrimaryButton(
                  label: l10n.save,
                  isLoading: _isLoading,
                  onPressed: _submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
