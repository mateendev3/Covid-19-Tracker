// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WorldReport {
  int? active;
  int? critical;
  int? deaths;
  int? recovered;
  int? totalCases;
  int? todayDeaths;
  int? todayRecovered;
  WorldReport({
    this.active,
    this.critical,
    this.deaths,
    this.recovered,
    this.totalCases,
    this.todayDeaths,
    this.todayRecovered,
  });

  WorldReport copyWith({
    int? active,
    int? critical,
    int? deaths,
    int? recovered,
    int? totalCases,
    int? todayDeaths,
    int? todayRecovered,
  }) {
    return WorldReport(
      active: active ?? this.active,
      critical: critical ?? this.critical,
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
      'deaths': deaths,
      'recovered': recovered,
      'totalCases': totalCases,
      'todayDeaths': todayDeaths,
      'todayRecovered': todayRecovered,
    };
  }

  factory WorldReport.fromMap(Map<String, dynamic> map) {
    return WorldReport(
      active: map['active'] != null ? map['active'] as int : null,
      critical: map['critical'] != null ? map['critical'] as int : null,
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

  factory WorldReport.fromJson(String source) =>
      WorldReport.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorldReport(active: $active, critical: $critical, deaths: $deaths, recovered: $recovered, totalCases: $totalCases, todayDeaths: $todayDeaths, todayRecovered: $todayRecovered)';
  }

  @override
  bool operator ==(covariant WorldReport other) {
    if (identical(this, other)) return true;

    return other.active == active &&
        other.critical == critical &&
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
        deaths.hashCode ^
        recovered.hashCode ^
        totalCases.hashCode ^
        todayDeaths.hashCode ^
        todayRecovered.hashCode;
  }
}
