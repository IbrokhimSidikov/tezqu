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
      
      // Contracts
      'myContracts': 'My Contracts',
      'noContractsFound': 'No contracts found',
      'contractType': 'Contract type',
      'serviceFee': 'Service fee',
      'collector': 'Collector',
      'contractPdf': 'Contract PDF',
      'twoWay': 'Two-way',
      'threeWay': 'Three-way',
      'contractNotFound': 'Contract not found',
      'mainContractTerms': 'Main contract terms',
      'initialPayment': 'Initial payment',
      'customer': 'Customer',
      'approvedBy': 'Approved by',
      'agreement': 'Agreement',
      'monthly': 'Monthly',
      'period': 'Period',
      'months': 'months',
      'view': 'View',
      'notAvailable': 'Not available',
      'reject': 'Reject',
      'approve': 'Approve',
      'rejectContract': 'Reject contract',
      'rejectContractConfirm': 'Do you want to reject the contract?',
      'approveContract': 'Approve contract',
      'approveContractConfirm': 'Do you want to approve the contract?',
      'contractRejected': 'Contract rejected',
      'contractApproved': 'Contract approved',
      
      // Warehouse
      'categories': 'Categories',
      'search': 'Search',
      'searching': 'Searching...',
      'resultsFound': 'results found',
      'cancelSearch': 'Cancel',

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
      'paymentSummary':'Payment Summary',
      'paidAmount':'Paid',
      'remainingPayments':'Remaining',
      'items':'items',

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
      
      // Profile page additional
      'logoutConfirm':'Are you sure you want to logout?',
      'exit':'Exit',
      'shareWithFriends':'Share with friends',
      'generalShare':'General share',
      'shareAllApps':'Share via all apps',
      'openPlayStore':'Open in Play Store',
      'playStoreOpening':'Opening Play Store...',
      'linkCopied':'Link copied!',
      'errorOccurred':'An error occurred',
      'appDescriptionLong':'TezQu - The best app for managing your business. Easily manage products, expenses and contracts.',
      'developer':'Developer',
      'releaseDate':'Release date',
      'rateApp':'Rate the app',
      'allRightsReserved':'All rights reserved',
      'privacyOpening':'Opening privacy policy...',
      'termsOpening':'Opening terms of service...',
      'thankYouRating':'Thank you for rating!',
      'mondayFriday':'Monday-Friday',
      'phoneOpening':'Opening phone...',
      'emailOpening':'Opening email...',
      'userDataNotFound':'User data not found',
      'productName':'Product Name',
      'productYear':'Product Year',
      'productPrice':'Product Price',
      'productStatus':'Product Status',
      'productDetails':'Product Details',
      'productImages':'Product Images',

      // Login & Auth
      'welcome':'Welcome',
      'phoneNumber':'Phone number',
      'enterPhoneNumber':'Enter phone number',
      'phoneNumberRequired':'Phone number must be at least 9 digits',
      'enterSmsCode':'Enter SMS code',
      'enterCode':'Enter code',
      'resendCode':'Resend code',
      'register':'Register',
      'getCode':'Get code',
      'login':'Login',
      'firstName':'First name',
      'lastName':'Last name',
      'enterFirstName':'Enter your first name',
      'enterLastName':'Enter your last name',
      'dateOfBirth':'Date of birth',
      'gender':'Gender',
      'male':'Male',
      'female':'Female',
      'next':'Next',
      'loading':'Loading...',
      'goToLogin':'Go to login page',
      'enterFullDate':'Enter full date',
      'enterDateCorrectFormat':'Enter date in correct format (DD.MM.YYYY)',
      'success':'Success',
      'searching':'Searching...',
      'cancelSearch':'Cancel',
      'errorOccurred':'An error occurred',
      'retry':'Retry',
      'nothingFound':'Nothing found',
      'favouritesEmpty':'Favourites list is empty',
      'searchOtherWord':'Try searching with another word',
      'addToFavourites':'Add products to favourites',
      'resultsFound':'results found',
      'sold':'Sold',
      'available':'Available',
      'productAbout':'About product',
      'cashPrice':'Cash',
      'installment':'Installment',
      'installmentPeriod':'12-24 months\nby agreement',
      'placeOrder':'Place order',
      'toPurchase':'To purchase',
      'sendRequest':'Send request',
      'contactMe':'Contact me',
      'callMyself':'I will call',
      'callCenter':'Call center',
      'requestReceived':'Request received',
      'requestReceivedMessage':'Our staff will contact you soon',
      'cannotOpenPhone':'Cannot open phone app',

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
      
      // Contracts
      'myContracts': 'Shartnomalarim',
      'noContractsFound': 'Shartnomalar topilmadi',
      'contractType': 'Shartnoma turi',
      'serviceFee': 'Xizmat to‘lovi',
      'collector': 'Yig‘uvchi',
      'contractPdf': 'Shartnoma PDF',
      'twoWay': 'Ikki tomonlama',
      'threeWay': 'Uch tomonlama',
      'contractNotFound': 'Shartnoma topilmadi',
      'mainContractTerms': 'Shartnoma asosiy shartlari',
      'initialPayment': 'Boshlang‘ich to‘lov',
      'customer': 'Mijoz',
      'approvedBy': 'Tasdiqlangan',
      'agreement': 'Kelishuv',
      'monthly': 'Oyiga',
      'period': 'Muddat',
      'months': 'oy',
      'view': 'Ko‘rish',
      'notAvailable': 'Mavjud emas',
      'reject': 'Rad etish',
      'approve': 'Tasdiqlash',
      'rejectContract': 'Rad etish',
      'rejectContractConfirm': 'Shartnomani rad etishni xohlaysizmi?',
      'approveContract': 'Tasdiqlash',
      'approveContractConfirm': 'Shartnomani tasdiqlashni xohlaysizmi?',
      'contractRejected': 'Shartnoma rad etildi',
      'contractApproved': 'Shartnoma tasdiqlandi',
      
      // Warehouse
      'categories': 'Toifalar',
      'search': 'Qidirish',
      'searching': 'Qidirish...',
      'resultsFound': 'ta natija topildi',
      'cancelSearch': 'Bekor qilish',

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
      "paymentSummary": "To'lov xulosasi",
      "paidAmount": "To'langan",
      "remainingPayments": "Qolgan",
      "items": "ta",

      "paymentDetails": "To'lov tafsilotlari",
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
      "uploadReceipt": "Chek yuklash",
      
      // Profile page additional
      "logoutConfirm": "Haqiqatan ham ilovadan chiqmoqchimisiz?",
      "exit": "Chiqish",
      "shareWithFriends": "Do'stlaringiz bilan ulashing",
      "generalShare": "Umumiy ulashish",
      "shareAllApps": "Barcha ilovalar orqali ulashing",
      "openPlayStore": "Google Play'da ochish",
      "playStoreOpening": "Play Store ochilmoqda...",
      "linkCopied": "Havola nusxalandi!",
      "errorOccurred": "Xatolik yuz berdi",
      "appDescriptionLong": "TezQu - Biznesingizni boshqarish uchun eng yaxshi ilova. Mahsulotlar, xarajatlar va shartnomalarni oson boshqaring.",
      "developer": "Ishlab chiqaruvchi",
      "releaseDate": "Chiqarilgan sana",
      "rateApp": "Ilovani baholash",
      "allRightsReserved": "Barcha huquqlar himoyalangan",
      "privacyOpening": "Maxfiylik siyosati ochilmoqda...",
      "termsOpening": "Foydalanish shartlari ochilmoqda...",
      "thankYouRating": "Baholash uchun rahmat!",
      "mondayFriday": "Dushanba-Juma",
      "phoneOpening": "Telefon ochilmoqda...",
      "emailOpening": "Email ochilmoqda...",
      "userDataNotFound": "Foydalanuvchi ma'lumotlari topilmadi",

      // Login & Auth
      "welcome": "Xush kelibsiz",
      "phoneNumber": "Telefon nomer",
      "enterPhoneNumber": "Telefon raqamni kiriting",
      "phoneNumberRequired": "Telefon raqam kamida 9 ta raqamdan iborat bo'lishi kerak",
      "enterSmsCode": "Sms kodni kiriting",
      "enterCode": "Kodni kiriting",
      "resendCode": "Kodni qayta olish",
      "register": "Ro'yxatdan o'tish",
      "getCode": "Kodni olish",
      "login": "Dasturga kirish",
      "firstName": "Ism",
      "lastName": "Familiya",
      "enterFirstName": "Ismingizni kiriting",
      "enterLastName": "Familiyangizni kiriting",
      "dateOfBirth": "Tug'ulgan sana",
      "gender": "Jinsi",
      "male": "Erkak",
      "female": "Ayol",
      "next": "Keyingisiga o'tish",
      "loading": "Yuklanmoqda...",
      "goToLogin": "Login page ga o'tish",
      "enterFullDate": "To'liq sanani kiriting",
      "enterDateCorrectFormat": "Tug'ulgan sanani to'g'ri formatda kiriting (DD.MM.YYYY)",
      "success": "Muvaffaqiyatli",
      "searching": "Qidirish...",
      "cancelSearch": "Bekor qilish",
      "errorOccurred": "Xatolik yuz berdi",
      "retry": "Qayta urinish",
      "nothingFound": "Hech narsa topilmadi",
      "favouritesEmpty": "Sevimlilar ro'yxati bo'sh",
      "searchOtherWord": "Boshqa so'z bilan qidiring",
      "addToFavourites": "Mahsulotlarni sevimlilar ro'yxatiga qo'shing",
      "resultsFound": "ta natija topildi",
      "sold": "Sotildi",
      "available": "Mavjud",
      "productAbout": "Mahsulot haqida qisqacha",
      "cashPrice": "Naqdga",
      "installment": "Bo'lib to'lash",
      "installmentPeriod": "12-24 oy gacha\nkelishuv asosida",
      "placeOrder": "Buyurtma berish",
      "toPurchase": "Harid qilish uchun",
      "sendRequest": "Ariza yuborish",
      "contactMe": "Men bilan bog'laning",
      "callMyself": "O'zim bog'lanaman",
      "callCenter": "Aloqa markazi",
      "requestReceived": "Ariza qabul qilindi",
      "requestReceivedMessage": "Yaqin vaqt ichida bizning xodimlarimiz\nsiz bo'lan bog'lanishadi",
      "cannotOpenPhone": "Telefon ilovasini ochib bo'lmadi",
      "productName": "Mahsulot nomi",
      "productYear": "Mahsulot yili",
      "productPrice": "Mahsulot narxi",
      "productStatus": "Mahsulot holati",
      "productDetails": "Mahsulot tafsilotlari",
      "productImages": "Mahsulot rasmlari"

    },
    'ru': {
      'totalPayments': 'Всего платежей',
      'nextPayment': 'Следующий платеж',
      'myPayments': 'Мои платежи',
      'products': 'Товары',
      'income': 'Доход',
      'expenses': 'Расходы',
      "warehouse": "Склад",
      'dashboard': 'Панель управления',
      'notification': 'Уведомления',
      
      // Contracts
      "myContracts": "Мои договоры",
      "noContractsFound": "Договоры не найдены",
      "contractType": "Тип договора",
      "serviceFee": "Плата за услугу",
      "collector": "Сборщик",
      "contractPdf": "PDF договора",
      "twoWay": "Двусторонний",
      "threeWay": "Трёхсторонний",
      "contractNotFound": "Договор не найден",
      "mainContractTerms": "Основные условия договора",
      "initialPayment": "Первоначальный взнос",
      "customer": "Клиент",
      "approvedBy": "Утверждено",
      "agreement": "Соглашение",
      "monthly": "Ежемесячно",
      "period": "Срок",
      "months": "мес",
      "view": "Просмотр",
      "notAvailable": "Недоступно",
      "reject": "Отклонить",
      "approve": "Утвердить",
      "rejectContract": "Отклонить",
      "rejectContractConfirm": "Вы хотите отклонить договор?",
      "approveContract": "Утвердить",
      "approveContractConfirm": "Вы хотите утвердить договор?",
      "contractRejected": "Договор отклонён",
      "contractApproved": "Договор утверждён",
      
      // Warehouse
      "categories": "Категории",
      "search": "Поиск",
      "searching": "Поиск...",
      "resultsFound": "результатов найдено",
      "cancelSearch": "Отмена",

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
      "paymentSummary": "Сводка платежей",
      "paidAmount": "Оплачено",
      "remainingPayments": "Осталось",
      "items": "шт",

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
      "uploadReceipt": "Загрузить чек",
      
      // Profile page additional
      "logoutConfirm": "Вы действительно хотите выйти из приложения?",
      "exit": "Выйти",
      "shareWithFriends": "Поделиться с друзьями",
      "generalShare": "Общий доступ",
      "shareAllApps": "Поделиться через все приложения",
      "openPlayStore": "Открыть в Google Play",
      "playStoreOpening": "Открывается Play Store...",
      "linkCopied": "Ссылка скопирована!",
      "errorOccurred": "Произошла ошибка",
      "appDescriptionLong": "TezQu - Лучшее приложение для управления бизнесом. Легко управляйте продуктами, расходами и договорами.",
      "developer": "Разработчик",
      "releaseDate": "Дата выпуска",
      "rateApp": "Оценить приложение",
      "allRightsReserved": "Все права защищены",
      "privacyOpening": "Открывается политика конфиденциальности...",
      "termsOpening": "Открываются условия использования...",
      "thankYouRating": "Спасибо за оценку!",
      "mondayFriday": "Понедельник-Пятница",
      "phoneOpening": "Открывается телефон...",
      "emailOpening": "Открывается email...",
      "userDataNotFound": "Данные пользователя не найдены",

      // Login & Auth
      "welcome": "Добро пожаловать",
      "phoneNumber": "Номер телефона",
      "enterPhoneNumber": "Введите номер телефона",
      "phoneNumberRequired": "Номер телефона должен содержать не менее 9 цифр",
      "enterSmsCode": "Введите SMS код",
      "enterCode": "Введите код",
      "resendCode": "Отправить код повторно",
      "register": "Регистрация",
      "getCode": "Получить код",
      "login": "Войти",
      "firstName": "Имя",
      "lastName": "Фамилия",
      "enterFirstName": "Введите ваше имя",
      "enterLastName": "Введите вашу фамилию",
      "dateOfBirth": "Дата рождения",
      "gender": "Пол",
      "male": "Мужской",
      "female": "Женский",
      "next": "Далее",
      "loading": "Загрузка...",
      "goToLogin": "Перейти на страницу входа",
      "enterFullDate": "Введите полную дату",
      "enterDateCorrectFormat": "Введите дату в правильном формате (DD.MM.YYYY)",
      "success": "Успешно",
      "searching": "Поиск...",
      "cancelSearch": "Отмена",
      "errorOccurred": "Произошла ошибка",
      "retry": "Повторить",
      "nothingFound": "Ничего не найдено",
      "favouritesEmpty": "Список избранного пуст",
      "searchOtherWord": "Попробуйте другое слово",
      "addToFavourites": "Добавьте товары в избранное",
      "resultsFound": "результатов найдено",
      "sold": "Продано",
      "available": "Доступно",
      "productAbout": "О товаре",
      "cashPrice": "Наличными",
      "installment": "В рассрочку",
      "installmentPeriod": "12-24 месяца\nпо договоренности",
      "placeOrder": "Оформить заказ",
      "toPurchase": "Для покупки",
      "sendRequest": "Отправить заявку",
      "contactMe": "Свяжитесь со мной",
      "callMyself": "Я позвоню сам",
      "callCenter": "Колл-центр",
      "requestReceived": "Заявка принята",
      "requestReceivedMessage": "Наши сотрудники свяжутся с вами\nв ближайшее время",
      "cannotOpenPhone": "Не удалось открыть телефон",
      "productName": "Название продукта",
      "productYear": "Год продукта",
      "productPrice": "Цена продукта",
      "productStatus": "Статус продукта",
      "productDetails": "Детали продукта",
      "productImages": "Изображения продукта",

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
  String get paymentSummary => translate('paymentSummary');
  String get paidAmount => translate('paidAmount');
  String get remainingPayments => translate('remainingPayments');
  String get items => translate('items');

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

  // Contracts getters
  String get myContracts => translate('myContracts');
  String get noContractsFound => translate('noContractsFound');
  String get contractType => translate('contractType');
  String get serviceFee => translate('serviceFee');
  String get contractPdf => translate('contractPdf');
  String get twoWay => translate('twoWay');
  String get threeWay => translate('threeWay');
  String get contractNotFound => translate('contractNotFound');
  String get mainContractTerms => translate('mainContractTerms');
  String get initialPayment => translate('initialPayment');
  String get approvedBy => translate('approvedBy');
  String get agreement => translate('agreement');
  String get monthly => translate('monthly');
  String get period => translate('period');
  String get months => translate('months');
  String get view => translate('view');
  String get notAvailable => translate('notAvailable');
  String get reject => translate('reject');
  String get approve => translate('approve');
  String get rejectContract => translate('rejectContract');
  String get rejectContractConfirm => translate('rejectContractConfirm');
  String get approveContract => translate('approveContract');
  String get approveContractConfirm => translate('approveContractConfirm');
  String get contractRejected => translate('contractRejected');
  String get contractApproved => translate('contractApproved');

  // Warehouse getters
  String get categories => translate('categories');
  String get search => translate('search');
  String get searching => translate('searching');
  String get resultsFound => translate('resultsFound');
  String get cancelSearch => translate('cancelSearch');

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

  // Profile page getters
  String get logoutConfirm => translate('logoutConfirm');
  String get exit => translate('exit');
  String get shareWithFriends => translate('shareWithFriends');
  String get generalShare => translate('generalShare');
  String get shareAllApps => translate('shareAllApps');
  String get openPlayStore => translate('openPlayStore');
  String get playStoreOpening => translate('playStoreOpening');
  String get linkCopied => translate('linkCopied');
  String get errorOccurred => translate('errorOccurred');
  String get appDescriptionLong => translate('appDescriptionLong');
  String get developer => translate('developer');
  String get releaseDate => translate('releaseDate');
  String get rateApp => translate('rateApp');
  String get allRightsReserved => translate('allRightsReserved');
  String get privacyOpening => translate('privacyOpening');
  String get termsOpening => translate('termsOpening');
  String get thankYouRating => translate('thankYouRating');
  String get mondayFriday => translate('mondayFriday');
  String get phoneOpening => translate('phoneOpening');
  String get emailOpening => translate('emailOpening');
  String get userDataNotFound => translate('userDataNotFound');

  // Login & Auth getters
  String get welcome => translate('welcome');
  String get phoneNumber => translate('phoneNumber');
  String get enterPhoneNumber => translate('enterPhoneNumber');
  String get phoneNumberRequired => translate('phoneNumberRequired');
  String get enterSmsCode => translate('enterSmsCode');
  String get enterCode => translate('enterCode');
  String get resendCode => translate('resendCode');
  String get register => translate('register');
  String get getCode => translate('getCode');
  String get login => translate('login');
  String get firstName => translate('firstName');
  String get lastName => translate('lastName');
  String get enterFirstName => translate('enterFirstName');
  String get enterLastName => translate('enterLastName');
  String get dateOfBirth => translate('dateOfBirth');
  String get gender => translate('gender');
  String get male => translate('male');
  String get female => translate('female');
  String get next => translate('next');
  String get loading => translate('loading');
  String get goToLogin => translate('goToLogin');
  String get enterFullDate => translate('enterFullDate');
  String get enterDateCorrectFormat => translate('enterDateCorrectFormat');
  String get success => translate('success');
  String get nothingFound => translate('nothingFound');
  String get favouritesEmpty => translate('favouritesEmpty');
  String get searchOtherWord => translate('searchOtherWord');
  String get addToFavourites => translate('addToFavourites');
  String get sold => translate('sold');
  String get available => translate('available');
  String get productAbout => translate('productAbout');
  String get cashPrice => translate('cashPrice');
  String get installment => translate('installment');
  String get installmentPeriod => translate('installmentPeriod');
  String get toPurchase => translate('toPurchase');
  String get callMyself => translate('callMyself');
  String get requestReceivedMessage => translate('requestReceivedMessage');
  String get cannotOpenPhone => translate('cannotOpenPhone');
  String get productName => translate('productName');
  String get productYear => translate('productYear');
  String get productPrice => translate('productPrice');
  String get productStatus => translate('productStatus');
  String get productDetails => translate('productDetails');
  String get productImages => translate('productImages');

}