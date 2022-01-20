import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:koko/model/authorize.dart';
import 'package:koko/model/base_response.dart';
import 'package:koko/model/login.dart';
import 'package:koko/model/todo.dart';
import 'package:koko/view/detail/detail_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Todo? todo;
  TextEditingController phoneNumberController =
      TextEditingController(text: "012321312");
  TextEditingController passwordController =
      TextEditingController(text: "Codingate@12");

  var client = http.Client();

  void createAuthorize(BuildContext context) async {
    var uri = Uri.parse("http://pandago-api-dev.codingate.com/api/authorize");
    var body = {"device_os": "Android"};
    var response = await client.post(
      uri,
      body: body,
    );
    var jsonValue = jsonDecode(response.body);
    BaseResponse baseResponse = BaseResponse.fromJson(jsonValue, jsonValue["data"] == null ? null : Authorize.fromJson(jsonValue['data']));
    if(baseResponse.success == true) {
      Authorize authorize = baseResponse.data as Authorize;
      print(authorize.toJson());
      login(authorize.token, context);
    } else {
      print(baseResponse.message);
    }
  }

  void login(String authorize, BuildContext context) async {
    var uri =
        Uri.parse("http://pandago-api-dev.codingate.com/api/vendor/auth/login");
    var body = {
      "phone": phoneNumberController.text,
      "password": passwordController.text,
    };
    var header = {
      "Authorize": authorize,
      "Accept": "application/json",
      "Content-Type": "application/x-www-form-urlencoded"
    };
    var response = await client.post(uri, body: body, headers: header);
    var jsonValue = jsonDecode(response.body);

    try {
      BaseResponse baseResponse = BaseResponse.fromJson(jsonValue, jsonValue["data"] == null ? null : Login.fromJson(jsonValue["data"]));
      if(baseResponse.success == true) {
        Login login  = baseResponse.data as Login;
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailView()));
      } else {
        Fluttertoast.showToast(
            msg: "${baseResponse.message}",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0
        );
      }
    } catch (_) {
      Fluttertoast.showToast(
          msg: "Something went wrong",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) async {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.appName),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              children: [
                TextField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(hintText: "Phone number"),
                ),
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
                OutlinedButton(
                  onPressed: () {
                    createAuthorize(context);
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // getTodo();
        },
        child: const Text("DATA"),
      ),
    );
  }
}
