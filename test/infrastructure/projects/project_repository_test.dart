// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:task_manager/infrastructure/auth/firebase_auth_facade.dart';
// import 'package:task_manager/infrastructure/projects/project_repository.dart';
//
// void main() async {
//   group("testing projectRepository", () {
//     setUp(() async {});
//
//     test("firestore test", () async {
//       final firestore = FakeFirebaseFirestore();
//       // final authFacade=MockFirebaseAuthFacade();
//       final authFacade = FirebaseAuthFacade(firebaseAuth, firestore);
//       final repository = ProjectRepository(firestore, authFacade);
//       //TODO  when(authFacade.getSignedInUserId()).thenReturn(some("qe2810xla"));
//       //TODO expect(authFacade.getSignedInUserId(), some("qe2810xlo"));
//       // final response= await firestore.collection("messages").add({
//       //    'message': 'Hello world!'Т,
//       //    'created_at': FieldValue.serverTimestamp(),
//       //  });
//       // expect(response.id, "fd");
//       // expect(repository.createProject(Project.empty(firebaseFirestore: firestore)), right(unit));
//       // when(projectRepository.createProject(Project.empty())).thenReturn(Future.value(right<FirebaseFirestoreFailure, Unit>(unit)));
//       // final createdProject=await projectRepository.createProject(Project.empty());
//       // expect(createdProject, unit);
//       // final projectRepo=projectRepository.watchAllProjects();
//       // expect(projectRepo, emitsInOrder(
//       //   [emitsThrough(0), emitsDone],
//       // ),);
//     });
//     test("initial", () {
//       expect(2, 4 / 2);
//     });
//   });
// }
