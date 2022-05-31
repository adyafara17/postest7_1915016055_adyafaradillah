import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController extends GetxController {
  var user = FirebaseFirestore.instance.collection("user").obs;
}
