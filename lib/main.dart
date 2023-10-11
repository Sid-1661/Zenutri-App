import 'package:flutter/material.dart';
import 'package:shopify_flutter/shopify_config.dart';

import 'application/zenutri_app.dart';

void main() {
  setUp();
  runApp(const ZenutriApp());
}

void setUp() {
  ShopifyConfig.setConfig(
    storefrontAccessToken: 'ae8039b39e897fa4db96ea87c50cbe0d',
    storeUrl: 'zenutri-vitamin.myshopify.com',
  );
}