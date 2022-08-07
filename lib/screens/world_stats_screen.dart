import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../services/repositories/countries_report_repository.dart';
import '../services/repositories/world_report_repository.dart';
import '../utils/constants.dart';
import '../utils/helper_widgets.dart';
import 'search_country_screen.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({Key? key}) : super(key: key);

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen> {
  @override
  void initState() {
    super.initState();
    // calling api
    Provider.of<WorldReportRepository>(context, listen: false).getWorldReport();
    Provider.of<CountriesReportRepository>(context, listen: false)
        .getCountriesReport();
  }

  Size? _size;
  late WorldReportRepository _wrRepo;
  late CountriesReportRepository _crRepo;
  final formatter = intl.NumberFormat.decimalPattern();

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _wrRepo = Provider.of<WorldReportRepository>(context, listen: true);
    _crRepo = Provider.of<CountriesReportRepository>(context, listen: true);
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
      body: _wrRepo.worldReport == null || _crRepo.countriesReportList == null
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: MyColors.kCodGray,
              ),
            )
          : _buildBody(),
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
              primary: MyColors.kCodGray,
              onPrimary: MyColors.kPorcelain,
              fixedSize: const Size.fromWidth(double.infinity),
            ),
            child: Text(
              'Track Countries',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontSize: _size!.height * 0.02,
                    color: MyColors.kPorcelain,
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
          border: Border.all(color: MyColors.kLoblolly, width: 1.0),
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
              border: Border.all(color: MyColors.kLoblolly, width: 1.0),
            ),
            child: _buildHeaderStats(),
          ),
          Positioned(
            bottom: -(_size!.height * 0.03),
            right: 0.0,
            left: 0.0,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: _size!.height * 0.03,
              child: ClipOval(
                child: Image.network(
                  _crRepo.countriesReportList!
                      .firstWhere((element) => element.country == 'Pakistan')
                      .countryFlag!,
                  width: _size!.height * 0.06,
                  height: _size!.height * 0.06,
                  fit: BoxFit.cover,
                  loadingBuilder:
                      (context, child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(
                      child: CircularProgressIndicator(
                        color: MyColors.kCodGray,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderStats() {
    var countryReport = _crRepo.countriesReportList!
        .firstWhere((element) => element.country == 'Pakistan');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildHeaderItemInfo(
          'Infected',
          formatter.format(countryReport.totalCases),
        ),
        VerticalDivider(
          color: MyColors.kLoblolly,
          thickness: 1.0,
          indent: _size!.height * 0.035,
          endIndent: _size!.height * 0.035,
        ),
        _buildHeaderItemInfo(
          'Recovered',
          formatter.format(countryReport.recovered),
        ),
        VerticalDivider(
          color: MyColors.kLoblolly,
          thickness: 1.0,
          indent: _size!.height * 0.035,
          endIndent: _size!.height * 0.035,
        ),
        _buildHeaderItemInfo(
          'Deaths',
          formatter.format(countryReport.deaths),
        ),
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
        _buildReportItem(
          'Total Cases',
          formatter.format(_wrRepo.worldReport!.totalCases),
        ),
        _addHorizontalDivider(),
        _buildReportItem(
          'Deaths',
          formatter.format(_wrRepo.worldReport!.deaths),
        ),
        _addHorizontalDivider(),
        _buildReportItem(
          'Recovered',
          formatter.format(_wrRepo.worldReport!.recovered),
        ),
        _addHorizontalDivider(),
        _buildReportItem(
          'Active',
          formatter.format(_wrRepo.worldReport!.active),
        ),
        _addHorizontalDivider(),
        _buildReportItem(
          'Critical',
          formatter.format(_wrRepo.worldReport!.critical),
        ),
        _addHorizontalDivider(),
        _buildReportItem(
          'Today Deaths',
          formatter.format(_wrRepo.worldReport!.todayDeaths),
        ),
        _addHorizontalDivider(),
        _buildReportItem(
          'Today Recovered',
          formatter.format(_wrRepo.worldReport!.todayRecovered),
        ),
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
      color: MyColors.kLoblollyLight,
      thickness: 1.0,
      indent: _size!.height * 0.08,
      endIndent: _size!.height * 0.08,
    );
  }

  Widget _buildShimmer() {
    return Column(
      children: const [
        Expanded(flex: 20, child: SizedBox()),
        Expanded(flex: 60, child: SizedBox()),
        Expanded(flex: 12, child: SizedBox()),
      ],
    );
  }
}
