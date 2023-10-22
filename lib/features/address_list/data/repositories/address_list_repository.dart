import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shopify_flutter/models/src/shopify_user/address/address.dart';
import 'package:shopify_flutter/shopify_flutter.dart';

import '../../../common/domain/entities/failure.dart';

class AddressRepository {
  Future<Either<Failure, List<Address>>> getAddressList(String collectionId) async {
    try {
      final ShopifyStore shopifyStore = ShopifyStore.instance;
      final List<Collection> collections = await shopifyStore.getAllCollections();
      log(collections.first.id);
      final List<Product> productList = await shopifyStore.getAllProductsFromCollectionById(collections.first.id);
      return const Right([]);
    } on OperationException catch (e) {
      log(e.toString());
      final String message = e.graphqlErrors.first.message;
      return Left(Failure(message: message));
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }

  Future<Either<Failure, Address>> addressCreate(
      {required String address1,
      required String address2,
      required String company,
      required String city,
      required String country,
      required String firstName,
      required String lastName,
      required String phone,
      required String province,
      required String zip,
      required String customerAccessToken}) async {
    try {
      ShopifyCustomer shopifyCustomer = ShopifyCustomer.instance;
      Address address = await shopifyCustomer.customerAddressCreate(
          address1: address1,
          address2: address2,
          company: company,
          city: city,
          customerAccessToken: customerAccessToken,
          firstName: firstName,
          lastName: lastName,
          zip: zip,
          phone: phone,
          province: province,
          country: country);
      return Right(address);
    } on OperationException catch (e) {
      log(e.toString());
      final String message = e.graphqlErrors.first.message;
      return Left(Failure(message: message));
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }

  Future<Either<Failure, bool>> addressDelete({required String addressID, required String customerAccessToken}) async {
    try {
      ShopifyCustomer shopifyCustomer = ShopifyCustomer.instance;
      await shopifyCustomer.customerAddressDelete(
        addressId: addressID,
        customerAccessToken: customerAccessToken,
      );
      return const Right(true);
    } on OperationException catch (e) {
      log(e.toString());
      final String message = e.graphqlErrors.first.message;
      return Left(Failure(message: message));
    } catch (e) {
      log(e.toString());
      return Left(Failure());
    }
  }

  Future<Either<Failure, bool>> addressUpdate(
      {required String addressID,
      required String address1,
      required String address2,
      required String company,
      required String city,
      required String country,
      required String firstName,
      required String lastName,
      required String phone,
      required String province,
      required String zip,
      required String customerAccessToken}) async {
    try {
      ShopifyCustomer shopifyCustomer = ShopifyCustomer.instance;
      await shopifyCustomer.customerAddressUpdate(
          id: addressID,
          address1: address1,
          address2: address2,
          company: company,
          city: city,
          customerAccessToken: customerAccessToken,
          firstName: firstName,
          lastName: lastName,
          zip: zip,
          phone: phone,
          province: province,
          country: country);
      return Right(true);
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
