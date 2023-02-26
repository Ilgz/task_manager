import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart' hide User;
import 'package:flutter_test/flutter_test.dart';
import 'package:injectable/injectable.dart' hide test;
import 'package:mockito/annotations.dart';
import 'package:task_manager/domain/auth/i_auth_facade.dart';
import 'package:task_manager/domain/auth/value_objects.dart';
import 'package:task_manager/domain/projects/i_project_repository.dart';
import 'package:task_manager/domain/projects/project.dart';
import 'package:task_manager/domain/projects/value_objects.dart';
import 'package:task_manager/domain/users/user.dart';
import 'package:task_manager/infrastructure/auth/firebase_auth_facade.dart';
import 'package:task_manager/infrastructure/projects/project_repository.dart';
import 'package:task_manager/injection.dart';

import '../../fixtures/faker.dart';

@GenerateMocks([])
void main() async {
  late IAuthFacade authFacade1, authFacade2;
  late MockFirebaseAuth firebaseAuth1, firebaseAuth2;
  late FakeFirebaseFirestore firestore1, firestore2;
  late IProjectRepository projectRepository1, projectRepository2;
  late Project mockProject;
  setUpAll(() async => await configureInjection(Environment.test));
  setUp(() async {
    firestore1 = FakeFirebaseFirestore();
    firestore2 = FakeFirebaseFirestore();
    firebaseAuth1 = MockFirebaseAuth();
    firebaseAuth2 = MockFirebaseAuth();
    authFacade1 = FirebaseAuthFacade(firebaseAuth1, firestore1);
    authFacade2 = FirebaseAuthFacade(firebaseAuth2, firestore2);
    projectRepository1 = ProjectRepository(firestore1, authFacade1);
    projectRepository2 = ProjectRepository(firestore2, authFacade2);
    await authFacade1.registerWithEmailAndPassword(
        userName: UserName(getRandomName()),
        emailAddress: EmailAddress(getRandomEmail()),
        password: Password(getRandomString(12)));
    await authFacade2.registerWithEmailAndPassword(
        userName: UserName(getRandomName()),
        emailAddress: EmailAddress(getRandomEmail()),
        password: Password(getRandomString(12)));
    mockProject = Project.empty(firebaseFirestore: firestore1).copyWith(
        reference: firestore1.doc("projects/mock_id"),
        members: [
          User.empty(firebaseFirestore: firestore1)
              .copyWith(reference: firestore1.doc("projects/mock_id"))
        ],
        projectName: ProjectName(getRandomName()));
    await projectRepository1.createProject(mockProject, documentId: "mock_id");
  });

  group("GetProjects", () {
    test(
      "should return a list of Projects when the response code is 200 (success)",
      () async {
        final projectsStream =
            await projectRepository1.watchAllProjects().first;
        final value = projectsStream.fold(
            (l) => false,
            (projects) => projects
                .where((project) => !project.failureOption.isNone())
                .isEmpty);

        expect(value, true);
      },
    );
  });
  group("CreateProject", () {
    test(
      "should perform a POST request to the network to create the project with the given name",
      () async {
        final value = await projectRepository1.createProject(
            Project.empty(firebaseFirestore: firestore1)
                .copyWith(projectName: ProjectName(getRandomName())));
        expect(value.isRight(), true);
      },
    );
  });
  group("CreateProject", () {
    test(
      "should perform a POST request to the network to create the project with the given name",
      () async {
        final value = await projectRepository1.createProject(
            Project.empty(firebaseFirestore: firestore1)
                .copyWith(projectName: ProjectName(getRandomName())));
        expect(value.isRight(), true);
      },
    );
  });
  group("UpdateProject", () {
    test(
      "should perform a PUT request to the network to update the project with the given name",
      () async {
        final value = await projectRepository1.updateProject(
            mockProject.copyWith(projectName: ProjectName(getRandomName())));
        expect(value.isRight(), true);
      },
    );
  });

  group("UpdateProject", () {
    test(
      "should perform a PUT request to the network to update the project with the given name",
      () async {
        final value = await projectRepository1.updateProject(
            mockProject.copyWith(projectName: ProjectName(getRandomName())));
        expect(value.isRight(), true);
      },
    );
  });
  group("DeleteProject", () {
    test(
      "should perform a DELETE request to the network to delete the project with the given id",
      () async {
        final value = await projectRepository1.deleteProject(mockProject);
        expect(value.isRight(), true);
      },
    );
  });
  group("ChangeProjectPublicity", () {
    test(
      "should perform a POST request to the network to change the project publicity with the given id",
      () async {
        final value =
            await projectRepository1.changePublicityStatus(mockProject);
        expect(value.isRight(), true);
      },
    );
  });
}
