/// Text Constant class
///
///In this class there are all texts by screens
/// Authors: Sena Cikic, Danis Preldzic, Adi Cengic, Jusuf Elfarahati
/// Tech387 - T2
/// Feb, 2020

class MyText {
//Profile Languages
  final String languageArabic = 'Arabic';
  final String languageEnglish = 'English';

//Dialog boxes
  final String areYouSure = 'Are you sure?';
  final String askToExitSurvey = 'Do you really want to exit the survey?';
  final String branching1 = "This survey is not compatible with your answers.";
  final String branching2 = "You will be redirected to Survey List.";
  final String branchingOK = 'OK';

//Date question
  final String day = 'Day';
  final String month = 'Month';
  final String year = 'Year';

//MCQ
  final String indexA = 'A';
  final String indexB = 'B';
  final String indexC = 'C';
  final String indexD = 'D';

//Survey List
  final String surveyList = 'Survey List';

//Navigation Bar
  final String transferAfter = 'Transfer after 100 SAR';
  final String register = 'Register';
  final String completeProfile = 'Complete profile';
  final String transfer = 'Transfer';
  final String singleSar = 'SAR';

//Profile
  final String profileTitle = 'Profile';
  final String transferWith = 'transfer with';
  final String labelNameAndSurname = 'Name and Surname';
  final String labelDOB = 'Date of birth';
  final String labelEmailProfile = 'Enter email';
  final String labelCardNumber = 'Enter card number ';
  final String labelExpireDate = 'Date';
  final String labelCC = 'CC';
  final String mustRegister = 'You must register first';
  final String ok = 'Ok';

//Survey status
  final String status = 'Status';
  final String statusCompleted = 'COMPLETED';

//Summary
  final String congradulations = 'Congratulation\nyou have got';
  final String sar = '\nSAR';
  final String summary = 'Summary';
  final String label = 'Your answer:';

//SplashScreen
  final String fill = 'fill';
  final String builtBy = 'Built by Makena';

// HomePage
  final String headline = "fill";
  final String subtitle = "Register and get\n5 SAR";
  final String btnSU = 'New Register';
  final String btnSI = 'Sign In';
  final String skipThisStep = 'skip';

// RegisterPage
  final String registerHeadline = 'Register and start \n making money';
  final String registerSubtitle = '3\nSAR';
  final String labelUsername = 'Username';
  final String labelPhone = ' +966 Phone number';
  final String sendPIN = "Send PIN";

//VerityPage
  final String verifyPageHeadline = 'Verify your \nnumber';
  final String verifyMoney = '2 \nSAR';
  final String verifyEnterPin = 'Enter the pin';
  final String btnVerify = 'Verify PIN';
  final String verifyRecieve = "didn't receive the PIN";

//EmailPage
  final String emailHeadline = "Set up an email \nand start getting \n";
  final String fiveSar = '5 \nSAR'; //used mulitple times
  final String labelEmail = 'Email';
  final String btnEmail = 'Submit';

//PasswordPage
  final String labelPassword = 'Password';
  final String passwordSubtitle1 =
      'By tapping Sing Up & Accept, you acknowledge that you have read the ';
  final String privacy = 'Privacy Policy ';
  final String passwordSubtitle2 = 'and agree to the ';
  final String termsOfService = 'Terms of Services';
  final String btnPassword = 'Sign Up & Accept';
  final String passwordHeadline = "Set up a password \nand start getting \n";

// Dashboard
  final String sarText = 'Your cash\nbalance';

//LoginPage
  final String resetHeadline = 'Reset your password';
  final String labelOldPassword = 'Enter code from email';
  final String labelNewPassword = 'Enter new password';
  final String repeatNewPassword = 'Re-enter new password';
  final String btnReset = 'Reset Password';
  final String repeatPassSnack = "Wrong input";
  final String emptyFieldSnack = "This field can't be empty";

// Input Survey Choice
  final String placeholderInput = 'Type the answer';

//LoginPage -> sendEmailPage
  final String emailReset = "Reset password";
  final String emailSub =
      "If you do not know your current password, you may change it.";

// WillPop
  final String willQuestion = 'Are you sure?';
  final String willQuestion1 = 'Do you want to exit the app?';
  final String willYes = 'Yes';
  final String willNo = 'No';

//Register dialog box
  final String registerQuestion = 'Do you want to earn money?';
  final String registerQuestion1 = 'Do you want to register yourself?';
  final String registerYes = 'Yes';
  final String registerNo = 'No';

// reset email email
  final String subject = 'Reset Password';
  final String msgSent = 'Message sent: ';
  final String msgNotSent = 'Message not sent.';
  final String emailMsg =
      'You are receiving this e-mail because you requested a password reset for your Fill account.\n \n This is your code for reset password:';

//Reusable
  final String verifyCode = 'Enter sms code';
  final String appBarDash = 'Dashboard';
  final String dashHeadline = 'You are logged in. ';
  final String dashSub = 'My Email is: ';
  final String dashSub1 = ' And my Password is: ';
  final String btnLogout = 'Logout';
  final String btnLogin = 'Login';
  final String loginHeadline = "Login and start generating money";
  final String resetPass = 'forget password';
  final String ifYouDont =
      "If you do not know your current password, you may change it.";
  final String btnSubmit = "Submit";
  final String resetHead = "Reset password";
  final String emailPlace = "Email";

// VALIDATION
  final String validateSpaceUsername = 'Username must not contain space';
  final String validateSpacePassword = 'Password must not contain space';
  final String numberExists = 'Number already exists';
  final String usernameExist = 'Username already exists';
  final String usernameDontExist = "Username doesn't exists";
  final String passDontExist = "Wrong password";
  final String emailExist = "Email already exist";
  final String wrongCodeError =
      'PlatformException(ERROR_INVALID_VERIFICATION_CODE, The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user., null)';
  final String otherError =
      'PlatformException(ERROR_TOO_MANY_REQUESTS, The sms quota for this project has been exceeded. [ Exceeded quota for verifying phone numbers. ], null)';
  final String wrongCode = 'You entered invalid code';
  final String snackUndo = 'Undo';
  final String regEmailSnack = "Email can't be empty";
  final String regUserSnack = "Username can't be empty";
  final String regPhoneSnack = "Phone can't be empty";
  final String regPassSnack = "Password can't be empty";
  final String regPassLengthSnack =
      "Password can't be less than 8\ncharacters!";
  final String smsEmptySnack = "Sms code can't be empty!";
  final String smsLengthSnack = "Sms code can't be less than 6 characters";
  final String userExistsSnack = "This username doesn't exists";
  final String passExistsSnack = "This password doesn't exists";
  final String validEmail = 'Email must be valid';
  final String regexPasswordSnack =
      'Password must contain at least one\nnumber and at least one capital letter';
  final String checkConnection = 'There is no internet connection.';
}
