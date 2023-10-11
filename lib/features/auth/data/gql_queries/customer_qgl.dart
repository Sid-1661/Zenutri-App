class CustomerGql {
//   static String createNewCustomer = '''mutation customerCreate(\$input: CustomerCreateInput!) {
//   customerCreate(input: \$input) {
//     customer {
//       id
//     }
//     customerUserErrors {
//       field
//       message
//       code
//     }
//   }
// }''';
  static String createNewCustomer = '''mutation {
  customerCreate(input: {
    acceptsMarketing: true,
    email: "new@gmail.com",
    firstName: "",
    lastName: "",
    password: "passser",
    phone: ""
  }) {
    customer {
      # Customer fields
    }
    customerUserErrors {
      # CustomerUserError fields
    }
  }
}
''';
}