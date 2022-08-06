import 'package:covid_19_tracker/utils/constants.dart';
import 'package:covid_19_tracker/utils/helper_widgets.dart';
import 'package:flutter/material.dart';

class WorldStatusScreen extends StatefulWidget {
  const WorldStatusScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatusScreen> createState() => _WorldStatusScreenState();
}

class _WorldStatusScreenState extends State<WorldStatusScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Covid-19 Tracker',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: size.height * 0.04,
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
      body: _buildBody(size),
    );
  }

  /// Building body (remaining content) of the screen.
  Widget _buildBody(Size size) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.height * 0.015),
      child: Column(
        children: [
          // const Expanded(flex: 3, child: SizedBox()),
          _buildHeader(size),
          const Expanded(flex: 5, child: SizedBox()),
          _buildHeading(size, 'World Reports'),
          _buildReportDetails(size),
          _buildCountryButton(size),
        ],
      ),
    );
  }

  Widget _buildCountryButton(Size size) {
    return Expanded(
      flex: 12,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: size.height * 0.018,
          horizontal: size.width * 0.01,
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: size.height * 0.015),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              enableFeedback: true,
              primary: MyColors.kCodGrayColor,
              onPrimary: MyColors.kPorcelainColor,
              fixedSize: const Size.fromWidth(double.infinity),
            ),
            child: Text(
              'Track Countries',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: size.height * 0.02,
                    color: MyColors.kPorcelainColor,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeading(Size size, String heading) {
    return Container(
      margin: EdgeInsets.only(
        top: size.height * 0.02,
        left: size.height * 0.01,
        right: size.height * 0.01,
      ),
      padding: EdgeInsets.only(left: size.height * 0.01),
      alignment: Alignment.centerLeft,
      child: Text(
        heading,
        style: Theme.of(context).textTheme.headline3!.copyWith(
              fontSize: size.height * 0.03,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }

  Widget _buildReportDetails(Size size) {
    return Expanded(
      flex: 60,
      child: Container(
        margin: EdgeInsets.all(size.height * 0.015),
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.015, horizontal: size.height * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.03),
          border: Border.all(color: MyColors.kLoblollyColor, width: 1.0),
        ),
        child: _buildReportItems(size),
      ),
    );
  }

  Widget _buildHeader(Size size) {
    return Expanded(
      flex: 20,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.015,
              left: size.height * 0.015,
              right: size.height * 0.015,
            ),
            padding: EdgeInsets.only(bottom: size.height * 0.02),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(size.height * 0.03),
              border: Border.all(color: MyColors.kLoblollyColor, width: 1.0),
            ),
            child: _buildHeaderStats(size),
          ),
          Positioned(
            bottom: -(size.height * 0.03),
            right: 0.0,
            left: 0.0,
            child: CircleAvatar(
              radius: size.height * 0.03,
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

  Widget _buildHeaderStats(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHeaderItemInfo(size, 'Infected', '3,232,434'),
        VerticalDivider(
          color: MyColors.kLoblollyColor,
          thickness: 1.0,
          indent: size.height * 0.035,
          endIndent: size.height * 0.035,
        ),
        _buildHeaderItemInfo(size, 'Recovered', '2,232,434'),
        VerticalDivider(
          color: MyColors.kLoblollyColor,
          thickness: 1.0,
          indent: size.height * 0.035,
          endIndent: size.height * 0.035,
        ),
        _buildHeaderItemInfo(size, 'Deaths', '1,53,343'),
      ],
    );
  }

  Widget _buildHeaderItemInfo(Size size, String title, String count) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildHeaderTitle(title, size),
          addVerticalSpace(size.height * 0.01),
          _buildHeaderCount(count, size),
        ],
      ),
    );
  }

  Widget _buildHeaderTitle(String text, Size size) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline6!
          .copyWith(fontSize: size.height * 0.02),
    );
  }

  Widget _buildHeaderCount(String text, Size size) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(fontSize: size.height * 0.02),
    );
  }

  Widget _buildReportItems(Size size) {
    return Column(
      children: [
        _buildReportItem(size, 'Total Cases', '334,434,343'),
        _addHorizontalDivider(size),
        _buildReportItem(size, 'Deaths', '4,434,343'),
        _addHorizontalDivider(size),
        _buildReportItem(size, 'Recovered', '43,434,343'),
        _addHorizontalDivider(size),
        _buildReportItem(size, 'Active', '2,434,343'),
        _addHorizontalDivider(size),
        _buildReportItem(size, 'Critical', '434,343'),
        _addHorizontalDivider(size),
        _buildReportItem(size, 'Today Deaths', '34,343'),
        _addHorizontalDivider(size),
        _buildReportItem(size, 'Today Recovered', '22,434,343'),
      ],
    );
  }

  Widget _buildReportItem(Size size, String title, String count) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildReportText(title, size),
          _buildReportText(count, size),
        ],
      ),
    );
  }

  Widget _buildReportText(String text, Size size) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            fontSize: size.height * 0.02,
          ),
    );
  }

  Divider _addHorizontalDivider(Size size) {
    return Divider(
      color: MyColors.kLoblollyLightColor,
      thickness: 1.0,
      indent: size.height * 0.08,
      endIndent: size.height * 0.08,
    );
  }
}
