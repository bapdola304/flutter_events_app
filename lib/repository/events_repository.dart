import 'package:dio/src/response.dart';
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

  Future<EventModel?> getEvent(String id) async {
    final response = await apiService.getEvent(id);
    if (response != null) {
      final data = response.data as dynamic;
      debugPrint("Event: $data");
      return EventModel.fromMap(data);
    }
  }

  Future<Response?> CreateEvent(EventModel event) async {
    final response = await apiService.createEvent(event);
    return response;
  }

  Future<Response?> deleteEvent(String id) async {
    final response = await apiService.deleteEvent(id);
    return response;
  }
}
