import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/constants/app_colors.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _yearController = TextEditingController();
  final _mileageController = TextEditingController();
  final _plateController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  String? _selectedColor;
  String? _selectedMileage;
  String? _selectedTransmission;
  String? _selectedFuelType;
  String? _selectedOrigin;
  XFile? _selectedImage;
  
  final List<String> _colors = ['Qora', 'Oq', 'Kulrang', 'Qizil', 'Ko\'k', 'Yashil'];
  // final List<String> _origin = ['O\'zbekiston', 'Rossiya', 'Xitoy', 'Koreya', 'Yaponiya'];
  final List<String> _transmission = ['Mexanika', 'Avtomat', 'Robot'];
  final List<String> _fuelType = ['Benzin', 'Dizel', 'Gaz', 'Elektr', 'Gibrid'];
  final List<String> _origin = ['Toshkent', 'Samarqand', 'Buxoro', 'Andijon', 'Farg\'ona', 'Xorazm', 'Jizzax', 'Namangan', 'Qashqadaryo', 'Surxondaryo', 'Qoraqalpogiston','Navoiy'];
  
  final ImagePicker _picker = ImagePicker();
  
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
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = image;
      });
    }
  }
  
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Handle form submission
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maxsulot qo\'shildi')),
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Nomi',
                    controller: _nameController,
                  ),
                ),
                SizedBox(width: 12.w,),
                Expanded(
                  child: _buildDropdown(
                    label: 'Yili',
                    value: _selectedMileage,
                    items: List.generate(30, (index) => (2025 - index).toString()),
                    onChanged: (value) => setState(() => _selectedMileage = value),
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
            const SizedBox(height: 16),
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
                const SizedBox(width: 12),
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
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Davlat raqami',
                    controller: _plateController,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    label: 'Narxi',
                    controller: _priceController,
                    keyboardType: TextInputType.number,
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
                const SizedBox(width: 12),
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
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.cxBlack,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                ),
                child: Text(
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
    );
  }
  
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
    String? suffixText,
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
          child: DropdownButtonFormField<String>(
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
