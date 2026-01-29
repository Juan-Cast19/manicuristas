class Client {
  final String id;
  final String name;
  final String phone;
  final String avatar;
  final String? nextService;
  final List<Appointment>? upcomingAppointments;
  final DateTime? lastVisit;
  final bool isRecurrent;

  const Client({
    required this.id,
    required this.name,
    required this.phone,
    required this.avatar,
    this.nextService,
    this.upcomingAppointments,
    this.lastVisit,
    required this.isRecurrent,
  });
}

/// Modelo simple de Appointment
/// (más adelante lo podemos mover a su feature correspondiente)
class Appointment {
  final String id;
  final DateTime date;
  final String service;

  const Appointment({
    required this.id,
    required this.date,
    required this.service,
  });
}