// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CountryReport {
  int? active;
  int? critical;
  String? country;
  String? countryFlag;
  int? deaths;
  int? recovered;
  int? totalCases;
  int? todayDeaths;
  int? todayRecovered;
  CountryReport({
    this.active,
    this.critical,
    this.country,
    this.countryFlag,
    this.deaths,
    this.recovered,
    this.totalCases,
    this.todayDeaths,
    this.todayRecovered,
  });

  CountryReport copyWith({
    int? active,
    int? critical,
    String? country,
    String? countryFlag,
    int? deaths,
    int? recovered,
    int? totalCases,
    int? todayDeaths,
    int? todayRecovered,
  }) {
    return CountryReport(
      active: active ?? this.active,
      critical: critical ?? this.critical,
      country: country ?? this.country,
      countryFlag: countryFlag ?? this.countryFlag,
      deaths: deaths ?? this.deaths,
      recovered: recovered ?? this.recovered,
      totalCases: totalCases ?? this.totalCases,
      todayDeaths: todayDeaths ?? this.todayDeaths,
      todayRecovered: todayRecovered ?? this.todayRecovered,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'active': active,
      'critical': critical,
      'country': country,
      'countryFlag': countryFlag,
      'deaths': deaths,
      'recovered': recovered,
      'totalCases': totalCases,
      'todayDeaths': todayDeaths,
      'todayRecovered': todayRecovered,
    };
  }

  factory CountryReport.fromMap(Map<String, dynamic> map) {
    return CountryReport(
      active: map['active'] != null ? map['active'] as int : null,
      critical: map['critical'] != null ? map['critical'] as int : null,
      country: map['country'] != null ? map['country'] as String : null,
      countryFlag: map['countryInfo']['flag'] != null
          ? map['countryInfo']['flag'] as String
          : null,
      deaths: map['deaths'] != null ? map['deaths'] as int : null,
      recovered: map['recovered'] != null ? map['recovered'] as int : null,
      totalCases: map['cases'] != null ? map['cases'] as int : null,
      todayDeaths:
          map['todayDeaths'] != null ? map['todayDeaths'] as int : null,
      todayRecovered:
          map['todayRecovered'] != null ? map['todayRecovered'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryReport.fromJson(String source) =>
      CountryReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CountryReport(active: $active, critical: $critical, country: $country, countryFlag: $countryFlag, deaths: $deaths, recovered: $recovered, totalCases: $totalCases, todayDeaths: $todayDeaths, todayRecovered: $todayRecovered)';
  }

  @override
  bool operator ==(covariant CountryReport other) {
    if (identical(this, other)) return true;

    return other.active == active &&
        other.critical == critical &&
        other.country == country &&
        other.countryFlag == countryFlag &&
        other.deaths == deaths &&
        other.recovered == recovered &&
        other.totalCases == totalCases &&
        other.todayDeaths == todayDeaths &&
        other.todayRecovered == todayRecovered;
  }

  @override
  int get hashCode {
    return active.hashCode ^
        critical.hashCode ^
        country.hashCode ^
        countryFlag.hashCode ^
        deaths.hashCode ^
        recovered.hashCode ^
        totalCases.hashCode ^
        todayDeaths.hashCode ^
        todayRecovered.hashCode;
  }
}
