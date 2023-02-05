import 'package:flutter/material.dart';

class PageRoutes{
  static const signInPage="/sign_in_page";
  static const signUpPage="/sign_up_page";
  static const usersOverviewPage="/user_overview_page";
  static const userProjectsListPage="user_projects_list_page";
  static const membersPage="members_page";
  static const projectsOverviewPage="/projects_overview_page";
  static const chatsOverviewPage="/chats_overview_page";
  static const chatPage="chat_page";
  static const tasksOverviewPage="tasks_overview_page";
  static const profilePage="/profile_page";
}
class AppColorConstants{
  static const lightScaffoldBackgroundColor=Color(0xffDCFFD9);
  static const darkScaffoldBackgroundColor=Color(0xFF1C7549);
  static const lightPrimaryColor=Color(0xff74D25D);
  static const darkPrimaryColor=Colors.green;
}
class AppConstants{
  static const myServer="127.0.0.1:8000";
  static const isDark="is_dark";
}