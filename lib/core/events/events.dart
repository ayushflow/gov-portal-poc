import 'dart:async';
import 'dart:collection';

import 'package:gov_client_app/core/events/event_handler.dart';
import 'package:gov_client_app/utils/logger.dart';

enum EventType {
  // When the user logout
  logout,

  // When the user login
  login,
}

class EventData {
  final EventType type;

  const EventData({
    required this.type,
  });
}

class EventService {
  StreamController<EventData> _controller = StreamController<EventData>();
  Queue<EventData> _eventQueue = Queue<EventData>();

  void init() {
    if (_controller.isClosed) {
      _controller = StreamController<EventData>();
      _eventQueue = Queue<EventData>();
    }
    _controller.stream.listen((event) {
      _eventQueue.add(event);
      if (_eventQueue.length == 1) {
        _processNextEvent();
      }
    });
  }

  void addEvent(EventData event) {
    if (_controller.isClosed) {
      Logger.error(
          'Event of type: ${event.type} was dropped because the stream is closed.');
    } else {
      _controller.add(event);
    }
  }

  Future<void> _processNextEvent() async {
    while (_eventQueue.isNotEmpty) {
      final event = _eventQueue.first;
      await _handleEvent(event);
      await EventHandler.handleEvent(event);
      _eventQueue.removeFirst();
    }
  }

  Future<void> _handleEvent(EventData event) async {
    // Async operation which maybe required in common
    Logger.info('Processing event: ${event.type}');
  }

  void dispose() {
    if (!_controller.isClosed) {
      _controller.close();
    }
  }
}
