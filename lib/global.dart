import 'package:driversapp/model/driverdata.dart';
import 'package:driversapp/model/usermodel.dart';
import 'package:driversapp/widgets/directiondetailinfo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

User? currentUser;
UserModel? userModelCurrentInfo;

DirectionsDetailsInfo? tripDirectionDetailsInfo;
DriverData onlineDriverData = DriverData();
String? drivervehicleType = "";
String userDropOffAddress = "";
Future<void> fetchCurrentUserInfo() async {
  currentUser = firebaseAuth.currentUser;
  if (currentUser != null) {
    DatabaseReference userRef =
        FirebaseDatabase.instance.ref().child("users").child(currentUser!.uid);
    DataSnapshot snapshot = await userRef.get();
    if (snapshot.exists) {
      userModelCurrentInfo = UserModel.fromSnapshot(snapshot);
    }
  }
}
