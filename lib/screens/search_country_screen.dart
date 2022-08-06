import 'package:covid_19_tracker/utils/constants.dart';
import 'package:covid_19_tracker/utils/theme_constants.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: const SearchCountryScreen(),
    theme: covidTheme,
    debugShowCheckedModeBanner: false,
  ));
}

class SearchCountryScreen extends StatefulWidget {
  const SearchCountryScreen({Key? key}) : super(key: key);

  @override
  State<SearchCountryScreen> createState() => _SearchCountryScreenState();
}

class _SearchCountryScreenState extends State<SearchCountryScreen> {
  late final Size size;
  late final TextEditingController _ecSearchCountry;

  @override
  void initState() {
    super.initState();
    _ecSearchCountry = TextEditingController();
  }

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
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(size.height * 0.015),
      child: Column(
        children: [
          _buildSearchField(),
          const Expanded(child: SizedBox()),
        ],
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      controller: _ecSearchCountry,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            color: MyColors.kCodGrayColor,
            width: 1.0,
          ),
        ),
        enabled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            color: MyColors.kBlack,
            width: 1.0,
          ),
        ),
        hintText: 'Search with country name',
        suffixIcon: const Icon(Icons.search),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(
            color: MyColors.kBlack,
            width: 1.0,
          ),
        ),
      ),
      cursorColor: MyColors.kBlack,
    );
  }
}
