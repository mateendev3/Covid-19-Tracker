import 'package:covid_19_tracker/utils/helper_widgets.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import 'master_country_screen.dart';

class SearchCountryScreen extends StatefulWidget {
  const SearchCountryScreen({Key? key}) : super(key: key);

  @override
  State<SearchCountryScreen> createState() => _SearchCountryScreenState();
}

class _SearchCountryScreenState extends State<SearchCountryScreen> {
  Size? _size;
  late final TextEditingController _ecSearchCountry;

  @override
  void initState() {
    super.initState();
    _ecSearchCountry = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Track Country',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: _size!.height * 0.03,
              ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(_size!.height * 0.03),
      child: Column(
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
        itemCount: 50,
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
                        builder: (_) => const MasterCountryScreen(),
                      ),
                    );
                  },
                  child: _buildListItemContent(context),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildListItemContent(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: _size!.width * 0.03),
          child: CircleAvatar(
            radius: _size!.height * 0.03,
            child: ClipOval(
              child: Image.asset(
                r'assets/images/pakistan.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        _buildCNameAndStats('Pakistan', 'Effected: 3,434,332'),
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
