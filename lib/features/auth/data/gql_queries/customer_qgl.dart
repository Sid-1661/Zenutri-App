class CustomerGql {
  static String createNewCustomer = '''mutation customerCreate(\$input: CustomerCreateInput!) {
  customerCreate(input: \$input) {
    customer {
      firstName
      lastName
      email
      phone
      acceptsMarketing
    }
    customerUserErrors {
      field
      message
      code
    }
  }
}''';
}