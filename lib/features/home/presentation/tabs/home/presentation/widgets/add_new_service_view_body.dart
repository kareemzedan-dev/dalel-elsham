import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/categories/get_all_categories_view_model/get_all_categories_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/categories/get_all_categories_view_model/get_all_categories_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../../core/components/category_dropdown_widget.dart';
import '../../../../../../../core/components/custom_button.dart';
import '../../../../../../../core/components/custom_text_field.dart';
import '../../../../../../../core/components/mobile_number_field.dart';
import '../../../../../../../core/services/image_upload_service.dart';
import '../../../../../../../core/utils/colors_manager.dart';
import '../../../../../../../core/validators/project_validators.dart';
import '../../domain/entities/category_entity.dart';
import '../../domain/entities/project_entity.dart';
import '../manager/projects/add_project_view_model/add_project_view_model.dart';
import '../manager/projects/add_project_view_model/add_project_view_model_states.dart';
import 'images_group_box.dart';
import 'logo_picker_box.dart';

class AddNewServiceViewBody extends StatefulWidget {
  const AddNewServiceViewBody({super.key});

  @override
  State<AddNewServiceViewBody> createState() => _AddNewServiceViewBodyState();
}

class _AddNewServiceViewBodyState extends State<AddNewServiceViewBody> {
  final titleController = TextEditingController();
  final descController = TextEditingController();
  final phoneController = TextEditingController();
  final locationController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? logoPath;
  String? selectedCategory;
  List<String> imagesUrls = [];

  final ImageUploadService uploader = ImageUploadService();

  void _showError(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.red));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddNewServiceViewModel, AddNewServiceViewModelStates>(
      listener: (context, state) {
        if (state is AddProjectViewModelSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("تم إضافة الإعلان بنجاح ✔"),
              backgroundColor: Colors.green,
            ),
          );
          Navigator.pop(context);
        }

        if (state is AddProjectViewModelError) {
          _showError(state.message);
        }
      },

      builder: (context, state) {
        final isLoading = state is AddProjectViewModelLoading;

        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: _formKey, // ← مهم جداً
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          LogoPickerBox(
                            onPicked: (result) async {
                              if (result.bytes == null) return;

                              final url = await uploader.uploadImage(
                                bytes: result.bytes!,
                                bucket: "projects",
                                folder: "logos",
                              );

                              if (url != null) {
                                setState(() => logoPath = url);
                              }
                            },
                          ),

                          SizedBox(width: 12.w),

                          Expanded(
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  hintText: "اسم المشروع",
                                  keyboardType: TextInputType.text,
                                  textEditingController: titleController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "اسم المشروع مطلوب";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(height: 12.h),
                                CustomTextFormField(
                                  hintText: "وصف المشروع",
                                  keyboardType: TextInputType.text,
                                  textEditingController: descController,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return "وصف المشروع مطلوب";
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      BlocBuilder<
                        GetAllCategoriesViewModel,
                        GetAllCategoriesViewModelStates
                      >(
                        builder: (context, state) {
                          final categories =
                              state is GetAllCategoriesViewModelSuccess
                              ? state.categories
                              : <CategoryEntity>[];

                          CategoryEntity? selectedEntity;

                          if (selectedCategory != null) {
                            try {
                              selectedEntity = categories.firstWhere(
                                (e) => e.id == selectedCategory,
                              );
                            } catch (_) {}
                          }

                          return CategoryDropdownWidget(
                            categories: categories,
                            selectedValue: selectedEntity,
                            onTap: () {
                              context
                                  .read<GetAllCategoriesViewModel>()
                                  .getAllCategories();
                            },
                            onChanged: (value) {
                              setState(() => selectedCategory = value?.id);
                            },
                          );
                        },
                      ),

                      SizedBox(height: 20.h),

                      CustomTextFormField(
                        hintText: "الموقع",
                        keyboardType: TextInputType.text,
                        textEditingController: locationController,
                      ),

                      SizedBox(height: 20.h),

                      MobileNumberField(
                        controller: phoneController,
                        hintText: "اتصال + واتس اب",
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "رقم الهاتف مطلوب";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 20.h),

                      Text(
                        "اختياري (اضف صور خاصه بمشروعك)",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: ColorsManager.black.withOpacity(0.5),
                        ),
                      ),

                      SizedBox(height: 8.h),

                      ImagesGroupBox(
                        onImagesSelected: (pickedBytes) async {
                          List<String> urls = [];

                          for (var img in pickedBytes) {
                            final url = await uploader.uploadImage(
                              bytes: img,
                              bucket: "projects",
                              folder: "gallery",
                            );
                            if (url != null) urls.add(url);
                          }

                          setState(() => imagesUrls = urls);
                        },
                      ),

                      SizedBox(height: 60.h),

                      CustomButton(
                        text: "أضف اعلانك",
                        onPressed: isLoading
                            ? null
                            : () {
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }

                                if (selectedCategory == null) {
                                  return _showError("اختر الفئة");
                                }

                                final id = const Uuid().v4();

                                context
                                    .read<AddNewServiceViewModel>()
                                    .addProject(
                                      ProjectEntity(
                                        id: id,
                                        title: titleController.text.trim(),
                                        description: descController.text.trim(),
                                        categoryTitle: selectedCategory ?? "",
                                        logo: logoPath ?? "",
                                        images: imagesUrls,
                                        additionalImages: [],
                                        phone: phoneController.text.trim(),
                                        location: locationController.text
                                            .trim(),
                                        isActive: true,
                                        duration: "غير محدد",
                                        tier: "normal",
                                        status: "pending",
                                        createdAt: DateTime.now()
                                            .toIso8601String(),
                                        mapLink: "",
                                        whatsapp: phoneController.text.trim(),
                                        facebook: "",
                                        instagram: "",
                                        website: "",
                                        views: 0,
                                        workTimeFrom: "",
                                        workTimeTo: "",
                                        displaySections: [],
                                        viewCountOn: false,
                                      ),
                                    );
                              },
                      ),

                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),

            if (isLoading)
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black.withOpacity(0.25),
                child: const Center(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
          ],
        );
      },
    );
  }
}
