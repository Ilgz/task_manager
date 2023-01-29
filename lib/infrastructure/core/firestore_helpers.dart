import 'package:cloud_firestore/cloud_firestore.dart';
//
// extension FireStoreX on FirebaseFirestore{
//   Future<DocumentReference> userDocument()async{
//     final userOption=await getIt<IAuthFacade>().getSignedInUser();
//     final user=userOption.getOrElse(() => throw NotAuthenticatedError());
//     return FirebaseFirestore.instance.collection("users").doc(user.id.getOrCrash());
//   }
// }
extension FireStoreX on FirebaseFirestore{
  CollectionReference get projectCollection => collection("tasks");
}