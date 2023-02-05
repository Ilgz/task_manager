import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager/injection.config.dart';
final GetIt getIt=GetIt.instance;
@injectableInit
Future<void> configureInjection(String env) async{
  await getIt.init(environment:env);
}