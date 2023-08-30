import 'package:events_app/models/event.dart';
import 'package:events_app/services/event_api.dart';
import 'package:flutter/material.dart';

class EventRepository {
  const EventRepository({
    required this.apiService,
  });
  final ApiService apiService;
  Future<List<EventModel>?> getPostList() async {
    final response = await apiService.getEventsData();
    if (response != null) {
      final data = response.data as List<dynamic>;
      debugPrint("data: $data");
      return data
          .map(
            (singlePost) => EventModel.fromMap(singlePost),
          )
          .toList();
    }
  }
}
