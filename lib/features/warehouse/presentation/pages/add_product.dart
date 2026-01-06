import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/network/dio_client.dart';
import '../cubit/add_product_cubit.dart';
import '../cubit/add_product_state.dart';
import '../cubit/warehouse_cubit.dart';
import '../cubit/warehouse_state.dart';
import '../../../products/data/models/category_model.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class AddProductWrapper extends StatelessWidget {
  const AddProductWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AddProductCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<WarehouseCubit>(),
        ),
      ],
      child: const AddProduct(),
    );
  }
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  static final List<String> _yearsList = List.generate(30, (index) => (2025 - index).toString());
  final _nameController = TextEditingController();
  final _yearController = TextEditingController();
  final _mileageController = TextEditingController();
  final _plateController = TextEditingController();
  final _regionController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedColor;
  String? _selectedYear;
  String? _selectedTransmission;
  String? _selectedFuelType;
  String? _selectedOrigin;
  String? _selectedCategory;
  List<XFile> _selectedImages = []; // Multiple images
  List<CategoryModel> _categories = [];
  bool _isLoadingCategories = true;
  bool _isUploadingImages = false;
  
  static const int _maxImages = 10;
  
  static const List<String> _colors = ['Qora', 'Oq', 'Kulrang', 'Qizil', 'Ko\'k', 'Yashil'];
  // final List<String> _origin = ['O\'zbekiston', 'Rossiya', 'Xitoy', 'Koreya', 'Yaponiya'];
  static const List<String> _transmission = ['Mexanika', 'Avtomat', 'Robot'];
  static const List<String> _fuelType = ['Benzin', 'Dizel', 'Gaz', 'Elektr', 'Gibrid'];
  static const List<String> _origin = ['Toshkent', 'Samarqand', 'Buxoro', 'Andijon', 'Farg\'ona', 'Xorazm', 'Jizzax', 'Namangan', 'Qashqadaryo', 'Surxondaryo', 'Qoraqalpogiston','Navoiy'];
  
  ImagePicker? _picker;
  
  @override
  void initState() {
    super.initState();
    // Load categories after the first frame to avoid blocking the transition animation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCategories();
    });
  }

  void _loadCategories() async {
    if (!mounted) return;
    
    final warehouseCubit = context.read<WarehouseCubit>();
    
    // Check if categories are already loaded
    final currentState = warehouseCubit.state;
    if (currentState is WarehouseLoaded) {
      if (mounted) {
        setState(() {
          _categories = currentState.categories;
          _isLoadingCategories = false;
        });
      }
      return;
    } else if (currentState is CategoriesLoaded) {
      if (mounted) {
        setState(() {
          _categories = currentState.categories;
          _isLoadingCategories = false;
        });
      }
      return;
    } else if (currentState is WarehouseLoading && currentState.categories != null) {
      if (mounted) {
        setState(() {
          _categories = currentState.categories!;
          _isLoadingCategories = false;
        });
      }
      return;
    }
    
    // If not loaded, initialize
    await warehouseCubit.initialize();
    
    if (!mounted) return;
    
    final state = warehouseCubit.state;
    if (state is WarehouseLoaded) {
      setState(() {
        _categories = state.categories;
        _isLoadingCategories = false;
      });
    } else if (state is CategoriesLoaded) {
      setState(() {
        _categories = state.categories;
        _isLoadingCategories = false;
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _yearController.dispose();
    _mileageController.dispose();
    _plateController.dispose();
    _regionController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  Future<void> _pickImages() async {
    _picker ??= ImagePicker();
    
    // Calculate remaining slots
    final remainingSlots = _maxImages - _selectedImages.length;
    if (remainingSlots <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Maksimal $_maxImages ta rasm qo\'shish mumkin')),
      );
      return;
    }
    
    final List<XFile> images = await _picker!.pickMultiImage();
    
    if (images.isNotEmpty) {
      // Check if adding these would exceed the limit
      if (_selectedImages.length + images.length > _maxImages) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Faqat $remainingSlots ta rasm qo\'shishingiz mumkin'),
          ),
        );
        // Take only what fits
        setState(() {
          _selectedImages.addAll(images.take(remainingSlots));
        });
      } else {
        setState(() {
          _selectedImages.addAll(images);
        });
      }
    }
  }
  
  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }
  
  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedCategory == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Iltimos, kategoriyani tanlang')),
        );
        return;
      }

      final price = double.tryParse(_priceController.text);
      if (price == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Iltimos, to\'g\'ri narx kiriting')),
        );
        return;
      }

      // Build custom fields from car-specific data
      final customFields = <String, dynamic>{};
      if (_selectedYear != null) customFields['year'] = _selectedYear;
      if (_selectedColor != null) customFields['color'] = _selectedColor;
      if (_mileageController.text.isNotEmpty) customFields['mileage'] = _mileageController.text;
      if (_selectedTransmission != null) customFields['transmission'] = _selectedTransmission;
      if (_selectedFuelType != null) customFields['fuel_type'] = _selectedFuelType;
      if (_plateController.text.isNotEmpty || _regionController.text.isNotEmpty) {
        customFields['plate_number'] = '${_regionController.text} ${_plateController.text}'.trim();
      }
      if (_selectedOrigin != null) customFields['origin'] = _selectedOrigin;

      // Phase 1: Upload images first (if any)
      List<String>? imageIds;
      if (_selectedImages.isNotEmpty) {
        setState(() {
          _isUploadingImages = true;
        });
        
        try {
          final dioClient = getIt<DioClient>();
          final imagePaths = _selectedImages.map((xfile) => xfile.path).toList();
          final uploadedFiles = await dioClient.uploadMultiple(imagePaths, folder: 'products');
          
          // Extract IDs from uploaded files
          imageIds = uploadedFiles.map((file) => file['id'] as String).toList();
        } catch (e) {
          setState(() {
            _isUploadingImages = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Rasmlarni yuklashda xatolik: ${e.toString()}')),
          );
          return;
        }
        
        setState(() {
          _isUploadingImages = false;
        });
      }

      // Phase 2: Create product with image IDs
      context.read<AddProductCubit>().createProduct(
        name: _nameController.text,
        categoryId: _selectedCategory!,
        price: price,
        description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
        customFields: customFields.isEmpty ? null : customFields,
        imageIds: imageIds,
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context, true); // Return true to indicate success
        } else if (state is AddProductError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.cxWhite,
        appBar: AppBar(
          backgroundColor:AppColors.cxWhite,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Hero(
              tag: 'add_product_button',
              child: Material(
                color: Colors.transparent,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color(0xFFF5F7F9),
                  ),
                  child: IconButton(
                    iconSize: 29.sp,
                    icon: Icon(Icons.close),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
            ),
          ),
          title: Text(
            'Maxsulot qo\'shish',
            style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<AddProductCubit, AddProductState>(
          builder: (context, state) {
            final isLoading = state is AddProductLoading || _isUploadingImages;
            
            return Stack(
              children: [
                RepaintBoundary(
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
            _buildDropdown(
              label: 'Kategoriya *',
              value: _selectedCategory != null && _categories.isNotEmpty
                  ? _categories.firstWhere((c) => c.id == _selectedCategory, orElse: () => _categories.first).name
                  : null,
              items: _categories.map((c) => c.name).toList(),
              onChanged: (value) {
                if (_categories.isNotEmpty) {
                  final category = _categories.firstWhere((c) => c.name == value);
                  setState(() => _selectedCategory = category.id);
                }
              },
              isLoading: _isLoadingCategories,
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Nomi *',
                    controller: _nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Majburiy maydon';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(width: 12.w,),
                Expanded(
                  child: _buildDropdown(
                    label: 'Yili',
                    value: _selectedYear,
                    items: _yearsList,
                    onChanged: (value) => setState(() => _selectedYear = value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    label: 'Rangi',
                    value: _selectedColor,
                    items: _colors,
                    onChanged: (value) => setState(() => _selectedColor = value),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildTextField(
                    label: 'Yurgani',
                    controller: _mileageController,
                    keyboardType: TextInputType.number,
                    suffixText: 'km',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: _buildDropdown(
                    label: 'Uzatmalar qutisi',
                    value: _selectedTransmission,
                    items: _transmission,
                    onChanged: (value) => setState(() => _selectedTransmission = value),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildDropdown(
                    label: 'Yoqilg\'i turi',
                    value: _selectedFuelType,
                    items: _fuelType,
                    onChanged: (value) => setState(() => _selectedFuelType = value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: _buildPlateNumberField(),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Narxi *',
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Majburiy maydon';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Faqat raqam';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            _buildDropdown(
              label: 'Olingan joy',
              value: _selectedOrigin,
              items: _origin,
              onChanged: (value) => setState(() => _selectedOrigin = value),
            ),
            SizedBox(height: 16.h),
            _buildImagePicker(),
            SizedBox(height: 16.h),
            _buildTextField(
              label: 'Izoh',
              controller: _descriptionController,
              maxLines: 3,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              height: 48.h,
              child: ElevatedButton(
                onPressed: isLoading ? null : _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.cxBlack,
                  disabledBackgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: isLoading
                    ? SizedBox(
                        height: 24.h,
                        width: 24.w,
                        child: const CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                    : Text(
                        'Qo\'shish',
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
              ),
            ),
          ],
            ),
          ),
        ),
      ),
                if (isLoading)
                  Container(
                    color: Colors.black.withOpacity(0.3),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const CircularProgressIndicator(
                            color: Colors.white,
                          ),
                          if (_isUploadingImages) ...[
                            SizedBox(height: 16.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 24.w,
                                vertical: 12.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Text(
                                'Rasmlar yuklanmoqda...',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
  
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? suffixText,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.cxBlack,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          maxLines: maxLines,
          textInputAction: maxLines > 1 ? TextInputAction.done : TextInputAction.next,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF5F5F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.h,
              vertical: 16.w,
            ),
            suffixText: suffixText,
            suffixStyle: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey.shade600,
            ),
          ),
        ),
      ],
    );
  }
  
  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    bool isLoading = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFF5F5F5),
            borderRadius: BorderRadius.circular(30.r),
          ),
          child: isLoading
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 12.w),
                      const Text('Yuklanmoqda...'),
                    ],
                  ),
                )
              : DropdownButtonFormField<String>(
                  value: value,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 16.w,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  hint: const Text(''),
                  items: items.map((String item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: onChanged,
                ),
        ),
      ],
    );
  }
  
  Widget _buildPlateNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Avtomobil raqami',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.cxBlack,
          ),
        ),
        SizedBox(height: 8.h),
        Container(
          height: 56.h,
          decoration: BoxDecoration(
            color: const Color(0xFF2C2C2C),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: Colors.grey.shade700,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 70.w,
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(
                      color: Colors.grey.shade700,
                      width: 2,
                    ),
                  ),
                ),
                child: Center(
                  child: TextFormField(
                    controller: _regionController,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade400,
                      letterSpacing: 2,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(2),
                    ],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '01',
                      hintStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                        letterSpacing: 2,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: TextFormField(
                    controller: _plateController,
                    textCapitalization: TextCapitalization.characters,
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade400,
                      letterSpacing: 4,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Za-z]')),
                      LengthLimitingTextInputFormatter(8),
                      _PlateNumberFormatter(),
                    ],
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'A 111 AA',
                      hintStyle: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey.shade600,
                        letterSpacing: 4,
                      ),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 32.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.r),
                        border: Border.all(
                          color: Colors.grey.shade700,
                          width: 0.5,
                        ),
                      ),
                      child: Column(
                        children: [
                          //uz flag
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF0072CE),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(1.5.r),
                                  topRight: Radius.circular(1.5.r),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF43B02A),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(1.5.r),
                                  bottomRight: Radius.circular(1.5.r),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'UZ',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF00A0E3),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Rasmlar',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.cxBlack,
              ),
            ),
            if (_selectedImages.length < _maxImages)
              TextButton.icon(
                onPressed: _pickImages,
                icon: Icon(Icons.add_photo_alternate, size: 20.sp),
                label: const Text('Qo\'shish'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                ),
              ),
          ],
        ),
        SizedBox(height: 8.h),
        if (_selectedImages.isEmpty)
          InkWell(
            onTap: _pickImages,
            child: Container(
              height: 120.h,
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade300, width: 2),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 48.sp,
                      color: Colors.grey.shade400,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Rasm qo\'shish',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 8.h,
              childAspectRatio: 1,
            ),
            itemCount: _selectedImages.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Image.file(
                      File(_selectedImages[index].path),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 4.h,
                    right: 4.w,
                    child: GestureDetector(
                      onTap: () => _removeImage(index),
                      child: Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 16.sp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
      ],
    );
  }
}

// Custom formatter for Uzbekistan plate numbers
// Format: A 111 AA (1 letter + 3 digits + 2 letters)
class _PlateNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.toUpperCase().replaceAll(' ', '');
    final buffer = StringBuffer();
    
    for (int i = 0; i < text.length; i++) {
      // Add space after 1st letter
      if (i == 1) {
        buffer.write(' ');
      }
      // Add space after 3 digits (position 4 in original string)
      else if (i == 4) {
        buffer.write(' ');
      }
      buffer.write(text[i]);
    }
    
    final formatted = buffer.toString();
    
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
