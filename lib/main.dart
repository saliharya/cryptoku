import 'package:cryptoku/presentation/cubit/total_top_tier_vol_cubit.dart';
import 'package:cryptoku/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoKu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => getIt<TotalTopTierVolCubit>(),
        child: const MyHomePage('CryptoKu'),
      ),
    );
  }
}
