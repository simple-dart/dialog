import 'package:simple_dart_label/simple_dart_label.dart';
import 'package:simple_dart_ui_core/simple_dart_ui_core.dart';

import 'abstract_dialog.dart';

abstract class HeadedDialog<T> extends AbstractDialog<T> {
  HeadedDialog() : super('HeadedDialog') {
    vertical = true;
    headerPanel.add(header);
    addAll([headerPanel, bodyPanel]);
  }

  String get caption => header.caption;

  set caption(String newCaption) {
    header.caption = newCaption;
  }

  Panel headerPanel = Panel()
    ..addCssClass('HeadedDialogHeader')
    ..padding = '10px';
  Label header = Label();
  Panel bodyPanel = Panel()
    ..addCssClass('HeadedDialogBody')
    ..padding = '10px'
    ..spacing = '5px';
}
