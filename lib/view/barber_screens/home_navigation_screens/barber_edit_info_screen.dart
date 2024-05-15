import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/utils/validations/auth_validator.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_auth_button.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_edit_text_field.dart';
import 'package:n3imn_project_team/view_model/barber_edit_info_view_model.dart';

class BarberEditInfoScreen extends StatefulWidget {
  const BarberEditInfoScreen({super.key});

  @override
  State<BarberEditInfoScreen> createState() => _BarberEditInfoScreenState();
}

class _BarberEditInfoScreenState extends State<BarberEditInfoScreen> {
    final BarberSalonEditInfoViewModel barberEditInfoViewModel =
       BarberSalonEditInfoViewModel();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  getData() async {
    final barberSalon = await barberEditInfoViewModel.loadBarberData();
    barberEditInfoViewModel.shopNameController.text = barberSalon!.shopName;
    barberEditInfoViewModel.emailController.text = barberSalon.email;
    barberEditInfoViewModel.phoneController.text = barberSalon.phoneNumber;
    barberEditInfoViewModel.locationController.text = barberSalon.location;

  }

  @override
  void initState() {
    getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: AppColor.TEXT_SECONDARY, size: 30),
          backgroundColor: AppColor.PRIMARY,
          title: const Text(
            "ُEdit Services",
            style: TextStyle(
              fontSize: 20,
              color: AppColor.TEXT_SECONDARY,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        backgroundColor: AppColor.TEXT_SECONDARY,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Form(
                  key: formState,
                    child: Column(children: [
                  CustomEditTextField(
                    labelName: "Salon name",
                    validator: AuthValidator.validSalonName,
                    textEditingController: barberEditInfoViewModel.shopNameController,
                    obsecureText: false,
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomEditTextField(
                    labelName: "E-Mail",
                    validator: AuthValidator.validSalonName,
                    textEditingController: barberEditInfoViewModel.emailController,
                    obsecureText: false,
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomEditTextField(
                    labelName: "Location",
                    validator: AuthValidator.validSalonName,
                    textEditingController: barberEditInfoViewModel.locationController,
                    obsecureText: false,
                    icon: Icons.location_on_outlined,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomEditTextField(
                    labelName: "Phone number",
                    validator: AuthValidator.validSalonName,
                    textEditingController: barberEditInfoViewModel.phoneController,
                    obsecureText: false,
                    icon: Icons.phone_outlined,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                   CsutomAuthButton(
                    buttonText: 'Update Informaition',
                    textStyle: const TextStyle(
                      color: AppColor.TEXT_SECONDARY,
                      fontSize: 20,
                    ),
                    onPressed: (){
                      barberEditInfoViewModel.updateBarberProfile(context, formState);
                    },
                  )
                ])),
              ],
            ),
          ),
        ));
  }
}
