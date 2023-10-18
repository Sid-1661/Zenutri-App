import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_flutter/shopify/shopify.dart';
import 'package:zenutri_app/features/common/domain/entities/failure.dart';
import 'package:zenutri_app/features/common/domain/entities/success.dart';

class ProfileRepository {
  final ShopifyCustomer _shopifyCustomer = ShopifyCustomer.instance;

  Future<Either<Failure, Success>> updateProfile(String firstName,
      String lastName, String phone, String accessToken, String email) async {
    try {
      await _shopifyCustomer.customerUpdate(
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phone,
          email: email,
          customerAccessToken: accessToken);
      return Right(Success());
    } on OperationException catch (e) {
      log(e.toString());
      final String message = e.graphqlErrors.first.message;
      return Left(Failure(message: message));
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }

  Future<Either<Failure, Success>> changePassword(
      String password, String accessToken, String email) async {
    try {
      await _shopifyCustomer.customerUpdate(
          password: password, customerAccessToken: accessToken, email: email);
      return Right(Success());
    } on OperationException catch (e) {
      log(e.toString());
      final String message = e.graphqlErrors.first.message;
      return Left(Failure(message: message));
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }
}
