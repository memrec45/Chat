import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.allowReassignment = true;
}
