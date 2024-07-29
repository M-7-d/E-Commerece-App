import 'package:en_ecommerce/features/store/screens/homeScreen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../common/widget/rating/userReviewCard.dart';
import '../features/authentication/screens/auth/login.dart';
import '../features/authentication/screens/auth/password_Configration/forget_Password.dart';
import '../features/authentication/screens/auth/signup.dart';
import '../features/authentication/screens/onboarding/onboarding.dart';
import '../features/authentication/screens/verfyEmail/verifyemail.dart';
import '../features/personalizaion/screens/adresses/address.dart';
import '../features/store/profile.dart';
import '../features/store/screens/CART/cart.dart';
import '../features/store/screens/Settings/settings.dart';
import '../features/store/screens/checkout/checkOut.dart';
import '../features/store/screens/order/order.dart';
import '../features/store/screens/store/store.dart';
import '../features/store/wishlist/wishlist.dart';
import 'routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScrren()),
    GetPage(name: TRoutes.favourites, page: () => const FavoriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const UserReviewCard()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckOutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressesScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignUpScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen()),
  ];
}
