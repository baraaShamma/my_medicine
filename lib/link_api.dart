
class AppLink {
 static String api = 'http://192.168.1.103:8080/my_medicine';
 //auth
 static String signUp="$api/auth/signup.php";
 static String verifyCode="$api/auth/verifyCode.php";
 static String login="$api/auth/login.php";

 //forgetPassword
 static String checkEmail="$api/forgetpassword/check_email.php";
 static String resetPassword="$api/forgetpassword/reset_password.php";
 static String verifyCodeResetPassword="$api/forgetpassword/verify_code.php";

 //home
 static String homePage="$api/home.php";
 static String diseases="$api/diseases.php";
 static String activeSubstances="$api/active_substances.php";
 static String pharmaceutical="$api/pharmaceutical.php";
 static String search="$api/search.php";
 //images
 static const String apiImages = 'http://10.0.2.2:8080/my_medicine/upload';
 static const String imagesCategories = '$apiImages/categories';
 static const String imagesActiveSubstances = '$apiImages/active_substances';

}