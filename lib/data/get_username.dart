import 'dart:developer';
import 'package:apppp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<UserModel?> getUserName()async{
  try{
    User? user= FirebaseAuth.instance.currentUser;
    if (user == null) return null;
    String userId =user.uid;
   DocumentSnapshot userData= await FirebaseFirestore.instance.collection("user").doc(userId).get();
   if(userData.exists && userData.data() != null)
   {
    return UserModel.fromJson(userData.data());
   }
  else
  {
    return null;
  }
  }catch(e){log(e.toString());
  return null;
  }
}
