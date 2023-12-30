import 'package:flutter/material.dart';

class DetailedScreen extends StatefulWidget {
  final String? name;
  final String? temperament;
  final String? origin;
  final String? lifeSpan;
  final String? image;
  const DetailedScreen({
    super.key,
    this.name,
    this.temperament,
    this.origin,
    this.lifeSpan,
    this.image,
  });

  @override
  State<DetailedScreen> createState() => _DetailedScreenState();
}

class _DetailedScreenState extends State<DetailedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details are here"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.network(
                    widget.image ?? '',
                  )),
              Text('Name: ${widget.name}'),
              Text('Temperament: ${widget.temperament}'),
              Text('Origin: ${widget.origin}'),
              Text('Life span: ${widget.lifeSpan}'),
            ],
          ),
        ),
      ),
    );
  }
}
