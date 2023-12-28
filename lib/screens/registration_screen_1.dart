import 'package:bestrateapp/constant/best_rate_color_constant.dart';
import 'package:bestrateapp/screens/registration_helper_class.dart';
import 'package:flutter/material.dart';
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
  int selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(padding: EdgeInsets.all(10),
                    child: Image.asset('assets/images/arrow_back_image.png'),
                  ),
                ),
                Expanded(child: Center(
                  child: Padding(padding: EdgeInsets.fromLTRB(0,10,0,0),
                    child: Text("Create an Account", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold, color: Colors.black),),),
                ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: registrationScreens.map((e) => Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                height: 4,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: selectedPage == registrationScreens.indexOf(e) ? BestRateColorConstant.appPrimaryColor : BestRateColorConstant.appSecondaryColor,

                ),
              ),
            )).toList(

            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.only(right: 8.0),
          //   child: SizedBox(
          //     height: 4,
          //     child: Center(
          //       child: ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: registrationScreens.length,
          //           itemBuilder: (context,index){
          //         return Container(
          //           width: 80,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(10),
          //             color: selectedPage == index ? BestRateColorConstant.appPrimaryColor : BestRateColorConstant.appSecondaryColor,
          //
          //           ),
          //         );
          //       }),
          //     ),
          //   ),
          // ),
          Expanded(child: registrationScreens[selectedPage])
        ],
      ),
    );
  }
}
