import 'package:dartz/dartz.dart';
import 'package:task_manager/domain/projects/project_failure.dart';

abstract class IThemeSwitcherFacade{
  bool isDarkThemeEnabled();
  Future<Unit> switchSelectedTheme();
}