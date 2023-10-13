import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_flutter/models/models.dart';
import 'package:shopify_flutter/shopify/shopify.dart';
import 'package:zenutri_app/features/auth/domain/entities/failure.dart';

class AuthRepository {
  Future<Either<Failure, ShopifyUser>> createCustomer(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    try {
      final ShopifyUser user =
          await ShopifyAuth.instance.createUserWithEmailAndPassword(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );
      return Right(user);
    } on OperationException catch (e) {
      log(e.toString());
      final String message = e.graphqlErrors.first.message;
      return Left(Failure(message: message));
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }

  Future<Either<Failure, ShopifyUser>> login(
    String email,
    String password,
  ) async {
    try {
      final ShopifyUser user =
          await ShopifyAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(user);
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
