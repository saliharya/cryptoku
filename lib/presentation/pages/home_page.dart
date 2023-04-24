import 'package:cryptoku/data/model/crypto_data.dart';
import 'package:cryptoku/injection.dart';
import 'package:cryptoku/presentation/cubit/total_top_tier_vol_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../widgets/crypto_list_item.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage(this.title, {super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PagingController<int, CryptoData> _pagingController =
      PagingController(firstPageKey: 0);

  @override
  void initState() {
    context.read<TotalTopTierVolCubit>().getTotalTopTierVolFull();
    _pagingController.addPageRequestListener((pageKey) {
      context.read<TotalTopTierVolCubit>().getTotalTopTierVolFull();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
              final newItems = data.list;
              if (!context.read<TotalTopTierVolCubit>().allowFetchNext()) {
                _pagingController.appendLastPage(newItems);
              } else {
                final nextPageKey = getIt<TotalTopTierVolCubit>().list.length;
                _pagingController.appendPage(newItems, nextPageKey);
              }
              return PagedListView<int, CryptoData>(
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<CryptoData>(
                  itemBuilder: (context, item, index) => CryptoListItem(item),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
