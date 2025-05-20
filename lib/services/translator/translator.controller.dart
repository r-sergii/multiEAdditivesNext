import 'package:get/get.dart';
import './translator.model.dart';
import '../../app.dart';

class TranslatorController extends GetxController {
  RxString sFind = "FIND".obs;
  String get find {
    return sFind.value;
  }

  set find(String val) {
    sFind(val);
  }

  RxString sDanger = "DANGER".obs;
  String get danger {
    return sDanger.value;
  }

  set danger(String val) {
    sDanger(val);
  }

  RxString sGroup = "GROUP".obs;
  String get group {
    return sGroup.value;
  }

  set group(String val) {
    sGroup(val);
  }

  RxString sOrigin = "ORIGIN".obs;
  String get origin {
    return sOrigin.value;
  }

  set origin(String val) {
    sOrigin(val);
  }

  RxString sClassification = "CLASSIFICATION".obs;
  String get classification {
    return sClassification.value;
  }

  set classification(String val) {
    sClassification(val);
  }

  RxString sSettings = "SETTINGS".obs;
  String get settings {
    return sSettings.value;
  }

  set settings(String val) {
    sSettings(val);
  }

  RxString sAbout = "ABOUT".obs;
  String get about {
    return sAbout.value;
  }

  set about(String val) {
    sAbout(val);
  }

  RxString sColorTheme = "COLOR THEMES".obs;
  String get colorthemes {
    return sColorTheme.value;
  }

  set colorthemes(String val) {
    sColorTheme(val);
  }

  RxString sLanguage = "CHOOSE A LANGUAGE".obs;
  String get language {
    return sLanguage.value;
  }

  set language(String val) {
    sLanguage(val);
  }

  RxString sConfirm = "CONFIRM".obs;
  String get confirm {
    return sConfirm.value;
  }

  set confirm(String val) {
    sConfirm(val);
  }

  RxString sCancel = "CANCEL".obs;
  String get cancel {
    return sCancel.value;
  }

  set cancel(String val) {
    sCancel(val);
  }

  RxString sScreenshot = "SCREENSHOT".obs;
  String get screenshot {
    return sScreenshot.value;
  }

  set screenshot(String val) {
    sScreenshot(val);
  }

  RxString sDownload = "DOWNLOAD".obs;
  String get download {
    return sDownload.value;
  }

  set download(String val) {
    sDownload(val);
  }

  RxString sUse = "USE".obs;
  String get use {
    return sUse.value;
  }

  set use(String val) {
    sUse(val);
  }

  RxString sQuestion = "QUESTION".obs;
  String get question {
    return sQuestion.value;
  }

  set question(String val) {
    sQuestion(val);
  }

  RxString sIssue = "ISSUE".obs;
  String get issue {
    return sIssue.value;
  }

  set issue(String val) {
    sIssue(val);
  }

  RxString sAdvice = "ADVICE".obs;
  String get advice {
    return sAdvice.value;
  }

  set advice(String val) {
    sAdvice(val);
  }

  RxString sMessage = "MESSAGE".obs;
  String get message {
    return sMessage.value;
  }

  set message(String val) {
    sMessage(val);
  }

  RxString sSignIn = "SIGN IN".obs;
  String get signin {
    return sSignIn.value;
  }

  set signin(String val) {
    sSignIn(val);
  }

  RxString sSignOut = "SIGN OUT".obs;
  String get signout {
    return sSignOut.value;
  }

  set signout(String val) {
    sSignOut(val);
  }

  RxString sSignUp = "SIGN UP".obs;
  String get signup {
    return sSignUp.value;
  }

  set signup(String val) {
    sSignUp(val);
  }

  RxString sWith = "WITH".obs;
  String get with_ {
    return sWith.value;
  }

  set with_(String val) {
    sWith(val);
  }

  RxString sVegans = "VEGANS".obs;
  String get vegans {
    return sVegans.value;
  }

  set vegans(String val) {
    sVegans(val);
  }

  RxString sAdditives = "ADDITIVES".obs;
  String get additives {
    return sAdditives.value;
  }

  set additives(String val) {
    sAdditives(val);
  }

  RxString sEmail = "EMAIL".obs;
  String get email {
    return sEmail.value;
  }

  set email(String val) {
    sEmail(val);
  }

  RxString sPassword = "PASSWORD".obs;
  String get password {
    return sPassword.value;
  }

  set password(String val) {
    sPassword(val);
  }

  RxString sNotValidEmail = "NOT A VALID EMAIL".obs;
  String get notvalidemail {
    return sNotValidEmail.value;
  }

  set notvalidemail(String val) {
    sNotValidEmail(val);
  }

  RxString sNotValidPassword = "PASSWORD IS DIFFERENT FROM THE ONE SENT TO YOU".obs;
  String get notvalidpassword {
    return sNotValidPassword.value;
  }

  set notvalidpassword(String val) {
    sNotValidPassword(val);
  }

  RxString sNextTime = "SIGN UP NEXT TIME".obs;
  String get nexttime {
    return sNextTime.value;
  }

  set nexttime(String val) {
    sNextTime(val);
  }

  RxString sPrivacyPolicy = "PRIVACY POLICY".obs;
  String get privacyPolicy {
    return sPrivacyPolicy.value;
  }

  set privacyPolicy(String val) {
    sPrivacyPolicy(val);
  }

  RxString sNoConnect = "NO CONNECT".obs;
  String get noConnect {
    return sNoConnect.value;
  }

  set noConnect(String val) {
    sNoConnect(val);
  }

  RxString sNoAccess = "NO ACCESS TO THE INTERNET. MAKE THE CONNECTION AND TRY AGAIN.".obs;
  String get noAccess {
    return sNoAccess.value;
  }

  set noAccess(String val) {
    sNoAccess(val);
  }

  RxString sLicense = "LICENSE".obs;
  String get license {
    return sLicense.value;
  }

  set license(String val) {
    sLicense(val);
  }

  RxString sNotInfo = "NO EADDITIVES INFORMATION".obs;
  String get notinfo {
    return sNotInfo.value;
  }

  set notinfo(String val) {
    sNotInfo(val);
  }

  writeStorage() {
    App.storage.write(StorageFields.find, find);
    App.storage.write(StorageFields.danger, danger);
    App.storage.write(StorageFields.group, group);
    App.storage.write(StorageFields.origin, origin);
    App.storage.write(StorageFields.classification, classification);
    App.storage.write(StorageFields.settings, settings);
    App.storage.write(StorageFields.about, about);
    App.storage.write(StorageFields.colorthemes, colorthemes);
    App.storage.write(StorageFields.language, language);
    App.storage.write(StorageFields.confirm, confirm);
    App.storage.write(StorageFields.cancel, cancel);
    App.storage.write(StorageFields.screenshot, screenshot);
    App.storage.write(StorageFields.download, download);
    App.storage.write(StorageFields.use, use);
    App.storage.write(StorageFields.question, question);
    App.storage.write(StorageFields.issue, issue);
    App.storage.write(StorageFields.advice, advice);
    App.storage.write(StorageFields.message, message);
    App.storage.write(StorageFields.signin, signin);
    App.storage.write(StorageFields.signout, signout);
    App.storage.write(StorageFields.signup, signup);
    App.storage.write(StorageFields.with_, with_);
    App.storage.write(StorageFields.vegans, vegans);
    App.storage.write(StorageFields.additives, additives);
    App.storage.write(StorageFields.email, email);
    App.storage.write(StorageFields.password, password);
    App.storage.write(StorageFields.notvalidemail, notvalidemail);
    App.storage.write(StorageFields.notvalidpassword, notvalidpassword);
    App.storage.write(StorageFields.nexttime, nexttime);
    App.storage.write(StorageFields.privacyPolicy, privacyPolicy);
    App.storage.write(StorageFields.noConnect, noConnect);
    App.storage.write(StorageFields.noAccess, noAccess);
    App.storage.write(StorageFields.license, license);
    App.storage.write(StorageFields.notinfo, notinfo);
  }

  readStorage() {
    find = App.storage.read<String>(StorageFields.find) ?? "FIND";
    danger = App.storage.read<String>(StorageFields.danger) ?? "DANGER";
    group = App.storage.read<String>(StorageFields.group) ?? "GROUP";
    origin = App.storage.read<String>(StorageFields.origin) ?? "ORIGIN";
    classification = App.storage.read<String>(StorageFields.classification) ?? "CLASSIFICATION";
    settings = App.storage.read<String>(StorageFields.settings) ?? "SETTINGS";
    about = App.storage.read<String>(StorageFields.about) ?? "ABOUT";
    colorthemes = App.storage.read<String>(StorageFields.colorthemes) ?? "COLOR THEMES";
    language = App.storage.read<String>(StorageFields.language) ?? "CHOOSE A LANGUAGE";
    confirm = App.storage.read<String>(StorageFields.confirm) ?? "CONFIRM";
    cancel = App.storage.read<String>(StorageFields.cancel) ?? "CANCEL";
    screenshot = App.storage.read<String>(StorageFields.screenshot) ?? "SCREENSHOT";
    download = App.storage.read<String>(StorageFields.download) ?? "DOWNLOAD";
    use = App.storage.read<String>(StorageFields.use) ?? "USE";
    question = App.storage.read<String>(StorageFields.question) ?? "QUESTION";
    issue = App.storage.read<String>(StorageFields.issue) ?? "ISSUE";
    advice = App.storage.read<String>(StorageFields.advice) ?? "ADVICE";
    message = App.storage.read<String>(StorageFields.message) ?? "MESSAGE";
    signin = App.storage.read<String>(StorageFields.signin) ?? "SIGN IN";
    signout = App.storage.read<String>(StorageFields.signout) ?? "SIGN OUT";
    signup = App.storage.read<String>(StorageFields.signup) ?? "SIGN UP";
    with_ = App.storage.read<String>(StorageFields.with_) ?? "WITH";
    vegans = App.storage.read<String>(StorageFields.vegans) ?? "VEGANS";
    additives = App.storage.read<String>(StorageFields.additives) ?? "ADDITIVES";
    email = App.storage.read<String>(StorageFields.email) ?? "EMAIL";
    password = App.storage.read<String>(StorageFields.password) ?? "PASSWORD";
    notvalidemail = App.storage.read<String>(StorageFields.notvalidemail) ?? "NOT A VALID EMAIL";
    notvalidpassword =
        App.storage.read<String>(StorageFields.notvalidpassword) ?? "PASSWORD IS DIFFERENT FROM THE ONE SENT TO YOU";
    nexttime = App.storage.read<String>(StorageFields.nexttime) ?? "SIGN UP NEXT TIME";
    privacyPolicy = App.storage.read<String>(StorageFields.privacyPolicy) ?? "PRIVACY POLICY";
    noConnect = App.storage.read<String>(StorageFields.noConnect) ?? "NO CONNECT";
    noAccess = App.storage.read<String>(StorageFields.noAccess) ??
        "NO ACCESS TO THE INTERNET. MAKE THE CONNECTION AND TRY AGAIN.";
    license = App.storage.read<String>(StorageFields.license) ?? "LICENSE";
    notinfo = App.storage.read<String>(StorageFields.notinfo) ?? "NO EADDITIVES INFORMATION";
  }

  reload(TranslatorController recreate) {
    find = recreate.find;
    danger = recreate.danger;
    settings = recreate.settings;
    about = recreate.about;
    colorthemes = recreate.colorthemes;
    language = recreate.language;
    confirm = recreate.confirm;
    cancel = recreate.cancel;
    screenshot = recreate.screenshot;
    origin = recreate.origin;
    classification = recreate.classification;
    group = recreate.group;
    download = recreate.download;
    use = recreate.use;
    question = recreate.question;
    issue = recreate.issue;
    advice = recreate.advice;
    message = recreate.message;
    signin = recreate.signin;
    signout = recreate.signout;
    signup = recreate.signup;
    with_ = recreate.with_;
    vegans = recreate.vegans;
    additives = recreate.additives;
    email = recreate.email;
    password = recreate.password;
    notvalidemail = recreate.notvalidemail;
    notvalidpassword = recreate.notvalidpassword;
    nexttime = recreate.nexttime;
    privacyPolicy = recreate.privacyPolicy;
    noConnect = recreate.noConnect;
    noAccess = recreate.noAccess;
    license = recreate.license;
    notinfo = recreate.notinfo;
  }

  upload(List<ResultTranslatorModel> result) {
    for (int i = 0; i < result.length; i++) {
      switch (result[i].original) {
        case "FIND":
          find = result[i].translation;
          break;
        case "DANGER":
          danger = result[i].translation;
          break;
        case "GROUP":
          group = result[i].translation;
          break;
        case "ORIGIN":
          origin = result[i].translation;
          break;
        case "CLASSIFICATION":
          classification = result[i].translation;
          break;
        case "SETTINGS":
          settings = result[i].translation;
          break;
        case "ABOUT": //"FEEDBACK": //"ABOUT"
          about = result[i].translation;
          break;
        case "COLOR THEMES":
          colorthemes = result[i].translation;
          break;
        case "CHOOSE A LANGUAGE":
          language = result[i].translation;
          break;
        case "CONFIRM":
          confirm = result[i].translation;
          break;
        case "CANCEL":
          cancel = result[i].translation;
          break;
        case "SCREENSHOT":
          screenshot = result[i].translation;
          break;
        case "DOWNLOAD":
          download = result[i].translation;
          break;
        case "USE":
          use = result[i].translation;
          break;
        case "QUESTION":
          question = result[i].translation;
          break;
        case "ISSUE":
          issue = result[i].translation;
          break;
        case "ADVICE":
          advice = result[i].translation;
          break;
        case "MESSAGE":
          message = result[i].translation;
          break;
        case "SIGN IN":
          signin = result[i].translation;
          break;
        case "SIGN OUT":
          signout = result[i].translation;
          break;
        case "SIGN UP":
          signup = result[i].translation;
          break;
        case "WITH":
          with_ = result[i].translation;
          break;
        case "VEGANS":
          vegans = result[i].translation;
          break;
        case "ADDITIVES":
          additives = result[i].translation;
          break;
        case "EMAIL":
          email = result[i].translation;
          break;
        case "PASSWORD":
          password = result[i].translation;
          break;
        case "NOT A VALID EMAIL":
          notvalidemail = result[i].translation;
          break;
        case "PASSWORD IS DIFFERENT FROM THE ONE SENT TO YOU":
          notvalidpassword = result[i].translation;
          break;
        case "SIGN UP NEXT TIME":
          nexttime = result[i].translation;
          break;
        case "PRIVACY POLICY":
          privacyPolicy = result[i].translation;
          break;
        case "NO CONNECT":
          noConnect = result[i].translation;
          break;
        case "NO ACCESS TO THE INTERNET. MAKE THE CONNECTION AND TRY AGAIN.":
          noAccess = result[i].translation;
          break;
        case "LICENSE":
          license = result[i].translation;
          break;
        case "NO EADDITIVES INFORMATION":
          notinfo = result[i].translation;
          break;
        default:
          break;
      }
    }
  }
}
