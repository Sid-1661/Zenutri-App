import 'package:flutter/material.dart';
import 'package:shopify_flutter/shopify_config.dart';
import 'package:zenutri_app/core/local_database_service/database_provider.dart';

import 'application/zenutri_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  runApp(const ZenutriApp());
}

Future<void> setUp() async {
  await DBProvider.db.initDB();
  ShopifyConfig.setConfig(
    storefrontAccessToken: 'ae8039b39e897fa4db96ea87c50cbe0d',
    storeUrl: 'zenutri-vitamin.myshopify.com',
  );
}