import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/controller/registration_controller.dart';
import 'package:bestrateapp/screens/registration_helper_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class RegistrationScreen1 extends StatefulWidget {
  const RegistrationScreen1({super.key});

  @override
  State<RegistrationScreen1> createState() => _RegistrationScreen1State();
}

class _RegistrationScreen1State extends State<RegistrationScreen1> {
  List<Widget> registrationScreens = [
    BuyerInformationScreen(),
    BusinessDetails()
  ];
  final registrationController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<RegistrationController>(
        init: RegistrationController(),
          builder: (RegistrationController registrationController) {
        return Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (registrationController.selectedPage > 0){
                        registrationController.updateRegistrationPage(registrationController.selectedPage - 1);
                      }else{
                       Navigator.pop(context);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                      child: Image.asset('assets/images/arrow_back_image.png'),
                    ),
                  ),
                  Expanded(
                    child: Padding(padding: EdgeInsets.fromLTRB(72, 10, 0, 0),
                      child: Text("Create an Account", style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),),),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: registrationScreens.map((e) =>
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: registrationController.selectedPage == registrationScreens.indexOf(e)
                            ? BestRateColorConstant.appPrimaryColor
                            : BestRateColorConstant.appSecondaryColor,

                      ),
                    ),
                  )).toList(

              ),
            ),
            Expanded(child: registrationScreens[registrationController.selectedPage])
          ],
        );
      }),
    );
  }
}
