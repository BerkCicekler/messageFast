import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messagefast/core/models/user_model.dart';

class FirebaseFireStoreMethods {


  static final FirebaseFireStoreMethods instance = FirebaseFireStoreMethods._();

  FirebaseFireStoreMethods._();

  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<Map<String,dynamic>?> getUserDatas({required String uId}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> result = await db.collection("users").doc(uId).get();
      if(result.exists) {
        Map<String, dynamic> userData = result.data() as Map<String, dynamic>;
        userData["uId"] = uId;
        userData["recievedFriendRequests"] = List<String>.from(userData["recievedFriendRequests"] as List);
        userData["sendedFriendRequests"] = List<String>.from(userData["sendedFriendRequests"] as List);
        userData["friends"] = List<String>.from(userData["friends"] as List);

        return userData;
      }else {
        return null;
      }
    } catch (e) {
      print("Something went wrong2");
    }
    return null;
  }

    Future<bool> createUserDatas({required String uId, required Map<String, dynamic> datas}) async {
    try {
      db.collection("users").doc(uId).set(datas).then((value) {
        print("user added");
      })
      .catchError((error) {
        print(error);
      });
      return false;
    } catch (e) {
      print("Something went wrong");
    }
    return false;
  }

  /// This function is specially created for searching users
  Future<Map<String,dynamic>> getUserByName(String name) async{
    try {
      var x = await db.collection("users").orderBy('userName').startAt([name]).endAt([name + '\uf8ff']).get();
      Map<String, dynamic> datas = {};
      for (var element in x.docs) {
        datas[element.id] = element.data();
      }
      return datas;
    } catch (e) {
      return {};
    }
  }

    /// This function is specially created for searching users
  Future<void> updateUsersOneValue(String index, String value) async{
    try {
      if (FirebaseAuth.instance.currentUser != null) {
        db.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({index: value});
      }
      
    } catch (e) {

    }
  }

  /// third argument is user's sended friend requests
  Future<bool> sendFriendRequest({required String senderId, required String targetId, required List<String> usersSendedFriendRequestsList}) async{
    try {
      var targetUserSnaphot = await getUserDatas(uId: targetId);
      if (targetUserSnaphot != null) {
        List<dynamic> targetUserFriendRequestsArray =targetUserSnaphot["recievedFriendRequests"];
        targetUserFriendRequestsArray.add(senderId);
        await db.collection("users").doc(targetId).update({'recievedFriendRequests': targetUserFriendRequestsArray});
        await db.collection("users").doc(senderId).update({'sendedFriendRequests': usersSendedFriendRequestsList});
        return true;
      }
    } catch (e) {
      return false;
    }
    return false;
  }

    Future<bool> isUserNameAvailable({required String userName}) async{
      try {
        var count = await db.collection("users").where("userName", isEqualTo: userName).get();
        return count.docs.isNotEmpty ? false : true; 
      } catch (e) {
        return false;
      }
    }

    Future<void> changeUserNameAndName({required String userName, required String name }) async{
      try {
        if (FirebaseAuth.instance.currentUser != null) {
          db.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).update({
          "name": name,
          "userName": userName
          });
        }
      } catch (e) {
      }
    }

    /// this function is created for get user's all friends information but can use for other purposes
    Future<List<UserModel>?> getAllUsersAsList({required List<String> usersUIdList}) async{
      try {
        List<UserModel> allFriends = [];
        for (var element in usersUIdList) {
          print(element);
          var x =await getUserDatas(uId: element);
          if (x != null) {
            allFriends.add(UserModel.fromMap(x));
          }
        }
        return allFriends;
      } catch (e) {
      }
      return null;
    }

        /// is a person refuses or accept a friend request this function will effect the database
    Future<void> friendRequestAction({required String targetUId, required bool isAccepted}) async{
      try {
        String clientUId = FirebaseAuth.instance.currentUser!.uid;
        var clientUserData = await getUserDatas(uId: clientUId);
        var targetUserData = await getUserDatas(uId: targetUId);
        if (clientUserData!= null && targetUserData != null) {
          List<String> clientRecievedFriendRequests =  clientUserData["recievedFriendRequests"];
          clientRecievedFriendRequests.remove(targetUId);
          List<String> targetSendedFriendRequests =  targetUserData["sendedFriendRequests"];
          targetSendedFriendRequests.remove(clientUId);
          db.collection("users").doc(clientUId).update({
            "recievedFriendRequests": clientRecievedFriendRequests
          });
          db.collection("users").doc(targetUId).update({
            "sendedFriendRequests": targetSendedFriendRequests
          });
          if (isAccepted) {
            List<String> targetFriends =  targetUserData["friends"];
            targetFriends.add(clientUId);
            List<String> clientFriends = clientUserData["friends"];
            clientFriends.add(targetUId);
            db.collection("users").doc(clientUId).update({
              "friends": clientFriends
            });
            db.collection("users").doc(targetUId).update({
              "friends": targetFriends
            });
          }
          
        }

      } catch (e) {
      }
    }

}