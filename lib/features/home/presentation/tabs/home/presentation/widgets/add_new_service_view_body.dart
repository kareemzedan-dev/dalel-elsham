import 'package:dalel_elsham/core/cache/shared_preferences.dart';
import 'package:dalel_elsham/core/utils/assets_manager.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/categories/get_all_categories_view_model/get_all_categories_view_model.dart';
import 'package:dalel_elsham/features/home/presentation/tabs/home/presentation/manager/categories/get_all_categories_view_model/get_all_categories_view_model_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import '../../../../../../../core/components/category_dropdown_widget.dart';
import '../../../../../../../core/components/contact_button_card.dart';
import '../../../../../../../core/components/custom_button.dart';
import '../../../../../../../core/components/custom_text_field.dart';
import '../../../../../../../core/components/mobile_number_field.dart';
import '../../../../../../../core/services/image_upload_service.dart';
import '../../../../../../../core/utils/colors_manager.dart';
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
  final mapUrlController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? logoPath;
  String? selectedCategory;
  List<String> imagesUrls = [];

  bool callSelected = true;
  bool whatsappSelected = false;

  String getHint() {
    if (!callSelected && !whatsappSelected) return "يرجى اختيار طريقة تواصل";
    if (callSelected && whatsappSelected) return "اتصال + واتس اب";
    if (callSelected) return "اتصال";
    if (whatsappSelected) return "واتس اب";
    return "يرجى اختيار طريقة تواصل";
  }

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
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon ✔
                      Container(
                        width: 70.w,
                        height: 70.h,
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.check_rounded,
                          color: Colors.green,
                          size: 40.sp,
                        ),
                      ),

                      SizedBox(height: 16),

                      // Title
                      Text(
                        "تم إرسال إعلانك بنجاح",
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 10.h),

                      // Description
                      Text(
                        "إعلانك الآن قيد المراجعة من قبل فريق دليل الشام.\n"
                        "سيتم إشعارك عند الموافقة عليه ونشره.",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 20),

                      // Button
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          minimumSize: Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context); // Close Dialog
                          Navigator.pop(context); // Back to previous page
                        },
                        child: Text(
                          "حسنًا",
                          style: TextStyle(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
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
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================= LOGO + PROJECT NAME =================
                      Row(
                        children: [
                          // LOGO VALIDATOR
                          FormField<String>(
                            validator: (value) {
                              if (logoPath == null || logoPath!.isEmpty) {
                                return 'الرجاء اختيار لوجو';
                              }
                              return null;
                            },
                            builder: (fieldState) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  LogoPickerBox(
                                    onPicked: (result) async {
                                      final url = await uploader.uploadImage(
                                        bytes: result.bytes!,
                                        bucket: "projects",
                                        folder: "logos",
                                      );
                                      if (url != null) {
                                        setState(() => logoPath = url);
                                        fieldState.didChange(url);
                                      }
                                    },
                                  ),
                                  if (fieldState.hasError)
                                    Padding(
                                      padding: const EdgeInsets.only(top: 8),
                                      child: Text(
                                        fieldState.errorText!,
                                        style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                ],
                              );
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
                                  keyboardType: TextInputType.multiline,
                                  textEditingController: descController,
                                  minLines: 1,
                                  maxLines: null,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 20.h),

                      // ================= CATEGORY DROPDOWN + VALIDATOR =================
                      FormField<String>(
                        validator: (value) {
                          if (selectedCategory == null ||
                              selectedCategory!.isEmpty) {
                            return "الرجاء اختيار فئة";
                          }
                          return null;
                        },
                        builder: (fieldState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BlocBuilder<
                                GetAllCategoriesViewModel,
                                GetAllCategoriesViewModelStates
                              >(
                                builder: (context, state) {
                                  if (state
                                      is GetAllCategoriesViewModelLoading) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }

                                  final List<CategoryEntity> categories =
                                      state is GetAllCategoriesViewModelSuccess
                                      ? state.categories
                                      : [];

                                  CategoryEntity? selectedEntity;

                                  if (selectedCategory != null) {
                                    selectedEntity = categories
                                        .where(
                                          (cat) => cat.id == selectedCategory,
                                        )
                                        .firstOrNull; // يرجع null لو مش لاقي
                                  }

                                  return CategoryDropdownWidget(
                                    categories: categories,
                                    selectedValue: selectedEntity,
                                    onChanged: (value) {
                                      setState(
                                        () => selectedCategory = value?.id,
                                      );
                                      fieldState.didChange(value?.id);
                                    },
                                  );
                                },
                              ),

                              if (fieldState.hasError)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Text(
                                    fieldState.errorText!,
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: 20.h),
                      Text(
                        "موقع مشروعك",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: ColorsManager.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      // ================= LOCATION =================
                      CustomTextFormField(
                        hintText: "دمشق - حي ال……",
                        keyboardType: TextInputType.text,
                        textEditingController: locationController,
                      ),

                      SizedBox(height: 20.h),

                      // ================= CONTACT BUTTONS =================
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() => callSelected = !callSelected);
                            },
                            child: ContactButtonCard(
                              image: AssetsManager.phoneCall,
                              color: callSelected
                                  ? ColorsManager.primaryColor
                                  : Colors.grey,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Icon(
                            Icons.add,
                            color: ColorsManager.primaryColor,
                            size: 24.sp,
                          ),
                          SizedBox(width: 5.w),
                          GestureDetector(
                            onTap: () {
                              setState(
                                () => whatsappSelected = !whatsappSelected,
                              );
                            },
                            child: ContactButtonCard(
                              image: AssetsManager.whatsapp,
                              color: whatsappSelected
                                  ? ColorsManager.primaryColor
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 12.h),

                      // ================= PHONE FIELD =================
                      MobileNumberField(
                        controller: phoneController,
                        hintText: getHint(),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "رقم الهاتف مطلوب";
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "رابط موقعك على الخريطة ( اختياري )",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: ColorsManager.black.withOpacity(0.5),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      CustomTextFormField(
                        hintText: "https://goo.gl/maps/xxxx",
                        keyboardType: TextInputType.text,
                        textEditingController: mapUrlController,
                      ),
                      SizedBox(height: 20.h),

                      // ================= IMAGES GROUP =================
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

                      // ================= SUBMIT BUTTON =================
                      CustomButton(
                        text: "أضف اعلانك",
                        onPressed: isLoading
                            ? null
                            : () {
                                if (!_formKey.currentState!.validate()) return;

                                if (selectedCategory == null) {
                                  return _showError("اختر الفئة");
                                }

                                final id = const Uuid().v4();
                                final savedUserId = SharedPrefHelper.getString(
                                  "user_id",
                                );

                                if (savedUserId == null ||
                                    savedUserId.isEmpty) {
                                  return _showError(
                                    "لا يوجد مستخدم مسجل الدخول.",
                                  );
                                }

                                final String finalPhone = callSelected
                                    ? phoneController.text.trim()
                                    : "";

                                final String finalWhatsapp = whatsappSelected
                                    ? phoneController.text.trim()
                                    : "";

                                context
                                    .read<AddNewServiceViewModel>()
                                    .addProject(
                                      ProjectEntity(
                                        id: id,
                                        title: titleController.text.trim(),
                                        description: descController.text.trim(),
                                        categoryTitle: selectedCategory ?? "",
                                        logo: logoPath!,
                                        images: imagesUrls,
                                        additionalImages: [],
                                        phone: finalPhone,
                                        whatsapp: finalWhatsapp,
                                        location: locationController.text
                                            .trim(),
                                        isActive: true,
                                        duration: "غير محدد",
                                        tier: "normal",
                                        status: "pending",
                                        createdAt: DateTime.now()
                                            .toIso8601String(),
                                        mapLink:
                                            mapUrlController.text.trim().isEmpty
                                            ? ""
                                            : mapUrlController.text.trim(),

                                        facebook: "",
                                        instagram: "",
                                        website: "",
                                        views: 0,
                                        workTimeFrom: "",
                                        workTimeTo: "",
                                        displaySections: [],
                                        viewCountOn: false,
                                        userId: savedUserId,
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
