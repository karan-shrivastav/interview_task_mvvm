import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task/view_model/view_model.dart';

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
          : ListView.builder(
              itemCount: dataNotifier.dataList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(dataNotifier.dataList[index].name ?? ''),
                    subtitle: Text(dataNotifier.dataList[index].lifeSpan ?? ''),
                  ),
                );
              },
            ),
    );
  }
}
