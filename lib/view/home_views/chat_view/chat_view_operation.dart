import 'package:flutter/widgets.dart';

mixin ChatViewOperation<ChatView> {
  ScrollController scrollController = ScrollController();
  bool isAtTop = true;

    void scrollListener() {
    if (scrollController.offset <= scrollController.position.minScrollExtent && !scrollController.position.outOfRange) {
          print("on top");
          isAtTop = true;
    } else {
        isAtTop = false;
    }
  }

}