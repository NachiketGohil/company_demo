class CompaniesModel {
  String? baseUrl;
  List<Companies>? companies;

  CompaniesModel({
    this.baseUrl,
    this.companies,
  });

  CompaniesModel.fromJson(Map<String, dynamic> json) {
    baseUrl = json['base_url'];
    if (json['companies'] != null) {
      companies = <Companies>[];
      json['companies'].forEach((v) {
        companies!.add(new Companies.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['base_url'] = this.baseUrl;
    if (this.companies != null) {
      data['companies'] = this.companies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Companies {
  String? logoPath;
  String? company;
  String? ceo;
  String? category;
  double? hqLatitude;
  double? hqLongitude;

  Companies({
    this.logoPath,
    this.company,
    this.ceo,
    this.category,
    this.hqLatitude,
    this.hqLongitude,
  });

  Companies.fromJson(Map<String, dynamic> json) {
    logoPath = json['logo_path'];
    company = json['company'];
    ceo = json['ceo'];
    category = json['category'];
    hqLatitude = json['hq_latitude'];
    hqLongitude = json['hq_longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['logo_path'] = this.logoPath;
    data['company'] = this.company;
    data['ceo'] = this.ceo;
    data['category'] = this.category;
    data['hq_latitude'] = this.hqLatitude;
    data['hq_longitude'] = this.hqLongitude;
    return data;
  }
}
