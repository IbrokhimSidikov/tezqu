import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'totalPayments': 'Total Payments',
      'nextPayment': 'Next Payment',
      'myPayments': 'My Payments',
      'products': 'Products',
      'income': 'Income',
      'expenses': 'Expenses',
      'warehouse': 'Warehouse',
      'dashboard': 'Dashboard',
      'notification': 'Notification',

      // Profile
      'myProfile': 'My Profile',
      'addGuard': 'Add \'Kafil\'',
      'settings': 'Settings',
      'support': 'Support',
      'about': 'About App',
      'contracts': 'Contracts',
      'shareApp': 'Share the App',
      'logout': 'Logout',
      'darkMode': 'Dark Mode',
      'downloadApp': 'Download app',
      'appSetup':'Set up',
      'language':'Language',
      'allNotifications':'All notifications',
      'deleteAccount':'Permanently delete',
      'chooseLanguage':'Choose language',
      'languageSnackbar':'Language set successfully',
      'contactUs':'Contact us',
      'phone':'Phone',
      'email':'Email',
      'workHours':'Work Hours',
      'tgOpening':'Telegram is launching',
      'copy':'Copy',
      'user':'User',
      'administrator':'Administrator',
      'manager':'Manager',
      'deleteAccountMessage':'Would you like to delete account?',
      'cancel':'Cancel',
      'delete':'Delete',
      'deleteAccountSnackbar':'Account deleted successfully',
      'logoutMessage':'Are you sure to logout?',
      'shareWith':'Share with friends',
      'shareLink':'Copy the link',
      'shareLinkSubtitle':'Share with all',
      'appDescription':'Tezqu - Best app to manage your business',
      'shareText':'Download the app',
      'manufacturer':'Manufacturer',
      'produced':'Produced',
      'license':'License',
      'privacy':'Privacy',
      'terms':'Terms',
      'version':'Version',
      'supportSubtitle':'Get help with your account',
      'supportEmail':'support@tezqu.com',

      // My Payments
      'nextPayments':'Next payments',
      'noNextPayments':'No next payments',
      'paymentsHistory':'Payments history',
      'noPaymentsHistory':'No Payments history',

      'paymentDetails':'Payment details',
      'contractId':'Contract ID',
      'remainingAmount':'Remaining amount',
      'contract':'Contract',
      'mainTerms':'Main terms',

      //Products
      'productsDesc':'Description about product',
      'year':'Year',
      'color':'Color',
      'origin':'Origin',
      'mileage':'Mileage',
      'fuelType':'Fuel type',
      'plateNumber':'Plate Number',
      'transmission':'Transmission',
      'order':'Order',
      'toBuy':'To Buy',
      'sendRequest':'Send request',
      'contactMe':'Contact Me',
      'contact':'Contact',
      'callCenter':'Call Center',
      'requestReceived':'Request Received',
      'requestDialogText':'We will contact you soon!',

      //Income
      'incomeSources':'Income Sources',
      'accept':'Accept',
      'total':'Total',
      'collected':'Collected',
      'notReceived':'Not received',
      'dateOfPayment':'Date of Payment',
      'cash':'Cash',
      'card':'Card',

      //Expense
      'expense':'Expense',
      'expenseList':'List of Expenses',
      'paid':'Paid',
      'notPaid':'Not paid',
      'dateOfExpense':'Date of Expense',
      'addExpense':'Add expense',
      'title':'Title',
      'expenseType':'Type of expense',
      'desc':'Description',
      'expenseDesc':'Description of expense',
      'category':'Category',
      'sum':'Sum',
      'currency':'Currency',
      'paymentMethod':'Payment method',
      'paymentBy':'Payment by',
      'nameSurname':'Name & Surname',
      'date':'Date',
      'receipt':'Receipt (optional)',
      'addReceipt':'Upload Receipt',
      'save':'Save',

      //Warehouse
      'types':'Types',
      'aboutProduct':'About product',
      'placeOrder':'Place order',
      'addProduct':'Add product',
      'name':'Name',
      'price':'Price',
      'note':'Note',
      'photo':'Photo',
      'addPhoto':'Add photo',

      //Favourites
      'favourites':'Favourites',

      // Additional keywords
      'collector':'Collector',
      'customer':'Customer',
      'investor':'Investor',
      'error':'Error',
      'retry':'Retry',
      'postponed':'Postponed',
      'overdue':'Overdue',
      'payment_process':'Payment Process',
      'transfer':'Transfer',
      'delay_payment':'Delay Payment',
      'confirm':'Confirm',
      'incorrectFormat':'Incorrect Format',
      'courier':'Courier',
      'uploading':'Uploading',
      'uploadReceipt':'Upload Receipt',

    },
    'uz': {
      'totalPayments': 'Jami to‘lovlar',
      'nextPayment': 'Keyingi to‘lov',
      'myPayments': 'Mening to‘lovlarim',
      'products': 'Mahsulotlar',
      'income': 'Daromad',
      'expenses': 'Xarajatlar',
      'warehouse': 'Ombor',
      'dashboard': 'Boshqaruv paneli',
      'notification': 'Bildirishnomalar',

       // Profile
      'myProfile': 'Mening profilim',
      'addGuard': 'Kafil qo‘shish',
      'settings': 'Sozlamalar',
      'support': 'Yordam',
      'about': 'Ilova haqida',
      'contracts': 'Shartnomalar',
      'shareApp': 'Ilovani ulashish',
      'logout': 'Chiqish',
      'darkMode': 'Qorong‘i rejim',
      'downloadApp': 'Ilovani yuklab olish',
      "appSetup": "Ilovani sozlang",
      "language": "Til",
      "allNotifications": "Barcha bildirishnomalar",
      "deleteAccount": "Butunlay o‘chirish",
      "chooseLanguage": "Tilni tanlang",
      "languageSnackbar": "Til muvaffaqiyatli o‘zgartirildi",
      "contactUs": "Biz bilan bog‘lanish",
      "phone": "Telefon",
      "email": "Elektron pochta",
      "workHours": "Ish vaqti",
      "tgOpening": "Telegram ochilmoqda",
      "copy": "Nusxalash",
      "user": "Foydalanuvchi",
      "administrator": "Administrator",
      "manager": "Menejer",
      "deleteAccountMessage": "Hisobni o‘chirmoqchimisiz?",
      "cancel": "Bekor qilish",
      "delete": "O‘chirish",
      "deleteAccountSnackbar": "Hisob muvaffaqiyatli o‘chirildi",
      "logoutMessage": "Chiqishni tasdiqlaysizmi?",
      "shareWith": "Do‘stlar bilan ulashish",
      "shareLink": "Havolani nusxalash",
      "shareLinkSubtitle": "Barchaga ulashing",
      "appDescription": "Tezqu – biznesingizni boshqarish uchun eng yaxshi ilova",
      "shareText": "Ilovani yuklab oling",
      "manufacturer": "Ishlab chiqaruvchi",
      "produced": "Ishlab chiqarilgan",
      "license": "Litsenziya",
      "privacy": "Maxfiylik",
      "terms": "Foydalanish shartlari",
      "version": "Versiya",
      "supportSubtitle": "Hisobingiz bo‘yicha yordam oling",
      "supportEmail": "support@tezqu.com",

      "nextPayments": "Keyingi to‘lovlar",
      "noNextPayments": "Keyingi to‘lovlar yo‘q",
      "paymentsHistory": "To‘lovlar tarixi",
      'noPaymentsHistory':'To\'lovlar tarixi yo\'q',

      "paymentDetails": "To‘lov tafsilotlari",
      "contractId": "Shartnoma ID",
      "remainingAmount": "Qolgan summa",
      "contract": "Shartnoma",
      "mainTerms": "Asosiy shartlar",

      "productsDesc": "Mahsulot haqida tavsif",
      "year": "Yil",
      "color": "Rang",
      "origin": "Kelib chiqishi",
      "mileage": "Yurgan masofa",
      "fuelType": "Yoqilg‘i turi",
      "plateNumber": "Davlat raqami",
      "transmission": "Uzatma",
      "order": "Buyurtma",
      "toBuy": "Sotib olish",
      "sendRequest": "So‘rov yuborish",
      "contactMe": "Men bilan bog‘laning",
      "contact": "Aloqa",
      "callCenter": "Qo‘ng‘iroqlar markazi",
      "requestReceived": "So‘rov qabul qilindi",
      "requestDialogText": "Tez orada siz bilan bog‘lanamiz!",

      "incomeSources": "Daromad manbalari",
      "accept": "Qabul qilish",
      "total": "Jami",
      "collected": "Yig‘ilgan",
      "notReceived": "Qabul qilinmagan",
      "dateOfPayment": "To‘lov sanasi",
      "cash": "Naqd",
      "card": "Karta",

      "expense": "Xarajat",
      "expenseList": "Xarajatlar ro‘yxati",
      "paid": "To‘langan",
      "notPaid": "To‘lanmagan",
      "dateOfExpense": "Xarajat sanasi",
      "addExpense": "Xarajat qo‘shish",
      "title": "Sarlavha",
      "expenseType": "Xarajat turi",
      "desc": "Tavsif",
      "expenseDesc": "Xarajat tavsifi",
      "category": "Kategoriya",
      "sum": "Summa",
      "currency": "Valyuta",
      "paymentMethod": "To‘lov usuli",
      "paymentBy": "To‘lov orqali",
      "nameSurname": "Ism va familiya",
      "date": "Sana",
      "receipt": "Chek (ixtiyoriy)",
      "addReceipt": "Chek yuklash",
      "save": "Saqlash",

      "types": "Turlar",
      "aboutProduct": "Mahsulot haqida",
      "placeOrder": "Buyurtma berish",
      "addProduct": "Mahsulot qo‘shish",
      "name": "Nomi",
      "price": "Narx",
      "note": "Izoh",
      "photo": "Rasm",
      "addPhoto": "Rasm qo‘shish",

      "favourites": "Sevimlilar",

      // Additional keywords
      "collector": "Yig'uvchi",
      "customer": "Mijoz",
      "investor": "Investor",
      "error": "Xato",
      "retry": "Qayta urinish",
      "postponed": "Kechiktirilgan",
      "overdue": "Muddati o'tgan",
      "payment_process": "To'lov jarayoni",
      "transfer": "O'tkazma",
      "delay_payment": "To'lovni kechiktirish",
      "confirm": "Tasdiqlash",
      "incorrectFormat": "Noto'g'ri format",
      "courier": "Kuryer",
      "uploading": "Yuklanmoqda",
      "uploadReceipt": "Chek yuklash"

    },
    'ru': {
      'totalPayments': 'Всего платежей',
      'nextPayment': 'Следующий платеж',
      'myPayments': 'Мои платежи',
      'products': 'Товары',
      'income': 'Доход',
      'expenses': 'Расходы',
      'warehouse': 'Склад',
      'dashboard': 'Панель управления',
      'notification': 'Уведомления',

       // Profile
      'myProfile': 'Мой профиль',
      'addGuard': 'Добавить поручителя',
      'settings': 'Настройки',
      'support': 'Поддержка',
      'about': 'О приложении',
      'contracts': 'Договоры',
      'shareApp': 'Поделиться приложением',
      'logout': 'Выйти',
      'darkMode': 'Тёмный режим',
      'downloadApp': 'Скачать приложение',
      "appSetup": "Настройки",
      "language": "Язык",
      "allNotifications": "Все уведомления",
      "deleteAccount": "Удалить навсегда",
      "chooseLanguage": "Выберите язык",
      "languageSnackbar": "Язык успешно изменён",
      "contactUs": "Связаться с нами",
      "phone": "Телефон",
      "email": "Электронная почта",
      "workHours": "Часы работы",
      "tgOpening": "Открывается Telegram",
      "copy": "Копировать",
      "user": "Пользователь",
      "administrator": "Администратор",
      "manager": "Менеджер",
      "deleteAccountMessage": "Вы хотите удалить аккаунт?",
      "cancel": "Отмена",
      "delete": "Удалить",
      "deleteAccountSnackbar": "Аккаунт успешно удалён",
      "logoutMessage": "Вы уверены, что хотите выйти?",
      "shareWith": "Поделиться с друзьями",
      "shareLink": "Скопировать ссылку",
      "shareLinkSubtitle": "Поделиться со всеми",
      "appDescription": "Tezqu — лучшее приложение для управления бизнесом",
      "shareText": "Скачать приложение",
      "manufacturer": "Производитель",
      "produced": "Произведено",
      "license": "Лицензия",
      "privacy": "Конфиденциальность",
      "terms": "Условия использования",
      "version": "Версия",
      "supportSubtitle": "Получите помощь по вашему аккаунту",
      "supportEmail": "support@tezqu.com",

      "nextPayments": "Предстоящие платежи",
      "noNextPayments": "Нет предстоящих платежей",
      "paymentsHistory": "История платежей",
      'noPaymentsHistory':'Нет История платежей',

      "paymentDetails": "Детали платежа",
      "contractId": "ID договора",
      "remainingAmount": "Оставшаяся сумма",
      "contract": "Договор",
      "mainTerms": "Основные условия",

      "productsDesc": "Описание продукта",
      "year": "Год",
      "color": "Цвет",
      "origin": "Происхождение",
      "mileage": "Пробег",
      "fuelType": "Тип топлива",
      "plateNumber": "Госномер",
      "transmission": "Трансмиссия",
      "order": "Заказ",
      "toBuy": "Купить",
      "sendRequest": "Отправить запрос",
      "contactMe": "Связаться со мной",
      "contact": "Контакты",
      "callCenter": "Колл-центр",
      "requestReceived": "Запрос получен",
      "requestDialogText": "Мы свяжемся с вами в ближайшее время!",

      "incomeSources": "Источники дохода",
      "accept": "Принять",
      "total": "Итого",
      "collected": "Собрано",
      "notReceived": "Не получено",
      "dateOfPayment": "Дата платежа",
      "cash": "Наличные",
      "card": "Карта",

      "expense": "Расход",
      "expenseList": "Список расходов",
      "paid": "Оплачено",
      "notPaid": "Не оплачено",
      "dateOfExpense": "Дата расхода",
      "addExpense": "Добавить расход",
      "title": "Заголовок",
      "expenseType": "Тип расхода",
      "desc": "Описание",
      "expenseDesc": "Описание расхода",
      "category": "Категория",
      "sum": "Сумма",
      "currency": "Валюта",
      "paymentMethod": "Способ оплаты",
      "paymentBy": "Оплата через",
      "nameSurname": "Имя и фамилия",
      "date": "Дата",
      "receipt": "Чек (необязательно)",
      "addReceipt": "Загрузить чек",
      "save": "Сохранить",

      "types": "Типы",
      "aboutProduct": "О продукте",
      "placeOrder": "Оформить заказ",
      "addProduct": "Добавить продукт",
      "name": "Название",
      "price": "Цена",
      "note": "Заметка",
      "photo": "Фото",
      "addPhoto": "Добавить фото",

      "favourites": "Избранное",

      // Additional keywords
      "collector": "Сборщик",
      "customer": "Клиент",
      "investor": "Инвестор",
      "error": "Ошибка",
      "retry": "Повторить",
      "postponed": "Отложено",
      "overdue": "Просрочено",
      "payment_process": "Процесс оплаты",
      "transfer": "Перевод",
      "delay_payment": "Отложить платеж",
      "confirm": "Подтвердить",
      "incorrectFormat": "Неверный формат",
      "courier": "Курьер",
      "uploading": "Загрузка",
      "uploadReceipt": "Загрузить чек"

    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  // Convenience getters
  String get totalPayments => translate('totalPayments');
  String get nextPayment => translate('nextPayment');
  String get myPayments => translate('myPayments');
  String get products => translate('products');
  String get income => translate('income');
  String get expenses => translate('expenses');
  String get warehouse => translate('warehouse');
  String get dashboard => translate('dashboard');
  String get notification => translate('notification');

// Profile
  String get myProfile => translate('myProfile');
  String get addGuard => translate('addGuard');
  String get settings => translate('settings');
  String get support => translate('support');
  String get about => translate('about');
  String get contracts => translate('contracts');
  String get shareApp => translate('shareApp');
  String get logout => translate('logout');
  String get darkMode => translate('darkMode');
  String get downloadApp => translate('downloadApp');
  String get appSetup => translate('appSetup');
  String get language => translate('language');
  String get allNotifications => translate('allNotifications');
  String get deleteAccount => translate('deleteAccount');
  String get chooseLanguage => translate('chooseLanguage');
  String get languageSnackbar => translate('languageSnackbar');
  String get contactUs => translate('contactUs');
  String get phone => translate('phone');
  String get email => translate('email');
  String get workHours => translate('workHours');
  String get tgOpening => translate('tgOpening');
  String get copy => translate('copy');
  String get user => translate('user');
  String get administrator => translate('administrator');
  String get manager => translate('manager');
  String get deleteAccountMessage => translate('deleteAccountMessage');
  String get cancel => translate('cancel');
  String get delete => translate('delete');
  String get deleteAccountSnackbar => translate('deleteAccountSnackbar');
  String get logoutMessage => translate('logoutMessage');
  String get shareWith => translate('shareWith');
  String get shareLink => translate('shareLink');
  String get shareLinkSubtitle => translate('shareLinkSubtitle');
  String get appDescription => translate('appDescription');
  String get shareText => translate('shareText');
  String get manufacturer => translate('manufacturer');
  String get produced => translate('produced');
  String get license => translate('license');
  String get privacy => translate('privacy');
  String get terms => translate('terms');
  String get version => translate('version');
  String get supportSubtitle => translate('supportSubtitle');
  String get supportEmail => translate('supportEmail');
  String get nextPayments => translate('nextPayments');
  String get noNextPayments => translate('noNextPayments');
  String get paymentsHistory => translate('paymentsHistory');
  String get noPaymentsHistory => translate('noPaymentsHistory');

  String get paymentDetails => translate('paymentDetails');
  String get contractId => translate('contractId');
  String get remainingAmount => translate('remainingAmount');
  String get contract => translate('contract');
  String get mainTerms => translate('mainTerms');

  String get productsDesc => translate('productsDesc');
  String get year => translate('year');
  String get color => translate('color');
  String get origin => translate('origin');
  String get mileage => translate('mileage');
  String get fuelType => translate('fuelType');
  String get plateNumber => translate('plateNumber');
  String get transmission => translate('transmission');
  String get order => translate('order');
  String get toBuy => translate('toBuy');
  String get sendRequest => translate('sendRequest');
  String get contactMe => translate('contactMe');
  String get contact => translate('contact');
  String get callCenter => translate('callCenter');
  String get requestReceived => translate('requestReceived');
  String get requestDialogText => translate('requestDialogText');

  String get incomeSources => translate('incomeSources');
  String get accept => translate('accept');
  String get total => translate('total');
  String get collected => translate('collected');
  String get notReceived => translate('notReceived');
  String get dateOfPayment => translate('dateOfPayment');
  String get cash => translate('cash');
  String get card => translate('card');

  String get expense => translate('expense');
  String get expenseList => translate('expenseList');
  String get paid => translate('paid');
  String get notPaid => translate('notPaid');
  String get dateOfExpense => translate('dateOfExpense');
  String get addExpense => translate('addExpense');
  String get title => translate('title');
  String get expenseType => translate('expenseType');
  String get desc => translate('desc');
  String get expenseDesc => translate('expenseDesc');
  String get category => translate('category');
  String get sum => translate('sum');
  String get currency => translate('currency');
  String get paymentMethod => translate('paymentMethod');
  String get paymentBy => translate('paymentBy');
  String get nameSurname => translate('nameSurname');
  String get date => translate('date');
  String get receipt => translate('receipt');
  String get addReceipt => translate('addReceipt');
  String get save => translate('save');

  String get types => translate('types');
  String get aboutProduct => translate('aboutProduct');
  String get placeOrder => translate('placeOrder');
  String get addProduct => translate('addProduct');
  String get name => translate('name');
  String get price => translate('price');
  String get note => translate('note');
  String get photo => translate('photo');
  String get addPhoto => translate('addPhoto');

  String get favourites => translate('favourites');

  // Additional getters
  String get collector => translate('collector');
  String get customer => translate('customer');
  String get investor => translate('investor');
  String get error => translate('error');
  String get retry => translate('retry');
  String get postponed => translate('postponed');
  String get overdue => translate('overdue');
  String get payment_process => translate('payment_process');
  String get transfer => translate('transfer');
  String get delay_payment => translate('delay_payment');
  String get confirm => translate('confirm');
  String get incorrectFormat => translate('incorrectFormat');
  String get courier => translate('courier');
  String get uploading => translate('uploading');
  String get uploadReceipt => translate('uploadReceipt');

}