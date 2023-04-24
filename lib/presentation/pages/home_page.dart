import 'package:cryptoku/injection.dart';
import 'package:cryptoku/presentation/cubit/total_top_tier_vol_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/crypto_list_item.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TotalTopTierVolCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: BlocConsumer<TotalTopTierVolCubit, TotalTopTierVolState>(
          listener: (context, state) {
            state.maybeMap(
              error: (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(e.error.toString()),
                  ),
                );
              },
              orElse: () {},
            );
          },
          builder: (context, state) {
            return state.maybeMap(
              orElse: () => const Center(child: CircularProgressIndicator()),
              noData: (data) => const Center(child: Text("No Data")),
              success: (data) {
                final list = data.list;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, index) => CryptoListItem(list[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
