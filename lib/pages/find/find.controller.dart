import 'package:get/get.dart';
import 'find.models.dart';

class FindController extends GetxController {
  late FindModel findModel;
  final RxString eText = 'E111'.obs;

  @override
  void onInit() {
    super.onInit();
    findModel = FindModel(currentValue00: 1, currentValue0: 1, currentValue: 1);
  }

  void changeText() {
    eText.value = 'E${findModel.currentValue00}${findModel.currentValue0}${findModel.currentValue}';
    update(['onChanges']);
  }

  void onChange00(newValue) {
    findModel.currentValue00 = newValue;
    changeText();
  }

  void onChange0(newValue) {
    findModel.currentValue0 = newValue;
    changeText();
  }

  void onChange(newValue) {
    findModel.currentValue = newValue;
    changeText();
  }
}
