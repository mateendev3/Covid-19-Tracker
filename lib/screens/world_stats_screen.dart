import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:provider/provider.dart';

import '../services/repositories/countries_report_repository.dart';
import '../services/repositories/world_report_repository.dart';
import '../utils/constants.dart';
import '../utils/helper_widgets.dart';
import 'search_country_screen.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

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
  String selectedCountry = 'Pakistan';

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _wrRepo = Provider.of<WorldReportRepository>(context, listen: true);
    _crRepo = Provider.of<CountriesReportRepository>(context, listen: true);

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Covid-19 Tracker',
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  fontSize: _size!.height * 0.04,
                ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: _wrRepo.worldReport == null || _crRepo.countriesReportList == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: MyColors.kCodGray,
                ),
              )
            : _buildBody(),
      ),
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
        style: Theme.of(context).textTheme.displaySmall!.copyWith(
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

  /// methods to build header.
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
            child: GestureDetector(
              onTap: () async {
                selectedCountry = await _showSelectCountryDialog();
                setState(() {});
              },
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: _size!.height * 0.03,
                child: ClipOval(
                  child: Image.network(
                    _crRepo.countriesReportList!
                        .firstWhere(
                            (element) => element.country == selectedCountry)
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
          ),
        ],
      ),
    );
  }

  // method to show dialog to change country stats
  _showSelectCountryDialog() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          title: Text(
            'Select Country',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
          ),
          content: SizedBox(
            height: _size!.height * 0.6,
            width: _size!.width * 0.6,
            child: ListView.builder(
              itemCount: _crRepo.countriesReportList!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_crRepo.countriesReportList![index].country!),
                  hoverColor: MyColors.kPorcelain,
                  tileColor: MyColors.kWhite,
                  selectedColor: MyColors.kPorcelain,
                  onTap: () {
                    Navigator.pop(
                        context, _crRepo.countriesReportList![index].country);
                  },
                );
              },
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeaderStats() {
    var countryReport = _crRepo.countriesReportList!
        .firstWhere((element) => element.country == selectedCountry);
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
          .titleLarge!
          .copyWith(fontSize: _size!.height * 0.02),
    );
  }

  Widget _buildHeaderCount(String count) {
    return Text(
      count,
      style: Theme.of(context)
          .textTheme
          .headlineMedium!
          .copyWith(fontSize: _size!.height * 0.02),
    );
  }

  // methods to build world report
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
      style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            fontSize: _size!.height * 0.02,
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
              foregroundColor: MyColors.kPorcelain, backgroundColor: MyColors.kCodGray, enableFeedback: true,
              fixedSize: const Size.fromWidth(double.infinity),
            ),
            child: Text(
              'Track Countries',
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: _size!.height * 0.02,
                    color: MyColors.kPorcelain,
                  ),
            ),
          ),
        ),
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

  // method, will be called when back button is pressed.
  Future<bool> _onBackPressed() async {
    return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Are you sure?',
              style: Theme.of(context).textTheme.headlineMedium!,
            ),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                style: TextButton.styleFrom(
                  foregroundColor: MyColors.kCodGray,
                ),
                child: const Text('No'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                style: TextButton.styleFrom(
                  foregroundColor: MyColors.kCodGray,
                ),
                child: const Text('Yes'),
              ),
            ],
          ),
        ) ??
        false;
  }
}
