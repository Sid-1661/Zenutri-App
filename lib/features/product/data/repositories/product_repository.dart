import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_flutter/shopify_flutter.dart';
import 'package:zenutri_app/features/common/domain/entities/failure.dart';

class ProductRepository {
  Future<Either<Failure, List<Product>>> getCollectionProducts(String collectionId) async {
    try {
      final ShopifyStore shopifyStore = ShopifyStore.instance;
      final List<Collection> collections = await shopifyStore.getAllCollections();
      print(collections.first.id);
      final List<Product> productList = await shopifyStore.getAllProductsFromCollectionById(collections.first.id);
      return Right(productList);
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