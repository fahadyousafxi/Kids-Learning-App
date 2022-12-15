import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBar1{
  showErrorSnak({IconData? icon, String? title, description}){
    Get.snackbar(title??"Wrong Answer", description??"Good luck! Next Time",
    icon: Icon(icon??Icons.error, color: Colors.red),
      margin: EdgeInsets.only(top: 20,right: 30,left: 30),
    );
  }
  showCorrectSnak({IconData? icon, String? title, description}){
    Get.snackbar(title??"Correct Answer", description??"Very Good! Go Next",
    icon: Icon(icon??Icons.done, color: Colors.green),
      margin: EdgeInsets.only(top: 20,right: 30,left: 30),
    );
  }
}