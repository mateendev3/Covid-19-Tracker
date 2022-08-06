import 'package:covid_19_tracker/screens/search_country_screen.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/helper_widgets.dart';

class WorldStatusScreen extends StatefulWidget {
  const WorldStatusScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatusScreen> createState() => _WorldStatusScreenState();
}

class _WorldStatusScreenState extends State<WorldStatusScreen> {
  Size? _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid-19 Tracker',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: _size!.height * 0.04,
              ),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  /// Building body (remaining content) of the screen.
  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _size!.height * 0.015),
      child: Column(
        children: [
          // const Expanded(flex: 3, child: SizedBox()),
          _buildHeader(),
          const Expanded(flex: 5, child: SizedBox()),
          _buildHeading('World Reports'),
          _buildReportDetails(),
          _buildCountryButton(),
        ],
      ),
    );
  }

  Widget _buildCountryButton() {
    return Expanded(
      flex: 12,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: _size!.height * 0.018,
          horizontal: _size!.width * 0.01,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: _size!.height * 0.015),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SearchCountryScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              enableFeedback: true,
              primary: MyColors.kCodGrayColor,
              onPrimary: MyColors.kPorcelainColor,
              fixedSize: const Size.fromWidth(double.infinity),
            ),
            child: Text(
              'Track Countries',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: _size!.height * 0.02,
                    color: MyColors.kPorcelainColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(String heading) {
    return Container(
      margin: EdgeInsets.only(
        top: _size!.height * 0.02,
        left: _size!.height * 0.01,
        right: _size!.height * 0.01,
      ),
      padding: EdgeInsets.only(left: _size!.height * 0.01),
      alignment: Alignment.centerLeft,
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline3!.copyWith(
              fontSize: _size!.height * 0.03,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildReportDetails() {
    return Expanded(
      flex: 60,
      child: Container(
        margin: EdgeInsets.all(_size!.height * 0.015),
        padding: EdgeInsets.symmetric(
            vertical: _size!.height * 0.015, horizontal: _size!.height * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_size!.height * 0.03),
          border: Border.all(color: MyColors.kLoblollyColor, width: 1.0),
        ),
        child: _buildReportItems(),
      ),
    );
  }

  Widget _buildHeader() {
    return Expanded(
      flex: 20,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: _size!.height * 0.015,
              left: _size!.height * 0.015,
              right: _size!.height * 0.015,
            ),
            padding: EdgeInsets.only(bottom: _size!.height * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_size!.height * 0.03),
              border: Border.all(color: MyColors.kLoblollyColor, width: 1.0),
            ),
            child: _buildHeaderStats(),
          ),
          Positioned(
            bottom: -(_size!.height * 0.03),
            right: 0.0,
            left: 0.0,
            child: CircleAvatar(
              radius: _size!.height * 0.03,
              // backgroundImage: const AssetImage(r'assets/images/pakistan.jpg'),
              child: ClipOval(
                child: Image.asset(
                  r'assets/images/pakistan.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderStats() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHeaderItemInfo('Infected', '3,232,434'),
        VerticalDivider(
          color: MyColors.kLoblollyColor,
          thickness: 1.0,
          indent: _size!.height * 0.035,
          endIndent: _size!.height * 0.035,
        ),
        _buildHeaderItemInfo('Recovered', '2,232,434'),
        VerticalDivider(
          color: MyColors.kLoblollyColor,
          thickness: 1.0,
          indent: _size!.height * 0.035,
          endIndent: _size!.height * 0.035,
        ),
        _buildHeaderItemInfo('Deaths', '1,53,343'),
      ],
    );
  }

  Widget _buildHeaderItemInfo(String title, String count) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeaderTitle(title),
          addVerticalSpace(_size!.height * 0.01),
          _buildHeaderCount(count),
        ],
      ),
    );
  }

  Widget _buildHeaderTitle(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontSize: _size!.height * 0.02),
    );
  }

  Widget _buildHeaderCount(String text) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(fontSize: _size!.height * 0.02),
    );
  }

  Widget _buildReportItems() {
    return Column(
      children: [
        _buildReportItem('Total Cases', '334,434,343'),
        _addHorizontalDivider(),
        _buildReportItem('Deaths', '4,434,343'),
        _addHorizontalDivider(),
        _buildReportItem('Recovered', '43,434,343'),
        _addHorizontalDivider(),
        _buildReportItem('Active', '2,434,343'),
        _addHorizontalDivider(),
        _buildReportItem('Critical', '434,343'),
        _addHorizontalDivider(),
        _buildReportItem('Today Deaths', '34,343'),
        _addHorizontalDivider(),
        _buildReportItem('Today Recovered', '22,434,343'),
      ],
    );
  }

  Widget _buildReportItem(String title, String count) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildReportText(title),
          _buildReportText(count),
        ],
      ),
    );
  }

  Widget _buildReportText(String text) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            fontSize: _size!.height * 0.02,
          ),
    );
  }

  Widget _addHorizontalDivider() {
    return Divider(
      color: MyColors.kLoblollyLightColor,
      thickness: 1.0,
      indent: _size!.height * 0.08,
      endIndent: _size!.height * 0.08,
    );
  }
}
