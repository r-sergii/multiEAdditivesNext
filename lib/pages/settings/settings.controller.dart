import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings.models.dart';

class SettingsController extends GetxController {
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  final RxInt _selectedValueTheme = 0.obs;
  int get selectedValueTheme {
    return _selectedValueTheme.value;
  }

  set selectedValueTheme(int val) {
    _selectedValueTheme(val);
  }

  final RxInt _selectedValueLang = 0.obs;
  int get selectedValueLang {
    return _selectedValueLang.value;
  }

  set selectedValueLang(int val) {
    _selectedValueLang(val);
  }

  final List<ItemColorTheme> listItemColorTheme = [
    ItemColorTheme(0, "Light", Colors.white),
    ItemColorTheme(1, "Dark", Colors.black),
    // ItemColorTheme(2, "Blue", Colors.blue),
  ];

  final List<ItemLanguage> listItemLanguage = [
    ItemLanguage(0, "English language", "EN"),
    // ItemLanguage(1, "Afrikaanse taal", "AF"),
    // ItemLanguage(2, "Azərbaycan dili", "AZ"),
    // ItemLanguage(3, "Bosanski jezik", "BS"),
    // ItemLanguage(4, "Čeština Jazyk", "CS"),
    // ItemLanguage(5, "Cymraeg iaith", "CU"), //Валийский
    // ItemLanguage(6, "Dansk sprog", "DA"), //Датский
    ItemLanguage(1, "Deutsch sprache", "DE"),//7
    ItemLanguage(2, "Español idioma", "ES"),//8
    ItemLanguage(3, "Eesti keel", "ET"), //Эстонский
    ItemLanguage(4, "Français langue", "FR"),//10
    // ItemLanguage(11, "Gaeilge teanga", "GA"), //Ирландский
    // ItemLanguage(12, "Albannach (Ghàidhlig) cànain", "GD"), //Шотландский
    // ItemLanguage(13, "Suomen kieli", "FI"),
    // ItemLanguage(14, "Hrvatski Jezik", "HR"),
    // ItemLanguage(15, "Magyar nyelv", "HU"),
    ItemLanguage(5, "Italiano Lingua", "IT"),//16
    // ItemLanguage(17, "Lëtzebuergesch sprooch", "LB"), //Люксембург
    ItemLanguage(6, "Lietuvių kalba", "LT"),
    ItemLanguage(7, "Latviski valodu", "LV"),
    // ItemLanguage(20, "Nederlands taal", "NL"),
    // ItemLanguage(21, "Norsk språk", "NO"),
    ItemLanguage(8, "Polski Język", "PL"),
    ItemLanguage(9, "Português Língua", "PT"),//23
    // ItemLanguage(24, "Română limba", "RO"),
    // ItemLanguage(25, "Slovenský Jazyk", "SK"), //Словацкий
    // ItemLanguage(26, "Slovenščina Jezik", "SL"), //Словенский
    // ItemLanguage(27, "Shqiptare gjuh", "SQ"), //Албанский
    // ItemLanguage(28, "Svenska språket", "SV"),
    // ItemLanguage(29, "Türk Dili", "TR"),

    // ItemLanguage(30, "Български език", "BG"),
    // ItemLanguage(31, "Македонски јазик", "MK"),
    ItemLanguage(10, "Українська мова", "UK"),//32

    // ItemLanguage(33, "ελληνική γλώσσα", "EL"), //Греческий

    // ItemLanguage(34, "اللغة العربية", "AR"), //Арабский
    // ItemLanguage(35, "زبان فارسی", "FA"), //Персидский
    // ItemLanguage(36, "שפה עברית", "HE"), //Иврит
    // ItemLanguage(37, "हिन्दी भाषा", "HI"), //Хинди
    // ItemLanguage(38, "日本 言語", "JA"), //Японский
    // ItemLanguage(39, "ქართული ენა", "KA"), //Грузинский
    // ItemLanguage(40, "한국인 언어", "KO"), //Корейский
    // ItemLanguage(41, "ไทย ภาษา", "TH"), //Тайский

    // ItemLanguage(42, "Tiếng Việt ngôn ngữ ", "VI"), //Вьетнамский
    // ItemLanguage(43, "中国人 语", "ZH"), //Китайский
    ItemLanguage(11, "Русский язык", "RU"),//50
  ];
}
