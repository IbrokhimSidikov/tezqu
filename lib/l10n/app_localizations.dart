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
      'addGuard': 'Add Kafil',
      'settings': 'Settings',
      'support': 'Support',
      'about': 'About App',
      'contracts': 'Contracts',
      'shareApp': 'Share the App',
      'logout': 'Logout',
      'darkMode': 'Dark Mode',
      'downloadApp': 'Download app',
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



}