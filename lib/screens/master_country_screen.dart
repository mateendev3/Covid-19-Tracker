import 'package:covid_19_tracker/utils/constants.dart';
import 'package:flutter/material.dart';

class MasterCountryScreen extends StatefulWidget {
  const MasterCountryScreen({Key? key}) : super(key: key);

  @override
  State<MasterCountryScreen> createState() => _MasterCountryScreenState();
}

class _MasterCountryScreenState extends State<MasterCountryScreen> {
  Size? _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pakistan',
          style: Theme.of(context).textTheme.headline2!.copyWith(
                fontSize: _size!.height * 0.03,
              ),
        ),
        automaticallyImplyLeading: true,
        centerTitle: true,
        elevation: 2.0,
        shadowColor: MyColors.kCodGrayColor,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: _size!.height * 0.03),
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const Expanded(flex: 10, child: SizedBox()),
        _buildReportDetails(),
        const Expanded(flex: 10, child: SizedBox()),
      ],
    );
  }

  Widget _buildReportDetails() {
    return Expanded(
      flex: 80,
      child: Container(
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
            fontSize: _size!.height * 0.025,
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
