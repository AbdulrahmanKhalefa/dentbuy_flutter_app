import 'dart:io';

import 'package:dentbuy_flutter_app/core/constants/app_assets.dart';
import 'package:dentbuy_flutter_app/core/utils/app_colors.dart';
import 'package:dentbuy_flutter_app/feature/home/page/clinics_screen.dart';
import 'package:dentbuy_flutter_app/feature/home/page/tools_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();
  File? _selectedImage;
  String _selectedCategory = 'Clinic for sale';

  final List<String> _categories = [
    'Clinic for sale',
    'New tools',
    'Clinic for rent',
    'Used tools',
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      maxWidth: 1200,
      imageQuality: 80,
    );

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '$_selectedCategory listing created successfully!',
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 2),
        ),
      );

      _titleController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedCategory = 'Clinic for sale';
        _selectedImage = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black12,
        automaticallyImplyLeading: false,
        toolbarHeight: 60,
        titleSpacing: 12,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [

            // ── Row 1: Logo + Categories ───────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SvgPicture.asset(
                  AppAssets.logoSvg,
                  width: 36,
                  colorFilter: ColorFilter.mode(AppColors.primary, BlendMode.srcIn),
                ),

                SizedBox(width: 40),

                // Clinics
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ClinicsScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1),
                        ),
                        child: Icon(Icons.maps_home_work, size: 14, color: AppColors.primary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Clinics',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 30),

                // Tools
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ToolsScreen()),
                    );
                  },
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary.withOpacity(0.1),
                        ),
                        child: Icon(Icons.handyman, size: 14, color: AppColors.primary),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Tools',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.primary),
                      ),
                    ],
                  ),
                ),

                Spacer(),

                // Notification
               
              ],
            ),

            SizedBox(height: 6),

          ],
        ),
      ),
      
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.shade300, width: 1.4),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: _selectedImage == null
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera_alt, size: 40, color: Colors.grey.shade600),
                                const SizedBox(height: 12),
                                Text(
                                  'Add Image',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  'Tap to choose a photo from gallery',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Image.file(
                            _selectedImage!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10),
                    value: _selectedCategory,
                    isExpanded: true,
                    underline: const SizedBox(),
                    items: _categories.map((category) {
                      return DropdownMenuItem(value: category, child: Text(category));
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value ?? _selectedCategory;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Title',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _titleController,
                  decoration: InputDecoration(
                    hintText: 'Enter title',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  ),
                  validator: (value) => (value == null || value.isEmpty) ? 'Please enter a title' : null,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                    hintText: 'Enter description',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                  ),
                  validator: (value) => (value == null || value.isEmpty) ? 'Please enter a description' : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text(
                      'Create Listing',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold ,color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
