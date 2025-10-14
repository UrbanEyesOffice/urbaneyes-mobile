import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['ru', 'en', 'ky'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ruText = '',
    String? enText = '',
    String? kyText = '',
  }) =>
      [ruText, enText, kyText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Profile
  {
    '898n1ej4': {
      'ru': 'Редактировать профиль',
      'en': 'Edit profile',
      'ky': '',
    },
    'b7er5pp3': {
      'ru': 'Форма обратной связи',
      'en': '',
      'ky': '',
    },
    'r26iwyuy': {
      'ru': 'Админ панель',
      'en': 'Admin panel',
      'ky': '',
    },
    'ef4p4cwl': {
      'ru': 'Выход',
      'en': 'Exit',
      'ky': '',
    },
  },
  // EditProfile
  {
    'r54ydkcj': {
      'ru': 'Имя',
      'en': 'Name',
      'ky': 'Аты-жөнү',
    },
    'ai45js6n': {
      'ru': '',
      'en': 'Name',
      'ky': '',
    },
    '2x0tc9ee': {
      'ru': 'Email',
      'en': 'Email',
      'ky': 'Email',
    },
    'c2238ddw': {
      'ru': '',
      'en': 'Email',
      'ky': '',
    },
    'zjhhppo5': {
      'ru': 'Пол',
      'en': 'Gender',
      'ky': 'Жыныс',
    },
    'hacoa4kz': {
      'ru': 'Выбрать пол',
      'en': 'Select gender',
      'ky': 'Жынысты тандаңыз',
    },
    'ivnt704y': {
      'ru': 'Search for an item...',
      'en': '',
      'ky': '',
    },
    '36ze9hen': {
      'ru': 'Другой',
      'en': 'Other',
      'ky': 'Башка',
    },
    'sqcr0r76': {
      'ru': 'Мужской',
      'en': 'Male',
      'ky': 'Эркек',
    },
    '81llvzrd': {
      'ru': 'Женский',
      'en': 'Female',
      'ky': 'Аял',
    },
    'vvjvh66o': {
      'ru': 'Год рождения',
      'en': 'Year of birth',
      'ky': 'Туулган жылы',
    },
    'juusgo40': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'jg2tlhpo': {
      'ru': 'ГГГГ',
      'en': 'YYYY',
      'ky': 'ЖЖЖЖ',
    },
    'qdr5c66g': {
      'ru': 'Сохранить изменения',
      'en': 'Save changes',
      'ky': 'Өзгөрүүлөрдү сактоо',
    },
    'crlfku7o': {
      'ru': 'Выйти',
      'en': 'Logout',
      'ky': 'Чыгуу',
    },
    'ss8ftfo0': {
      'ru': 'Настройки',
      'en': 'Edit profile',
      'ky': 'Аккаунтту өзгөртүү',
    },
  },
  // AdmiPannel
  {
    '1yyumys0': {
      'ru': 'Общая статистика',
      'en': 'Statistics',
      'ky': '',
    },
    '5fbg8sh0': {
      'ru': 'Пользователя',
      'en': 'User',
      'ky': '',
    },
    'pv7z7eq0': {
      'ru': 'Опроса',
      'en': 'Poll',
      'ky': '',
    },
    'i973ejr7': {
      'ru': 'Ответов',
      'en': 'Replies',
      'ky': '',
    },
    'p5jifatt': {
      'ru': 'Создать опрос',
      'en': 'Create a survey',
      'ky': '',
    },
    'cwc16pdj': {
      'ru': 'Статистика и редактирование опросов',
      'en': 'Statistics and editing',
      'ky': '',
    },
    'dzmd9pab': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // AllSurveysStat
  {
    '3zmb03kt': {
      'ru': 'Ответов: ',
      'en': 'Answers:',
      'ky': '',
    },
    'f8d8fszo': {
      'ru': 'Статистика',
      'en': 'Statistic',
      'ky': '',
    },
    'lx5iewjh': {
      'ru': 'Редактирование',
      'en': 'Edit',
      'ky': '',
    },
    'j7wjgw3d': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // EditQuestion
  {
    'd4gp5ie4': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // CualificatedSurvey
  {
    's5kbsmyt': {
      'ru': 'Расскажи немного о себе',
      'en': 'Tell us a little about yourself ',
      'ky': 'Өзүң жөнүндө бир аз айтып бер',
    },
    '4r235815': {
      'ru': 'Имя',
      'en': 'Name',
      'ky': 'Аты-жөнү',
    },
    'oea51z69': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'g3bahn6a': {
      'ru': 'Имя',
      'en': 'Name',
      'ky': 'Аты-жөнү',
    },
    'ss0ux0un': {
      'ru': 'Пол',
      'en': 'Gender',
      'ky': 'Жыныс',
    },
    'p5u8fuji': {
      'ru': 'Выбрать пол',
      'en': 'Select gender',
      'ky': 'Жынысын тандоо',
    },
    '53dp8lau': {
      'ru': 'Search for an item...',
      'en': '',
      'ky': '',
    },
    'cpoyi6n6': {
      'ru': 'Мужской',
      'en': 'Male',
      'ky': 'Эркек',
    },
    'efzp3pjl': {
      'ru': 'Женский',
      'en': 'Female',
      'ky': 'Аял',
    },
    'mpnhy26o': {
      'ru': 'Год рождения',
      'en': 'Year of birth',
      'ky': 'Туулган жылы',
    },
    'wjkjqyjq': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '3m2t4op7': {
      'ru': 'ГГГГ',
      'en': 'YYYY',
      'ky': 'ЖЖЖЖ',
    },
    '9784jlvv': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ky': 'Улантуу',
    },
    'o5ggkybn': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // resetPassword
  {
    '4fysu66t': {
      'ru': 'Забыли пароль',
      'en': 'Forgot Password',
      'ky': '',
    },
    'wveucc1m': {
      'ru':
          'Мы отправим вам письмо на почту со ссылкой для сброса пароля, пожалуйста, введите email используемый для входа в аккаунт ниже.',
      'en':
          'We will send you an email with a link to reset your password, please enter the email associated with your account below.',
      'ky': '',
    },
    '901r6aj7': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '4an6bb95': {
      'ru': 'Введите почту',
      'en': 'Enter email',
      'ky': 'Электрондук почтаңызды киргизиңиз',
    },
    '44ewba3m': {
      'ru': 'Продолжить',
      'en': '',
      'ky': '',
    },
    'qgu61t0s': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // AskGeo
  {
    'vtmdto4u': {
      'ru': 'Включи геолокацию и проходи больше опросов',
      'en': 'Turn on geolocation and take more surveys',
      'ky': 'Геолокацияны күйгүзүп, көбүрөөк сурамжылоодон өтсө болот',
    },
    'nhp57jdr': {
      'ru':
          'Включенная геолокация позволяет легко находить места в городе и оценивать качество и удобство жизни. ',
      'en':
          'The included geolocation makes it easy to find places in the city and assess the quality and convenience of life.',
      'ky':
          'Камтылган геолокация шаардагы жерлерди оңой таап, жашоонун сапатын жана ыңгайлуулугун баалоону жеңилдетет.',
    },
    'ppjhqxbl': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ky': 'Улантуу',
    },
    '0oh1ew0n': {
      'ru': 'Пропустить',
      'en': 'Skip',
      'ky': 'Өткөрүп жибер',
    },
    'tw01smow': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // Feedback
  {
    'qfiyjlxs': {
      'ru': 'Электронная почта',
      'en': 'Email',
      'ky': 'Электрондук почта',
    },
    '09k44dpz': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'frnbmakm': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'axyufzqo': {
      'ru': 'Комментарий',
      'en': 'A comment',
      'ky': 'Комментарий',
    },
    'eqalrq06': {
      'ru': 'Что бы вы хотели добавить/улучшить...',
      'en': 'What would you like to add/improve...',
      'ky': 'Эмнени кошкуңуз/жакшырткыңыз келет...',
    },
    'kvl68h75': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'q58073g6': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ky': 'Улантуу',
    },
    'h9gm8p5r': {
      'ru': 'Форма обратной связи',
      'en': 'Feedback form',
      'ky': 'Пикир формасы',
    },
    'wksz1m74': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // HomePageCopy
  {
    'h4e69wmb': {
      'ru': 'Отметить',
      'en': 'Mark',
      'ky': 'Марк',
    },
    'gohqvhe4': {
      'ru': 'Оценить',
      'en': 'Estimate',
      'ky': 'Баалоо',
    },
    'vsrcveq3': {
      'ru': 'Главная страница',
      'en': 'Home',
      'ky': '',
    },
  },
  // CompleteRegistration
  {
    '0sk7mlan': {
      'ru': 'Мы заботимся \nо конфиденциальности',
      'en': 'We care about privacy',
      'ky': 'Биз жеке маалымат жөнүндө кам көрөбүз',
    },
    'kxb29fbg': {
      'ru': 'Нажимая “Завершить регистрацию”, вы соглашаетесь с ',
      'en': 'By clicking \"Complete registration\" you agree with ',
      'ky': '\"Каттоону аяктоо\" баскычын басуу менен сиз кызматтын ',
    },
    '8k8ft00r': {
      'ru': 'политикой конфиденциальности',
      'en': 'privacy policy',
      'ky': 'купуялык саясаты',
    },
    'mtg8f6ke': {
      'ru': ' и  ',
      'en': ' and ',
      'ky': ' жана ',
    },
    'uxhsgpxc': {
      'ru': 'пользовательским соглашением',
      'en': 'user agreement',
      'ky': 'колдонуучу келишими',
    },
    'nq7aftly': {
      'ru': ' сервиса.',
      'en': ' of the service.',
      'ky': ' менен макул болосуз.',
    },
    'rzmjj5t4': {
      'ru': 'Завершить регистрацию',
      'en': 'Complete registration',
      'ky': 'Катталууну аяктоо',
    },
    '15xm6lvw': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // complete
  {
    'bctulc5c': {
      'ru': 'Спасибо за участие! ',
      'en': 'Thank you for participating!\nYou received +5 points',
      'ky': 'Катышканыңыз үчүн рахмат!\nСиз +5 упай алдыңыз',
    },
    '3349nkpy': {
      'ru': 'Оценки от других горожан на карте.',
      'en': 'Ratings from other citizens on the map.',
      'ky': 'Башкалардын рейтингтеринин картадагы көрүнүшү.',
    },
    'aa8w9qnd': {
      'ru':
          'Мы собрали результаты опросов качества жизни в интерактивную карту города.',
      'en':
          'We have collected the results of quality of life surveys into an interactive map of the city.',
      'ky':
          'Биз шаардын интерактивдүү картасына жашоо сапаты боюнча изилдөөлөрдүн жыйынтыктарын чогулттук.',
    },
    'wnmp7p6k': {
      'ru': 'Перейти на',
      'en': 'Go to',
      'ky': '',
    },
    '6dqeazff': {
      'ru': 'urbaneyes.kg',
      'en': 'urbaneyes.kg',
      'ky': 'urbaneyes.kg',
    },
    'er7gf1xf': {
      'ru': ' ',
      'en': ' ',
      'ky': 'ге өтүү',
    },
    'ipv4ebva': {
      'ru': 'Завершить опрос',
      'en': 'Complete survey',
      'ky': 'Толук сурамжылоо',
    },
    'zdxyp20r': {
      'ru': 'Поделиться',
      'en': 'Share',
      'ky': 'Бөлүшүү',
    },
    's73hg7sf': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // MainAuth
  {
    '38v6jlv3': {
      'ru': 'UrbanEyes',
      'en': 'UrbanEyes',
      'ky': 'UrbanEyes',
    },
    '4h6zkdv5': {
      'ru': 'Помоги своему городу стать лучше!',
      'en': 'Help your city become a better place!',
      'ky': 'Өз шаарыңды жакшыртууга жардам бер!',
    },
    '8ddypxau': {
      'ru': 'Проходи опросы и вноси вклад \nв один клик.',
      'en': 'Take surveys and contribute in one click.',
      'ky': 'Сурамжылоону өтүп, бир баскыч менен көмөктөш.',
    },
    '979366sj': {
      'ru': 'Войти через Google',
      'en': 'Login with Google',
      'ky': 'Google менен кириңиз',
    },
    'b5vady0x': {
      'ru': 'Войти через Apple',
      'en': 'Login with Apple',
      'ky': 'Apple менен кириңиз',
    },
    '3szbi2zr': {
      'ru': 'или',
      'en': 'or',
      'ky': 'же',
    },
    '5uy1dq7o': {
      'ru': 'Создать аккаунт',
      'en': 'Create an account',
      'ky': 'Аккаунт түзүү',
    },
    '61xk9ahq': {
      'ru': 'Уже есть аккаунт?',
      'en': 'Already have an account?',
      'ky': 'Аккаунтуңуз барбы?',
    },
    '0xh4b40q': {
      'ru': 'Войти',
      'en': 'Log in',
      'ky': 'Кирүү',
    },
    'eaga4kpw': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // CreateAccount
  {
    '6afwsk8i': {
      'ru': 'Добро пожаловать в UrbanEyes',
      'en': 'Welcome to UrbanEyes',
      'ky': 'UrbanEyesка кош келиңиз',
    },
    'ploa20tg': {
      'ru': 'Электронная почта',
      'en': 'Email',
      'ky': 'Электрондук почта',
    },
    '29yrmiw5': {
      'ru': 'Введите почту',
      'en': 'Enter your email',
      'ky': 'Электрондук почтаңызды киргизиңиз',
    },
    '2v17k8rj': {
      'ru': 'Пароль',
      'en': 'Password',
      'ky': 'Купуя сөз',
    },
    'ei3gbjkr': {
      'ru': 'Введите пароль',
      'en': 'Enter password',
      'ky': 'Купуя сөз киргизиңиз',
    },
    'l6yg5mqh': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ky': 'Улантуу',
    },
    'm2o26dqv': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // Verification
  {
    'pb5q1mbe': {
      'ru': 'На указанную почту отправлена ссылка для подтверждения аккаунта',
      'en':
          'A link to confirm your account has been sent to the specified email',
      'ky':
          'Каттоо эсебиңизди ырастоо үчүн шилтеме көрсөтүлгөн электрондук почтага жөнөтүлдү',
    },
    'wxvbji67': {
      'ru': 'Отправить повторно',
      'en': 'Send again',
      'ky': 'Кайра жөнөтүү',
    },
    'b3y3onzx': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ky': 'Улантуу',
    },
    'bp6fxkt0': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // Login
  {
    '0hdkv62k': {
      'ru': 'Добро пожаловать в UrbanEyes',
      'en': 'Welcome to UrbanEyes',
      'ky': 'UrbanEyesка кош келиңиз',
    },
    '3o828jti': {
      'ru': 'Электронная почта',
      'en': 'Email',
      'ky': 'Электронная почта',
    },
    'v5upkick': {
      'ru': 'Введите почту',
      'en': 'Enter your email',
      'ky': 'Электрондук почтаңызды киргизиңиз',
    },
    't7851tr2': {
      'ru': 'Пароль',
      'en': 'Password',
      'ky': 'Купуя сөз',
    },
    'aszp07jf': {
      'ru': 'Введите пароль',
      'en': 'Enter password',
      'ky': 'Купуя сөз киргизиңиз',
    },
    'i6oxc0pq': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ky': 'Улантуу',
    },
    '94a6hryh': {
      'ru': 'Забыл пароль',
      'en': 'Forgot password',
      'ky': 'Паролду унутуп калдыңыз',
    },
    '9f1aknqk': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // ViewReward
  {
    'akh99pls': {
      'ru': 'Просмотр',
      'en': 'View',
      'ky': 'Көрүү',
    },
    '3qencxgy': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // AskPushNotifications
  {
    'nxwehmig': {
      'ru': 'Разреши уведомления и оценивай места рядом',
      'en': 'Allow notifications and rate places nearby',
      'ky': 'Билдирмелерге уруксат берип, чөйрөң тууралуу пикир билдир',
    },
    '75xs578i': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ky': 'Улантуу',
    },
    'k7yuiw19': {
      'ru': 'Пропустить',
      'en': 'Skip',
      'ky': 'Өткөрүп жибер',
    },
    '6m56jw0z': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // RewardsPage
  {
    'yawdppzf': {
      'ru': 'Проходи опросы и получай награды',
      'en': 'Complete surveys and get rewards',
      'ky': 'Сурамжылоолордон өтүп, сыйлыктарды ал',
    },
    'g85ffecm': {
      'ru': 'Чем больше баллов, тем ценнее награды от наших партнеров.',
      'en': 'The more points, the more valuable the rewards from our partners.',
      'ky':
          'Канчалык көп упай болсо, өнөктөштөрүбүздүн сыйлыктары ошончолук баалуу.',
    },
    '65w3o82e': {
      'ru': 'Начать',
      'en': 'Begin',
      'ky': 'Баштоо',
    },
    '98m7k5jk': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // CollectedRewards
  {
    'je6fqy4w': {
      'ru': 'Полученные промокоды',
      'en': 'Received promotional codes',
      'ky': 'Жарнамалык коддор алынды',
    },
    'uj4xfm4y': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // RewardsCopy
  {
    '2u9jp27b': {
      'ru': 'накоплено',
      'en': 'accumulated',
      'ky': 'топтолгон',
    },
    'v0w111ix': {
      'ru': 'Награды',
      'en': 'Rewards',
      'ky': 'Сыйлыктар',
    },
    '2lyi4k78': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // ParkingSurvey
  {
    'k2wz1pqr': {
      'ru': 'Сфотографировать',
      'en': 'Take a picture',
      'ky': 'Сүрөткө тартуу үчүн',
    },
    'kzr8fd76': {
      'ru': 'Добавить из галлереи',
      'en': 'Add from gallery',
      'ky': 'Галереядан кошуу',
    },
    'tj6hu4a7': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'b8zcm7at': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '5buym29x': {
      'ru': '',
      'en': 'Comment field',
      'ky': 'Комментарий талаасы',
    },
    '5zxtnbzm': {
      'ru': 'Комментарий',
      'en': 'A comment',
      'ky': 'Комментарий',
    },
    'ao976zzq': {
      'ru': 'Держите в курсе/готов обсудить',
      'en': 'Keep me posted/ready to discuss',
      'ky': 'Мени кабардар кылып туруңуз/талкуулоого даяр',
    },
    'cw3iych7': {
      'ru': 'Телеграмм/Whatsapp/Телефон',
      'en': 'Telegram/Whatsapp/Phone',
      'ky': 'Telegram/Whatsapp/Телефон',
    },
    '1tdmlrf9': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'ck0vn711': {
      'ru': 'Отправить',
      'en': 'Send',
      'ky': 'Жөнөтүү',
    },
    'uu80ir7d': {
      'ru': 'Field is required',
      'en': '',
      'ky': '',
    },
    'grdfvakl': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'ky': '',
    },
    'cz96vnn5': {
      'ru': 'Обязательное поле',
      'en': 'Field is required',
      'ky': 'Талаа талап кылынат',
    },
    'nvdcw1na': {
      'ru': 'Please choose an option from the dropdown',
      'en': '',
      'ky': '',
    },
    'yzu4r1jy': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // OnboardingVideo
  {
    'btdgpc21': {
      'ru': 'Закрыть',
      'en': 'Close',
      'ky': 'Жабуу',
    },
    'yajg04pq': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // Leaderboard
  {
    'akm9ibkg': {
      'ru': 'Таблица лидеров',
      'en': 'Leaderboard',
      'ky': 'Лидер тактасы',
    },
    'nionjlrm': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // QuestionWithCheckboxes
  {
    '8hnm164w': {
      'ru': 'Оцените состояние детской площадки',
      'en': '',
      'ky': '',
    },
    '26jxn76d': {
      'ru':
          'Пожалуйста, выберите наиболее подходящий вариант и при необходимости прикрепите фото.',
      'en': '',
      'ky': '',
    },
    '6j0ej2ue': {
      'ru': 'Отличное состояние',
      'en': '',
      'ky': '',
    },
    '1uru3tdk': {
      'ru': 'Хорошее, но требует мелкого ремонта',
      'en': '',
      'ky': '',
    },
    '75r5wila': {
      'ru': 'Удовлетворительное состояние',
      'en': '',
      'ky': '',
    },
    'km35qdt9': {
      'ru': 'Требуется серьезный ремонт',
      'en': '',
      'ky': '',
    },
    'hwo1wla8': {
      'ru': 'Аварийное состояние',
      'en': '',
      'ky': '',
    },
    'wlh5qo5g': {
      'ru': 'Прикрепить фото',
      'en': '',
      'ky': '',
    },
    'apr5ewea': {
      'ru': 'Нажмите чтобы добавить фото',
      'en': '',
      'ky': '',
    },
    'k5et27yw': {
      'ru': 'Продолжить',
      'en': '',
      'ky': '',
    },
  },
  // BuildingQuestion1
  {
    '6z8t9ky7': {
      'ru': 'Доступность зданий',
      'en': 'Accessibility of buildings',
      'ky': 'Курулуштун жеткиликтүүлүгү',
    },
    '81dluyxt': {
      'ru': 'Выберите тип здания',
      'en': 'Select building type',
      'ky': 'Имарат түрүн тандаңыз',
    },
    'h2xtww2y': {
      'ru': 'Далее',
      'en': 'Next',
      'ky': 'Кийинки',
    },
    'arxs4ryl': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // BuildingQuestion2
  {
    'v89opp3q': {
      'ru': 'Как вы оцениваете доступность  этого здания?',
      'en': 'How do you assess the accessibility of this building?',
      'ky': 'Бул имараттын жеткиликтүүлүгүн кандай баалайсыз?',
    },
    'bgni3wvx': {
      'ru': 'Что понравилось больше всего?',
      'en': 'What did you like the most?',
      'ky': 'Сизге эң эмнеси жакты?',
    },
    'tbd6zk52': {
      'ru': 'С чем возникли сложности?',
      'en': 'What difficulties arose?',
      'ky': 'Кандай кыйынчылыктар болду?',
    },
    'dw0nhknb': {
      'ru': 'Опишите свой опыт',
      'en': 'Describe your experience',
      'ky': 'Тажрыйбаңызды сүрөттөп бериңиз',
    },
    '2ny5i1sg': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'hae2tz3v': {
      'ru': 'Прикрепить фото',
      'en': 'Attach photo',
      'ky': 'Сүрөт тиркөө',
    },
    '4zomp87c': {
      'ru': '+ добавить еще фото',
      'en': '+ add more photos',
      'ky': '+ дагы сүрөттөрдү кошуу',
    },
    '87tul4rh': {
      'ru': 'Завершить',
      'en': 'Finish',
      'ky': 'Бүттү',
    },
    '50g0bp9e': {
      'ru': 'Доступность зданий',
      'en': 'Accessibility of buildings',
      'ky': 'Курулуштун жеткиликтүүлүгү',
    },
    'uadhrt9d': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // questionCopy
  {
    't2o6s7kt': {
      'ru': 'Поле для комментария',
      'en': 'Comment field',
      'ky': 'Комментарий талаасы',
    },
    'fdrufku3': {
      'ru': 'Далее',
      'en': 'Next',
      'ky': 'Андан ары',
    },
    'hmlcldak': {
      'ru': 'Завершить',
      'en': 'Complete',
      'ky': 'Бүттү',
    },
    'ivx4r7eq': {
      'ru': 'Изменить локацию',
      'en': 'Change location',
      'ky': 'Жайгашкан жерди өзгөртүү',
    },
    'yg23dy4b': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // EmptyCollectedRewardsList
  {
    'p4bsixoc': {
      'ru': 'Пока нет наград. ',
      'en': 'No awards yet.',
      'ky': 'Азырынча сыйлыктар жок.',
    },
    'xzhuem4j': {
      'ru': 'Проходи опросы и получай баллы.',
      'en': 'Take surveys and get points.',
      'ky': 'Сурамжылоого катышып, упайларды алыңыз.',
    },
  },
  // PrivacyBottomSheet
  {
    'fyn6s0hn': {
      'ru': 'Политика конфиденциальности',
      'en': 'Privacy Policy',
      'ky': 'Купуялык саясаты',
    },
    '658o929i': {
      'ru': 'Пользовательское соглашение',
      'en': 'User agreement',
      'ky': 'Пайдалануу шарттары',
    },
    'o1pvxft9': {
      'ru': 'Закрыть',
      'en': 'Close',
      'ky': 'Жабуу',
    },
  },
  // FeedbackAlert
  {
    'ampyajw9': {
      'ru': 'Поделитесь мнением о приложении 🙂',
      'en': 'Share your opinion about the application 🙂',
      'ky': 'Колдонмо жөнүндө пикириңиз менен бөлүшүңүз 🙂',
    },
    '19fvfw1x': {
      'ru': 'Что бы вы хотели добавить/улучшить...',
      'en': 'What would you like to add/improve...',
      'ky': 'Эмнени кошкуңуз/жакшырткыңыз келет...',
    },
    '28cpg6e3': {
      'ru': 'Отправить',
      'en': 'Send',
      'ky': 'Жөнөтүү',
    },
  },
  // OSM
  {
    'zsfs86g0': {
      'ru': 'Выберите локацию',
      'en': 'Select location',
      'ky': 'Жайгашкан жерди тандаңыз',
    },
    '91278s2u': {
      'ru': 'Выбрать',
      'en': 'Choose',
      'ky': 'Тандоо',
    },
  },
  // LeaderboardUser
  {
    'uorthmv0': {
      'ru': 'xp',
      'en': 'xp',
      'ky': 'xp',
    },
  },
  // ImagePicker
  {
    'xrg54649': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'iyhsqlbw': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'ud60c1p3': {
      'ru': 'Сфотографировать',
      'en': 'Take a picture',
      'ky': 'Сүрөткө тартуу үчүн',
    },
    '5xwymmgo': {
      'ru': 'Добавить из галлереи',
      'en': 'Add from gallery',
      'ky': 'Галереядан кошуу',
    },
  },
  // BuildingTypeSelector
  {
    '45bew4no': {
      'ru': 'Выбрать',
      'en': 'Choose',
      'ky': 'Тандоо',
    },
  },
  // LanguageSelector
  {
    '523ytre1': {
      'ru': 'Выберите язык',
      'en': 'Select Language',
      'ky': 'Тилди тандаңыз',
    },
    'ejavqhx7': {
      'ru': 'Кыргызча',
      'en': 'Кыргызча',
      'ky': 'Кыргызча',
    },
    'jwzfo073': {
      'ru': 'Русский',
      'en': 'Русский',
      'ky': 'Русский',
    },
    'anhslqbk': {
      'ru': 'English',
      'en': 'English',
      'ky': 'English',
    },
  },
  // Miscellaneous
  {
    'b183b2np': {
      'ru': 'Button',
      'en': 'Feedback form',
      'ky': '',
    },
    '04eybt9l': {
      'ru': 'Label here...',
      'en': '',
      'ky': '',
    },
    'csfwsim5': {
      'ru': 'Button',
      'en': '',
      'ky': '',
    },
    '2mp7kw8l': {
      'ru': 'Button',
      'en': '',
      'ky': '',
    },
    'icxi1t8c': {
      'ru': 'Button',
      'en': '',
      'ky': '',
    },
    'vwaeltyu': {
      'ru': 'Label here...',
      'en': '',
      'ky': '',
    },
    '0wl2f4b4': {
      'ru': 'Button',
      'en': '',
      'ky': '',
    },
    'os1wqxwr': {
      'ru': 'Button',
      'en': '',
      'ky': '',
    },
    'uewk8z49': {
      'ru':
          'Включённая геолокация позволяет легко находить места в городе и оценивать качество и удобство жизни.',
      'en':
          'The included geolocation makes it easy to find places in the city and assess the quality and convenience of life.',
      'ky':
          'Камтылган геолокация шаардагы жерлерди оңой таап, жашоонун сапатын жана ыңгайлуулугун баалоону жеңилдетет.',
    },
    'oqhni9ny': {
      'ru': 'Фотографируй и отмечай места неправильной парковки ',
      'en': '',
      'ky': '',
    },
    'd1zkka5r': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'auqafdkr': {
      'ru': 'Разреши пуш-уведомления и оценивай места рядом',
      'en': '',
      'ky': '',
    },
    '2jtpf996': {
      'ru': 'Это позволяет нам улучшать Urban Eyes и делать более удобным ',
      'en': '',
      'ky': '',
    },
    'b1efy6b6': {
      'ru':
          'Включённая геолокация позволяет легко находить места в городе и оценивать качество и удобство жизни.',
      'en': '',
      'ky': '',
    },
    'djdakqwk': {
      'ru':
          'Включённая геолокация позволяет легко находить места в городе и оценивать качество и удобство жизни.',
      'en': '',
      'ky': '',
    },
    '57uoxhlb': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'w551e36b': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '5aws06f8': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '96mhfhml': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'do1j20tb': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '0u66ye8v': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'yjicdp7c': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '8qa3ulx4': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'wdn31qf1': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'qf97w1gz': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'fmspfsch': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'zoj9vsjz': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'lhfnb3q7': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'r8817hbc': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'teem5mb8': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'jz1ducbk': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '9iatqk9r': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'g2m3sdjf': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'suyirldw': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '8jbfee4a': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'rajliv6t': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'hil87eaw': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    '64v0cr0c': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'lzx4hexl': {
      'ru': '',
      'en': '',
      'ky': '',
    },
    'muxwarul': {
      'ru': '',
      'en': '',
      'ky': '',
    },
  },
].reduce((a, b) => a..addAll(b));
