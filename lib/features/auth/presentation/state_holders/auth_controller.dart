import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shopify_flutter/models/src/shopify_user/shopify_user.dart';
import 'package:shopify_flutter/shopify/shopify.dart';
import 'dart:developer';

class AuthController extends GetxController {
  final shopifyAuth = ShopifyAuth.instance;
  ShopifyUser? shopifyUser = ShopifyUser();

  Future<bool> checkIfLoggedIn() async {
    try {
      final isTokenExpired = await shopifyAuth.isAccessTokenExpired;
      log('isTokenExpired: $isTokenExpired');
      if (isTokenExpired) {
        shopifyUser = null;
        final accessToken = await shopifyAuth.currentCustomerAccessToken;
        if (accessToken != null) {
          await shopifyAuth.renewCurrentAccessToken(accessToken);
          final user = await shopifyAuth.currentUser();
          log('user after token refresh: $user');
          shopifyUser = user;
          if (user != null) {
            return true;
          }
        }
        return false;
      } else {
        final user = await shopifyAuth.currentUser();
        log('current user: $user');
        shopifyUser = user;
        if (user != null) {
          return true;
        }
      }
      return false;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    } finally{
      update();
    }
  }

  Future<void> logout() async {
    await shopifyAuth.signOutCurrentUser();
    update();
  }

  Future<void> refreshUserInfo() async {
    shopifyUser = await shopifyAuth.currentUser();
    update();
  }

  String get userFullName {
    return '${shopifyUser?.firstName ?? ''} ${shopifyUser?.lastName ?? ''}';
  }
}
