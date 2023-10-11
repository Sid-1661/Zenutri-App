class Failure {
  final int statusCode;
  final String message;
  final String code;

  Failure(
      {this.statusCode = 400,
      this.message = 'Something went wrong!',
      this.code = 'FAILED'});
}
