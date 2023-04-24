import 'package:cached_network_image/cached_network_image.dart';
import 'package:cryptoku/presentation/cubit/total_top_tier_vol_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TotalTopTierVolCubit(),
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
                  itemBuilder: (context, index) {
                    final data = list[index];
                    return Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: data.coinInfo?.imageUrl ?? "",
                                width: 40,
                                height: 40,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(data.coinDisplay?.coinUsd?.symbol ??
                                        ""),
                                    Text(data.coinInfo?.fullName ?? ""),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Text(
                                data.coinDisplay?.coinUsd?.price ?? "",
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
