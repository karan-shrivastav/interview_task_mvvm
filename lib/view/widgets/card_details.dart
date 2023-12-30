import 'package:flutter/material.dart';
import 'package:interview_task/models/data_model.dart';
import 'package:interview_task/view/detail_screen.dart';

class CardDetails extends StatelessWidget {
  DataModel? data;
   CardDetails({
    super.key,
    this.data,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailedScreen(
                    name: data?.name??'',
                    temperament: data?.temperament??'',
                    origin: data?.origin??'',
                    lifeSpan:data?.lifeSpan,
                    image:
                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                  )),
        );
      },
      child: Container(
        height: 400,
        width: 400,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg',
                )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Name: ${data?.name??''}'),
                Text(
                    'Temperament: ${data?.temperament??''}'),
                Text('Origin: ${data?.origin??''}'),
                Text(
                    'Life span: ${data?.lifeSpan}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
