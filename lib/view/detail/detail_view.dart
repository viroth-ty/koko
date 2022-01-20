import 'package:flutter/material.dart';
import 'package:koko/model/todo.dart';
import 'package:koko/view/home/home_view_model.dart';
import 'package:provider/provider.dart';

class DetailView extends StatefulWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  _DetailViewState createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: const Text("Welcome to England MFT!")),
    );
  }
}
