import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web/home/home_page.dart';
import 'package:go_router/go_router.dart';
import 'package:rive/rive.dart';
import '../go_router/app_routes_constants.dart';

class UserInput extends StatefulWidget {
  const UserInput({Key? key}) : super(key: key);

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  TextEditingController userInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/welcome.jpg',height: 300,width: 800,),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: SizedBox(
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: userInput,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Can\'t be empty';
                  } else {
                    return null;
                  }
                },
                onChanged: (value) {},
                decoration: InputDecoration(
                    errorStyle: const TextStyle(
                      color: Colors.red,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide:
                          const BorderSide(color: Colors.black, width: 1.0),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(width: 1, color: Colors.red),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          width: 1,
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: "What do you want? Remote/WFO",
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                GoRouter.of(context)
                    .pushNamed(AppRouteNames.homeRouteName,  queryParams:{
                'workMode':userInput.text
                } ,);
              },
              child: const Text("Submit"))
        ],
      ),
    );
  }
}
