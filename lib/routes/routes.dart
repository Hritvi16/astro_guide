import 'package:astro_guide/controllers/astrologerDetail/AstrologerDetailBinding.dart';
import 'package:astro_guide/controllers/blog/BlogBinding.dart';
import 'package:astro_guide/controllers/blog/BlogsBinding.dart';
import 'package:astro_guide/controllers/call/CallBinding.dart';
import 'package:astro_guide/controllers/call/JoinScreenBinding.dart';
import 'package:astro_guide/controllers/call/OneToOneMeetBinding.dart';
import 'package:astro_guide/controllers/changeMobile/ChangeMobileBinding.dart';
import 'package:astro_guide/controllers/chat/ChatBinding.dart';
import 'package:astro_guide/controllers/contactUs/ContactUsBinding.dart';
import 'package:astro_guide/controllers/custom/CustomBinding.dart';
import 'package:astro_guide/controllers/customPDFViewer/CustomPDFViewerBinding.dart';
import 'package:astro_guide/controllers/custom_youtube_player/CustomYoutubePlayerBinding.dart';
import 'package:astro_guide/controllers/following/FollowingBinding.dart';
import 'package:astro_guide/controllers/information/InformationBinding.dart';
import 'package:astro_guide/controllers/language/LanguageBinding.dart';
import 'package:astro_guide/controllers/myProfile/MyProfileBinding.dart';
import 'package:astro_guide/controllers/review/ReviewBinding.dart';
import 'package:astro_guide/controllers/service/HoroscopeBinding.dart';
import 'package:astro_guide/controllers/session/CheckSessionBinding.dart';
import 'package:astro_guide/controllers/home/HomeBinding.dart';
import 'package:astro_guide/controllers/login/LoginBinding.dart';
import 'package:astro_guide/controllers/otp/OTPBinding.dart';
import 'package:astro_guide/controllers/signUp/SignUpBinding.dart';
import 'package:astro_guide/controllers/splash/SplashBinding.dart';
import 'package:astro_guide/controllers/support/SupportBinding.dart';
import 'package:astro_guide/controllers/support/SupportChatBinding.dart';
import 'package:astro_guide/controllers/testimonial/ManageTestimonialBinding.dart';
import 'package:astro_guide/controllers/testimonial/MyTestimonialBinding.dart';
import 'package:astro_guide/controllers/testimonial/TestimonialBinding.dart';
import 'package:astro_guide/controllers/testimonial/TestimonialsBinding.dart';
import 'package:astro_guide/controllers/video/VideosBinding.dart';
import 'package:astro_guide/controllers/wallet/InvoiceBinding.dart';
import 'package:astro_guide/controllers/wallet/WalletBinding.dart';
import 'package:astro_guide/controllers/wishlist/WishlistBinding.dart';
import 'package:astro_guide/customPDFViewer/CustomPDFViewer.dart';
import 'package:astro_guide/custom_youtube_player/CustomYoutubePlayer.dart';
import 'package:astro_guide/photoView/PhotoView.dart';
import 'package:astro_guide/shared/middleware/InternetMiddleware.dart';
import 'package:astro_guide/shared/widgets/NoInternetPage.dart';
import 'package:astro_guide/views/authentication/Login.dart';
import 'package:astro_guide/views/Splash.dart';
import 'package:astro_guide/views/authentication/OTP.dart';
import 'package:astro_guide/views/authentication/SignUp.dart';
import 'package:astro_guide/views/home/Home.dart';
import 'package:astro_guide/views/home/astrologerDetail/AstrologerDetail.dart';
import 'package:astro_guide/views/home/call/Call.dart';
import 'package:astro_guide/views/home/call/OneToOneMeet.dart';
import 'package:astro_guide/views/home/call/join_screen.dart';
import 'package:astro_guide/views/home/chat/Chat.dart';
import 'package:astro_guide/views/home/chat/CheckSession.dart';
import 'package:astro_guide/views/home/dashboard/blog/Blog.dart';
import 'package:astro_guide/views/home/dashboard/blog/Blogs.dart';
import 'package:astro_guide/views/home/dashboard/custom/Custom.dart';
import 'package:astro_guide/views/home/dashboard/services/Horoscope.dart';
import 'package:astro_guide/views/home/dashboard/testimonial/ManageTestimonial.dart';
import 'package:astro_guide/views/home/dashboard/testimonial/MyTestimonial.dart';
import 'package:astro_guide/views/home/dashboard/testimonial/Testimonial.dart';
import 'package:astro_guide/views/home/dashboard/testimonial/Testimonials.dart';
import 'package:astro_guide/views/home/dashboard/videos/Videos.dart';
import 'package:astro_guide/views/home/following/Following.dart';
import 'package:astro_guide/views/home/review/Review.dart';
import 'package:astro_guide/views/home/settings/ChangeMobile.dart';
import 'package:astro_guide/views/home/settings/ContactUs.dart';
import 'package:astro_guide/views/home/settings/Information.dart';
import 'package:astro_guide/views/home/settings/MyProfile.dart';
import 'package:astro_guide/views/home/support/Support.dart';
import 'package:astro_guide/views/home/support/SupportChat.dart';
import 'package:astro_guide/views/home/wallet/Invoice.dart';
import 'package:astro_guide/views/home/wallet/Wallet.dart';
import 'package:astro_guide/views/home/wishlist/Wishlist.dart';
import 'package:astro_guide/views/language/Language.dart';
import 'package:get/get.dart';

class Routes {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(
      name: '/noInternet',
      page: () => NoInternetPage(),
    ),
    GetPage(
      name: '/splash',
      page: () => Splash(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => Login(),
      binding: LoginBinding()
    ),
    GetPage(
      name: '/otp',
      page: () => OTP(),
      binding: OTPBinding()
    ),
    GetPage(
      name: '/signUp',
      page: () => SignUp(),
      binding: SignUpBinding()
    ),
    GetPage(
        name: '/home',
        page: () => Home(),
        binding: HomeBinding(),
        middlewares: [InternetMiddleware()]
    ),
    GetPage(
        name: '/language',
        page: () => Language(),
        binding: LanguageBinding(),
        middlewares: [InternetMiddleware()]
    ),
    GetPage(
        name: '/wallet',
        page: () => Wallet(),
        binding: WalletBinding(),
    ),
    GetPage(
        name: '/checkSession',
        page: () => CheckSession(),
        binding: CheckSessionBinding(),
    ),
    GetPage(
        name: '/chat',
        page: () => Chat(),
        binding: ChatBinding(),
    ),
    GetPage(
      name: '/astrologerDetail',
      page: () => AstrologerDetail(),
      binding: AstrologerDetailBinding(),
      preventDuplicates: false,
      participatesInRootNavigator: true,
      maintainState: false
    ),
    GetPage(
        name: '/call',
        page: () => Call(),
        binding: CallBinding(),
    ),
    GetPage(
        name: '/oneToOneMeet',
        page: () => OneToOneMeet(),
        binding: OneToOneMeetBinding(),
    ),
    GetPage(
        name: '/joinScreen',
        page: () => JoinScreen(),
        binding: JoinScreenBinding(),
    ),
    GetPage(
        name: '/information',
        page: () => Information(),
        binding: InformationBinding(),
    ),
    GetPage(
        name: '/blog',
        page: () => Blog(),
        binding: BlogBinding(),
    ),
    GetPage(
        name: '/blogs',
        page: () => Blogs(),
        binding: BlogsBinding(),
    ),
    GetPage(
        name: '/myTestimonial',
        page: () => MyTestimonial(),
        binding: MyTestimonialBinding(),
    ),
    GetPage(
        name: '/manageTestimonial',
        page: () => ManageTestimonial(),
        binding: ManageTestimonialBinding(),
    ),
    GetPage(
        name: '/testimonial',
        page: () => Testimonial(),
        binding: TestimonialBinding(),
    ),
    GetPage(
        name: '/testimonials',
        page: () => Testimonials(),
        binding: TestimonialsBinding(),
    ),
    GetPage(
        name: '/myProfile',
        page: () => MyProfile(),
        binding: MyProfileBinding(),
    ),
    GetPage(
        name: '/videos',
        page: () => Videos(),
      binding: VideosBinding()
    ),
    GetPage(
        name: '/customYoutubePlayer',
        page: () => CustomYoutubePlayer(),
      binding: CustomYoutubePlayerBinding()
    ),
    GetPage(
        name: '/wishlist',
        page: () => Wishlist(),
      binding: WishlistBinding()
    ),
    GetPage(
        name: '/following',
        page: () => Following(),
      binding: FollowingBinding()
    ),
    GetPage(
        name: '/horoscope',
        page: () => Horoscope(),
      binding: HoroscopeBinding()
    ),
    GetPage(
        name: '/custom',
        page: () => Custom(),
      binding: CustomBinding()
    ),
    GetPage(
        name: '/photoView',
        page: () => PhotoView(),
    ),
    GetPage(
      name: '/support',
      page: () => Support(),
      binding: SupportBinding(),
    ),
    GetPage(
      name: '/supportChat',
      page: () => SupportChat(),
      binding: SupportChatBinding(),
    ),
    GetPage(
      name: '/customPDFViewer',
      page: () => CustomPDFViewer(),
      binding: CustomPDFViewerBinding(),
    ),
    GetPage(
        name: '/review',
        page: () => Review(),
        binding: ReviewBinding()
    ),
    GetPage(
        name: '/invoice',
        page: () => Invoice(),
        binding: InvoiceBinding()
    ),
    GetPage(
        name: '/changeMobile',
        page: () => ChangeMobile(),
        binding: ChangeMobileBinding()
    ),
    GetPage(
        name: '/contactUs',
        page: () => ContactUs(),
        binding: ContactUsBinding()
    ),
  ];
}
