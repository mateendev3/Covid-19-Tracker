import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' as intl;

import '../services/repositories/countries_report_repository.dart';
import '../utils/constants.dart';
import '../utils/helper_widgets.dart';
import 'master_country_screen.dart';

class SearchCountryScreen extends StatefulWidget {
  const SearchCountryScreen({Key? key}) : super(key: key);

  @override
  State<SearchCountryScreen> createState() => _SearchCountryScreenState();
}

class _SearchCountryScreenState extends State<SearchCountryScreen> {
  Size? _size;
  late final TextEditingController _ecSearchCountry;
  late CountriesReportRepository _crRepo;
  final formatter = intl.NumberFormat.decimalPattern();

  @override
  void initState() {
    super.initState();
    _ecSearchCountry = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _crRepo = Provider.of<CountriesReportRepository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track Country',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: _size!.height * 0.03,
              ),
        ),
        automaticallyImplyLeading: true,
        // backgroundColor: Colors.blue,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.only(
        left: _size!.height * 0.03,
        right: _size!.height * 0.03,
        bottom: _size!.height * 0.03,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _buildSearchField(),
          addVerticalSpace(_size!.height * 0.015),
          _buildListItems(),
        ],
      ),
    );
  }

  Widget _buildListItems() {
    return Expanded(
      child: ListView.builder(
        itemCount: _crRepo.countriesReportList!.length,
        itemBuilder: (context, index) {
          return _buildListItem(index);
        },
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

  Widget _buildListItem(int index) {
    return Container(
      height: _size!.height * 0.1,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      margin: EdgeInsets.only(top: _size!.height * 0.015),
      decoration: BoxDecoration(
        color: MyColors.kCodGrayColor,
        borderRadius: BorderRadius.circular(_size!.height * 0.03),
        border: Border.all(color: MyColors.kCodGrayColor, width: 1.0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: double.infinity,
              clipBehavior: Clip.antiAlias,
              width: constraints.maxWidth * 0.97,
              decoration: BoxDecoration(
                color: MyColors.kPorcelainColor,
                borderRadius: BorderRadius.circular(_size!.height * 0.03),
                border: Border.all(color: MyColors.kCodGrayColor, width: 0.2),
              ),
              alignment: Alignment.centerLeft,
              child: Material(
                color: MyColors.kPorcelainColor,
                child: InkWell(
                  splashColor: MyColors.kWhite,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => MasterCountryScreen(
                          countryName:
                              _crRepo.countriesReportList![index].country!,
                        ),
                      ),
                    );
                  },
                  child: _buildListItemContent(context, index),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItemContent(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _size!.width * 0.03),
          child: CircleAvatar(
            radius: _size!.height * 0.03,
            child: ClipOval(
              child: Image.network(
                _crRepo.countriesReportList![index].countryFlag!,
                width: _size!.height * 0.06,
                height: _size!.height * 0.06,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        _buildCNameAndStats(
          _crRepo.countriesReportList![index].country!,
          'Effected: ${formatter.format(_crRepo.countriesReportList![index].totalCases!)}',
        ),
        IconButton(
          icon: const Icon(Icons.arrow_forward),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildCNameAndStats(String title, String stats) {
    return Expanded(
      child: SizedBox(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCountryTitle(title),
            _buildCountryStats(stats),
          ],
        ),
      ),
    );
  }

  Widget _buildCountryTitle(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(fontSize: _size!.height * 0.023),
      maxLines: 1,
    );
  }

  Widget _buildCountryStats(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontSize: _size!.height * 0.02),
    );
  }
}
