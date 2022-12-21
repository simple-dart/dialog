import 'dart:async';

import 'package:simple_dart_modal_controller/simple_dart_modal_controller.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

abstract class AbstractDialog<T> extends PanelComponent {
  AbstractDialog(String className) : super('DialogWindow') {
    addCssClass(className);
    vertical = true;
  }

  Completer<T?> completer = Completer<T?>();

  Future<T?> showDialog() {
    modalController.showComponentModal(this);
    modalController.onClick.listen((event) {
      completer.complete(null);
      closeDialog();
    });
    beforeShow();
    return completer.future;
  }

  void closeDialog() {
    completer = Completer<T?>();
    modalController.close();
  }

  void beforeShow() {}
}
