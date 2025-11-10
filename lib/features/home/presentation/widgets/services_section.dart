import 'package:dalel_elsham/features/home/presentation/widgets/projects_list.dart';
import 'package:dalel_elsham/features/home/presentation/widgets/section_widget.dart';
import 'package:dalel_elsham/features/home/presentation/widgets/services_list.dart';
import 'package:flutter/cupertino.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  SectionWidget(title: "خدماتنا", child: ServicesList());
  }
}
