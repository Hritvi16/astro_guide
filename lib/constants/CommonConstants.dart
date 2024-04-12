class CommonConstants {
  static String rupee = "₹";
  static String per = "%";
  static String id = "id";
  static String name = "name";
  static String mobile = "mobile";
  static String email = "email";
  static String fcm = "fcm";
  static String status="status";
  static String user_id="user_id";
  static String astro_id="astro_id";
  static String essential="essential";
  static String seconds="seconds";

  static List<String> gender = [
    "MALE",
    "FEMALE",
    "OTHER",
  ];

  static List<String> filters = [
    "Sort by",
    "Expertise",
    "Language",
    "Gender",
    "Country"
  ];

  static List<String> sort = [
    'Popularity',
    'Experience: High to Low',
    'Experience: Low to High',
    'Sessions: High to Low',
    'Sessions: Low to High',
    'Chat Price: High to Low',
    'Chat Price: Low to High',
    'Call Price: High to Low',
    'Call Price: Low to High',
    'Rating: High to Low',
    'Rating: Low to High',
  ];
  static List<String> reasons = ['Chat','Call','Rating Dispute','Payment Issues','Some Other Isuues'];

  static List<String> session_status = ['ALL', 'WAITLISTED', 'COMPLETED', 'ACTIVE', 'REQUESTED', 'RECONNECT','MISSED', 'REJECTED', 'CANCELLED'];

  static List<String> horoscope_day = ['Yesterday', 'Today', 'Tomorrow'];
  static List<String> zodiac_signs = ['Aries', 'Taurus', 'Gemini', 'Cancer', 'Leo', 'Virgo', 'Libra', 'Scorpio', 'Sagittarius', 'Capricorn', 'Aquarius', 'Pisces'];
  static List<String> kundli = ['Basic', 'Charts', 'KP', 'Dasha'];
  static List<String> dasha = ['Vimshottari', 'Yogini'];
  static List<String> planet = ['Sign', 'Nakshatra'];

  static List<String> charts = ['Birth', 'Navamsa', 'Divisional'];
  static List<String> divCharts = [
    'Chalit', 'Sun', 'Moon', 'Hora', 'Drekkana', 'Chaturthamsa', 'Saptamsa', 'Dasamsa', 'Dwadasamsa', 'Shodasamsa',
    'Vimsamsa', 'Chaturvisamsa', 'Trimsamsa', 'Khavedamsa', 'Akshavedamsa', 'Shastiamsa'];

  static Map<String, Map<String, String>> chartDetails = {
    charts[0] : {'chart' : 'D1', 'name' : 'Birth'},
    charts[1] : {'chart' : 'D9', 'name' : 'Navamsa'},
    divCharts[0] : {'chart' : 'chalit', 'name' : 'Chalit'},
    divCharts[1] : {'chart' : 'SUN', 'name' : 'Sun'},
    divCharts[2] : {'chart' : 'MOON', 'name' : 'Moon'},
    divCharts[3] : {'chart' : 'D2', 'name' : 'Hora (D-2)'},
    divCharts[4] : {'chart' : 'D3', 'name' : 'Drekkana (D-3)'},
    divCharts[5] : {'chart' : 'D4', 'name' : 'Chaturthamsa (D-4)'},
    divCharts[6] : {'chart' : 'D7', 'name' : 'Saptamsa (D-7)'},
    divCharts[7] : {'chart' : 'D10', 'name' : 'Dasamsa (D-10)'},
    divCharts[8] : {'chart' : 'D12', 'name' : 'Dwadasamsa (D-12)'},
    divCharts[9] : {'chart' : 'D16', 'name' : 'Shodasamsa (D-16)'},
    divCharts[10] : {'chart' : 'D20', 'name' : 'Vimsamsa (D-20)'},
    divCharts[11] : {'chart' : 'D24', 'name' : 'Chaturvisamsa'},
    divCharts[12] : {'chart' : 'D30', 'name' : 'Trimsamsa'},
    divCharts[13] : {'chart' : 'D40', 'name' : 'Khavedamsa (D-40)'},
    divCharts[14] : {'chart' : 'D45', 'name' : 'Akshavedamsa (D-45)'},
    divCharts[15] : {'chart' : 'D60', 'name' : 'Shastiamsa (D-60)'},
  };

  static Map<String, String> ashtakootDetails = {
    "varna" : "Varna refers to the mental compatibility of the two persons involved. It holds nominal effect in the matters of marriage compatibility.",
    "vashya" : "Vashya indicates the bride and the groom's tendency to dominate or influence each other in a marriage.",
    "tara" : "Tara is the indicator of the birth star compatibility of the bride and the groom. It also indicates the fortune of the couple.",
    "yoni" : "Yoni is the indicator of the sexual or physical compatibility between the bride and the groom in question.",
    "graha_maitri" : "Graha Maitri is the indicator of the intellectual and mental connection between the prospective couple.",
    "gana" : "Gana is the indicator of the behaviour, character and temperament of the potential bride and groom towards each other.",
    "bhakoota" : "Bhakoota is related to the couple's joys and sorrows together and assesses the wealth and health after their wedding.",
    "nadi" : "Nadi is related to the health compatibility of the couple. Matters of childbirth and progeny are also determined with this Guna.",
  };

  static List<Map<String, String>> paymentMethods = [
    {"name" : "RAZORPAY", "label" : "Razorpay", "icon" : "razorpay.png"},
    {"name" : "STRIPE", "label" : "Stripe", "icon" : "stripe.png"},
    // {"name" : "PHONEPE", "label" : "Phone Pe", "icon" : "phonepe.png"},
  ];

  static String environment = "PRODUCTION";
  //static String appId = "10ded24605604c76a4a26e15161b7453";
  static String appId = "10ded24605604c76a4a26e15161b7453";
  static String merchantId = "M22YM0CFSKQ2G";
  static bool enableLogging = true;
  static String saltKey = "cf5f9d6a-c1c3-4870-bb52-9675b01502f5";
  static String saltIndex = "1";
  static String callbackUrl = "https://webhook.site/b3ffe42c-16c9-474b-8699-b6d2c4d05a1c";
  static String apiEndPoint = "/pg/v1/pay";
  static String checksum="";
  static String body="";
  static String packageName = "com.ss.astro_guide";
}