import 'package:flutter/material.dart';

class SearchCountryScreen extends StatefulWidget {
  const SearchCountryScreen({Key? key}) : super(key: key);

  @override
  State<SearchCountryScreen> createState() => _SearchCountryScreenState();
}

class _SearchCountryScreenState extends State<SearchCountryScreen> {
  late final Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track Country',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: size.height * 0.03,
              ),
        ),
        automaticallyImplyLeading: true,
      ),
    );
  }
}
