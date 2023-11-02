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

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

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
    'affu9s3j': {
      'ru': 'Настройки',
      'en': 'Edit profile',
      'ky': 'Аккаунтту өзгөртүү',
    },
    'd6okkenh': {
      'ru': 'Рус',
      'en': 'Eng',
      'ky': 'Кыр',
    },
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
    'vvjvh66o': {
      'ru': 'Дата рождения',
      'en': 'Date of birth',
      'ky': 'Туулган күн',
    },
    'qdr5c66g': {
      'ru': 'Сохранить изменения',
      'en': 'Save changes',
      'ky': 'Өзгөрүүлөрдү сактоо',
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
    '5nu4wtxj': {
      'ru': 'Другой',
      'en': 'Other',
      'ky': 'Башка',
    },
    'm366ycev': {
      'ru': 'Мужской',
      'en': 'Male',
      'ky': 'Эркек',
    },
    'cpoyi6n6': {
      'ru': 'Женский',
      'en': 'Female',
      'ky': 'Аял',
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
    'mpnhy26o': {
      'ru': 'Дата рождения',
      'en': 'Date of birth',
      'ky': 'Туулган күн',
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
      'ky': 'Геолокацияны күйгүзүп, көбүрөөк сурамжылоону өтсө болот',
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
      'ru': 'Разрешить доступ',
      'en': 'Allow access',
      'ky': 'Уруксат берүү',
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
    '2tortty5': {
      'ru': 'Форма обратной связи',
      'en': 'Feedback form',
      'ky': 'Пикир формасы',
    },
    'qfiyjlxs': {
      'ru': 'Электронная почта',
      'en': 'Email',
      'ky': 'Электронная почта',
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
      'ru': '',
      'en': '',
      'ky': '',
    },
    'kvl68h75': {
      'ru': 'Что бы вы хотели добавить/улучшить...',
      'en': 'What would you like to add/improve...',
      'ky': 'Эмнени кошкуңуз/жакшырткыңыз келет...',
    },
    'q58073g6': {
      'ru': 'Продолжить',
      'en': 'Continue',
      'ky': 'Улантуу',
    },
    'wksz1m74': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // HomePageCopy
  {
    'f70g83zr': {
      'ru': 'UrbanEyes',
      'en': 'UrbanEyes',
      'ky': 'UrbanEyes',
    },
    '1qnika23': {
      'ru': 'в этой локации',
      'en': 'in this location',
      'ky': 'бул жерде',
    },
    'gohqvhe4': {
      'ru': 'Пройти',
      'en': 'Pass',
      'ky': 'Сурамжылоого катышуу',
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
      'ru': 'Мы заботимся \nо вашей конфиденциальности',
      'en': 'We care about your privacy',
      'ky': 'Биз сиздин жеке маалыматыңыз жөнүндө кам көрөбүз',
    },
    'ehi1pwqu': {
      'ru':
          'Мы обезличиваем все результаты пройденных опросов и не делимся вашими личными данными.',
      'en':
          'We anonymise all results of completed surveys and do not share your personal details.',
      'ky':
          'Биз толтурулган сурамжылоонун бардык натыйжаларын анонимдүү кылабыз жана жеке колдонуучулардын жеке маалыматтарын бөлүшпөйбүз.',
    },
    '8xh9n1sn': {
      'ru':
          'Нажимая “Завершить регистрацию” вы соглашаетесь с политикой конфиденциальности и пользовательским соглашением сервиса.',
      'en':
          'By clicking \"Complete registration\" you agree with the privacy policy and user agreement of the service.',
      'ky':
          '\"Каттоону аяктоо\" баскычын басуу менен сиз кызматтын купуялык саясаты жана колдонуучу келишими менен макул болосуз.',
    },
    'rzmjj5t4': {
      'ru': 'Завершить регистрацию',
      'en': 'Complete registration',
      'ky': 'Каттоону жыйынтыктоо',
    },
    '15xm6lvw': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // questionCopy
  {
    '1m0n74wq': {
      'ru': 'Выбрать точку на карте',
      'en': 'Select a point on the map',
      'ky': 'Картадан чекит тандаңыз',
    },
    'rke2k16j': {
      'ru': 'Главная',
      'en': 'Home',
      'ky': '',
    },
  },
  // complete
  {
    'bctulc5c': {
      'ru': 'Опрос пройден!\nСпасибо за участие',
      'en': 'Survey completed!\nThank you for participating',
      'ky': 'Толук сурамжылоо!\nКатышканыңыз үчүн рахмат',
    },
    'ipv4ebva': {
      'ru': 'Завершить опрос',
      'en': 'Complete survey',
      'ky': 'Толук сурамжылоо',
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
    'qcqoiitg': {
      'ru': 'Рус',
      'en': 'Eng',
      'ky': 'Кыр',
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
      'ru': 'На вашу почту мы отправили ссылку для активации',
      'en': 'We have sent an activation link to your email',
      'ky': 'Биз сиздин почтага активдештирүү үчүн кат жөнөттүк',
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
    '9f1aknqk': {
      'ru': 'Home',
      'en': '',
      'ky': '',
    },
  },
  // SelectLocation
  {
    'hb8ugwsz': {
      'ru': 'Укажите ваше местоположение',
      'en': 'Specify your location',
      'ky': 'Жайгашкан жериңизди киргизиңиз',
    },
    'ejl6trna': {
      'ru':
          'Мы можем определить ваше местоположение, если вы разрешите доступ к геолокации.',
      'en':
          'We may determine your location if you allow access to geolocation.',
      'ky':
          'Эгер сиз геолокацияга кирүүгө уруксат берсеңиз, жайгашкан жериңизди аныктай алабыз.',
    },
    'apba59bf': {
      'ru': 'Разрешить',
      'en': 'Allow',
      'ky': 'Уруксат берүү',
    },
    'uvixwoll': {
      'ru': 'Перейти к опросу',
      'en': 'Take the survey',
      'ky': 'Сурамжылоого катышуу',
    },
    'ns3d5u6n': {
      'ru': 'Home',
      'en': '',
      'ky': '',
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
    'uewk8z49': {
      'ru':
          'Включённая геолокация позволяет легко находить места в городе и оценивать качество и удобство жизни.',
      'en':
          'The included geolocation makes it easy to find places in the city and assess the quality and convenience of life.',
      'ky':
          'Камтылган геолокация шаардагы жерлерди оңой таап, жашоонун сапатын жана ыңгайлуулугун баалоону жеңилдетет.',
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
