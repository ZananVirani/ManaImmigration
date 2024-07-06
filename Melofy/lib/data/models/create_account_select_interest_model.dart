/// This class defines the variables used in the [create_account_select_interest_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class CreateAccountSelectInterestModel {
  String inrerestName;
  bool isCheck;
  String genreName;

  CreateAccountSelectInterestModel(
      {required this.inrerestName,
      required this.isCheck,
      required this.genreName});
}
