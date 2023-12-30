import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task/view/widgets/card_details.dart';
import 'package:interview_task/view_model/view_model.dart';

import 'detail_screen.dart';

class Home extends ConsumerWidget {
  const Home({
    super.key,
  });
  @override
  Widget build(BuildContext context, ref) {
    final dataNotifier = ref.watch(dataNotifierProvider);
    dataNotifier.getData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Home'),
      ),
      body: dataNotifier.dataList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              itemCount: dataNotifier.dataList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                return CardDetails(
                  data: dataNotifier.dataList[index],
                );
              },
            ),
    );
  }
}
