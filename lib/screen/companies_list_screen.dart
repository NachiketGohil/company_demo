import 'package:cached_network_image/cached_network_image.dart';
import 'package:company_demo/network/urls.dart';
import 'package:flutter/material.dart';

import '../model/companies.dart';
import '../network/api_service.dart';
import 'companies_detail_screen.dart';

class CompaniesListScreen extends StatelessWidget {
  final ApiService apiService = ApiService('${Urls.baseUrl}${Urls.fetchCompanies}');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Companies List'),
      ),
      body: StreamBuilder<CompaniesModel>(
        stream: apiService.fetchCompanies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            print("Fetching API WAITING");
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            print("Fetching API ERROorr ");
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.companies == null) {
            return Center(child: Text('No companies found'));
          } else {
            print("Fetching API  GOTTT");
            final companies = snapshot.data!.companies!;
            return ListView.builder(
              itemCount: companies.length,
              itemBuilder: (context, index) {
                final company = companies[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: "${Urls.baseUrl}${company.logoPath}" ?? '',
                    height: 50,
                    width: 50,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  title: Text(company.company ?? ''),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CompanyDetailsScreen(company: company),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
