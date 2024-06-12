import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'src/core/cache/store_credentials.dart';
import 'src/core/services/services.dart';
import 'src/features/auth/login/provider/login_provider.dart';
import 'src/features/auth/register/provider/register_provider.dart';

final getIt = GetIt.instance;

void initializer() {
  //! Register classes here
  getIt.registerLazySingleton(() => BaseServices());
  getIt.registerLazySingleton(() => StorageCredentials());
}

final allProviders = <SingleChildWidget>[
  ChangeNotifierProvider(create: (_) => RegisterProvider()),
  ChangeNotifierProvider(create: (_) => LoginProvider()),
];
