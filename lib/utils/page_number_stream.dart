import 'dart:async';

class PageNoStream {
  int pageNo = 0;
  StreamController<int> controller = StreamController<int>();
  get stream => controller.stream;
  setStream(value) {
    controller.sink.add(value);
  }
}
