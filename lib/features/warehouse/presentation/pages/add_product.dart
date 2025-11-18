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
  final _nomiController = TextEditingController();
  final _yiliController = TextEditingController();
  final _davlatRaqamiController = TextEditingController();
  final _narxiController = TextEditingController();
  final _izohController = TextEditingController();
  
  String? _selectedRangi;
  String? _selectedYurgani;
  String? _selectedUzatmalar;
  String? _selectedYoqilgi;
  String? _selectedOlinganJoy;
  XFile? _selectedImage;
  
  final List<String> _ranglar = ['Qora', 'Oq', 'Kulrang', 'Qizil', 'Ko\'k'];
  final List<String> _yurganlar = ['O\'zbekiston', 'Rossiya', 'Xitoy', 'Koreya', 'Yaponiya'];
  final List<String> _uzatmalarQutisi = ['Mexanika', 'Avtomat', 'Robot'];
  final List<String> _yoqilgiTurlari = ['Benzin', 'Dizel', 'Gaz', 'Elektr', 'Gibrid'];
  final List<String> _olinganJoylar = ['Toshkent', 'Samarqand', 'Buxoro', 'Andijon', 'Farg\'ona'];
  
  final ImagePicker _picker = ImagePicker();
  
  @override
  void dispose() {
    _nomiController.dispose();
    _yiliController.dispose();
    _davlatRaqamiController.dispose();
    _narxiController.dispose();
    _izohController.dispose();
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
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Row(
              children: [
                Expanded(
                  child: _buildTextField(
                    label: 'Nomi',
                    controller: _nomiController,
                  ),
                ),
                SizedBox(width: 12.w,),
                Expanded(
                  child: _buildDropdown(
                    label: 'Yili',
                    value: _selectedYurgani,
                    items: List.generate(30, (index) => (2025 - index).toString()),
                    onChanged: (value) => setState(() => _selectedYurgani = value),
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
                    value: _selectedRangi,
                    items: _ranglar,
                    onChanged: (value) => setState(() => _selectedRangi = value),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    label: 'Yurgani',
                    controller: TextEditingController(),
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
                    value: _selectedUzatmalar,
                    items: _uzatmalarQutisi,
                    onChanged: (value) => setState(() => _selectedUzatmalar = value),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildDropdown(
                    label: 'Yoqilg\'i turi',
                    value: _selectedYoqilgi,
                    items: _yoqilgiTurlari,
                    onChanged: (value) => setState(() => _selectedYoqilgi = value),
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
                    controller: _davlatRaqamiController,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildTextField(
                    label: 'Narxi',
                    controller: _narxiController,
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
                    value: _selectedOlinganJoy,
                    items: _olinganJoylar,
                    onChanged: (value) => setState(() => _selectedOlinganJoy = value),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            _buildTextField(
              label: 'Izoh',
              controller: _izohController,
              maxLines: 3,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              height: 56,
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
    );
  }
  
  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
    int maxLines = 1,
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
