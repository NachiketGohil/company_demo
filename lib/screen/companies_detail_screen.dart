import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/companies.dart';
import '../network/urls.dart';

class CompanyDetailsScreen extends StatelessWidget {
  final Companies company;

  CompanyDetailsScreen({required this.company});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(company.company ?? 'Company Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: "${Urls.baseUrl}${company.logoPath}" ?? '',
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
              height: 50,
              width: 50,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.location_city_rounded,
                    color: Colors.purple,
                  ),
                ),
                Text('Company: ${company.company}', style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.person,
                    color: Colors.purple,
                  ),
                ),
                Text('CEO: ${company.ceo}', style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.list,
                    color: Colors.purple,
                  ),
                ),
                Text('Category: ${company.category}', style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.purple,
                  ),
                ),
                Text('HQ Latitude: ${company.hqLatitude}', style: TextStyle(fontSize: 18)),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.location_on,
                    color: Colors.purple,
                  ),
                ),
                Text('HQ Longitude: ${company.hqLongitude}', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
