import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/di/injection.dart';
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
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedColor;
  String? _selectedYear;
  String? _selectedTransmission;
  String? _selectedFuelType;
  String? _selectedOrigin;
  String? _selectedCategory;
  XFile? _selectedImage;
  List<CategoryModel> _categories = [];
  bool _isLoadingCategories = true;
  
  static const List<String> _colors = ['Qora', 'Oq', 'Kulrang', 'Qizil', 'Ko\'k', 'Yashil'];
  // final List<String> _origin = ['O\'zbekiston', 'Rossiya', 'Xitoy', 'Koreya', 'Yaponiya'];
  static const List<String> _transmission = ['Mexanika', 'Avtomat', 'Robot'];
  static const List<String> _fuelType = ['Benzin', 'Dizel', 'Gaz', 'Elektr', 'Gibrid'];
  static const List<String> _origin = ['Toshkent', 'Samarqand', 'Buxoro', 'Andijon', 'Farg\'ona', 'Xorazm', 'Jizzax', 'Namangan', 'Qashqadaryo', 'Surxondaryo', 'Qoraqalpogiston','Navoiy'];
  
  ImagePicker? _picker;
  
  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() async {
    final warehouseCubit = context.read<WarehouseCubit>();
    
    // Check if categories are already loaded
    final currentState = warehouseCubit.state;
    if (currentState is WarehouseLoaded) {
      setState(() {
        _categories = currentState.categories;
        _isLoadingCategories = false;
      });
      return;
    } else if (currentState is CategoriesLoaded) {
      setState(() {
        _categories = currentState.categories;
        _isLoadingCategories = false;
      });
      return;
    } else if (currentState is WarehouseLoading && currentState.categories != null) {
      setState(() {
        _categories = currentState.categories!;
        _isLoadingCategories = false;
      });
      return;
    }
    
    // If not loaded, initialize
    await warehouseCubit.initialize();
    
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
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
  
  Future<void> _pickImage() async {
    _picker ??= ImagePicker(); // Lazy initialization
    final XFile? image = await _picker!.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }
  
  void _submitForm() {
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
      if (_plateController.text.isNotEmpty) customFields['plate_number'] = _plateController.text;
      if (_selectedOrigin != null) customFields['origin'] = _selectedOrigin;

      context.read<AddProductCubit>().createProduct(
        name: _nameController.text,
        categoryId: _selectedCategory!,
        price: price,
        description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
        customFields: customFields.isEmpty ? null : customFields,
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
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFF5F7F9),
              ),
              child: IconButton(
                iconSize: 29.sp,
                icon: Icon(Icons.arrow_back),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
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
            final isLoading = state is AddProductLoading;
            
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
                SizedBox(width: 12.w),
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
            Row(
              children: [
                Expanded(
                  child: _buildImagePicker(),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: _buildDropdown(
                    label: 'Olingan joy',
                    value: _selectedOrigin,
                    items: _origin,
                    onChanged: (value) => setState(() => _selectedOrigin = value),
                  ),
                ),
              ],
            ),
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
                    child: const Center(
                      child: CircularProgressIndicator(),
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
          'Davlat raqami',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.cxBlack,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: _plateController,
          textCapitalization: TextCapitalization.characters,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9A-Za-z]')),
            LengthLimitingTextInputFormatter(10),
            _PlateNumberFormatter(),
          ],
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.next,
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
            hintText: '01 A 234 BC',
            hintStyle: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey.shade400,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildImagePicker() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Foto qo\'shish',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.cxBlack,
          ),
        ),
        SizedBox(height: 8.h),
        InkWell(
          onTap: _pickImage,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 16.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(30.r),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.image_outlined,
                  color: Colors.teal.shade300,
                  size: 21.sp,
                ),
                SizedBox(width: 8.w),
                Expanded(
                  child: Text(
                    _selectedImage?.name ?? '',
                    style: TextStyle(fontSize: 14.sp),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  size: 20.sp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// Custom formatter for Uzbekistan plate numbers
// Format: 01 A 234 BC (2 digits + 1 letter + 3 digits + 2 letters)
class _PlateNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.toUpperCase().replaceAll(' ', '');
    final buffer = StringBuffer();
    
    for (int i = 0; i < text.length; i++) {
      // Add space after 2nd digit
      if (i == 2) {
        buffer.write(' ');
      }
      // Add space after 1st letter (position 3 in formatted string)
      else if (i == 3) {
        buffer.write(' ');
      }
      // Add space after 3 more digits (position 6 in formatted string)
      else if (i == 6) {
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
