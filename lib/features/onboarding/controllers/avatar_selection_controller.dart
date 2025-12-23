import 'package:get/get.dart';

class AvatarSelectionController extends GetxController {
  Rx<int?> selectedAvatarIndex = Rx<int?>(null);

  void selectAvatar(int index) {
    selectedAvatarIndex.value = index;
  }

  bool isAvatarSelected() => selectedAvatarIndex.value != null;

  int? getSelectedAvatar() => selectedAvatarIndex.value;

  void resetSelection() {
    selectedAvatarIndex.value = null;
  }
}
