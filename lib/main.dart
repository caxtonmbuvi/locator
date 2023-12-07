// import 'package:locator_app/screens/data/current/cubit/cubit/map_cubit.dart';

import 'exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, child) {
        return MaterialApp(
          title: 'Locator',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => CurrentLocationCubit(LocationRepository())),
              BlocProvider<MapCubit>(create: (context) => MapCubit()),
            ],
            child: const LandingPage(),
          ),
        );
      },
    );
  }
}