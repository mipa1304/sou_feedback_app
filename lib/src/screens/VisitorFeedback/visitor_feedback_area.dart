import 'package:flutter/material.dart';

class VisitorFeedbackArea {
  const VisitorFeedbackArea({
    required this.id,
    required this.name,
    required this.icon,
  });

  final String id;
  final String name;
  final IconData icon;

  String get qrPayload => Uri(
        scheme: 'soufeedback',
        host: 'feedback',
        queryParameters: {'area': id},
      ).toString();

  static const List<VisitorFeedbackArea> all = [
    VisitorFeedbackArea(
      id: 'exhibition_hall',
      name: 'Exhibition Hall',
      icon: Icons.museum_outlined,
    ),
    VisitorFeedbackArea(
      id: 'lift_lobby',
      name: 'Lift Lobby',
      icon: Icons.elevator_outlined,
    ),
    VisitorFeedbackArea(
      id: 'viewing_gallery',
      name: 'Viewing Gallery',
      icon: Icons.landscape_outlined,
    ),
    VisitorFeedbackArea(
      id: 'external_walkways',
      name: 'External Walkways',
      icon: Icons.directions_walk_outlined,
    ),
    VisitorFeedbackArea(
      id: 'ticket_counter_washroom',
      name: 'Washroom at Ticket Counter',
      icon: Icons.wc_outlined,
    ),
    VisitorFeedbackArea(
      id: 'exhibition_hall_washroom',
      name: 'Washroom at Exhibition Hall',
      icon: Icons.wc_outlined,
    ),
    VisitorFeedbackArea(
      id: 'viewing_gallery_washroom',
      name: 'Washroom at Viewing Gallery',
      icon: Icons.wc_outlined,
    ),
    VisitorFeedbackArea(
      id: 'security_check',
      name: 'Security Check',
      icon: Icons.security_outlined,
    ),
    VisitorFeedbackArea(
      id: 'guest_relations',
      name: 'Guest Relations',
      icon: Icons.support_agent_outlined,
    ),
    VisitorFeedbackArea(
      id: 'bridge_facilities',
      name: 'Bridge Facilities',
      icon: Icons.route_outlined,
    ),
    VisitorFeedbackArea(
      id: 'museum_exhibits',
      name: 'Museum Exhibits',
      icon: Icons.collections_outlined,
    ),
    VisitorFeedbackArea(
      id: 'projection_show',
      name: 'Projection Mapping Show',
      icon: Icons.theaters_outlined,
    ),
    VisitorFeedbackArea(
      id: 'cafeteria',
      name: 'Cafeteria',
      icon: Icons.restaurant_outlined,
    ),
  ];

  static VisitorFeedbackArea? fromQrPayload(String payload) {
    final value = payload.trim();
    final uri = Uri.tryParse(value);
    String? areaId;

    if (uri != null && uri.scheme == 'soufeedback' && uri.host == 'feedback') {
      areaId = uri.queryParameters['area'];
    } else if (!value.contains('://')) {
      areaId = value;
    }

    for (final area in all) {
      if (area.id == areaId) return area;
    }
    return null;
  }
}
