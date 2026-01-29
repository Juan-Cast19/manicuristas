//IMPORT FLUTTER
import 'package:manicuristas/features/clients/domain/models/client_model.dart';

final List<Client> clientsMock = [
  Client(
    id: '1',
    name: 'María González',
    phone: '809-555-1234',
    avatar: 'https://i.pravatar.cc/150?img=1',
    nextService: 'Manicure clásica',
    lastVisit: DateTime(2025, 1, 10),
    isRecurrent: true,
    upcomingAppointments: [
      Appointment(
        id: 'a1',
        date: DateTime(2025, 2, 5, 10, 30),
        service: 'Manicure clásica',
      ),
    ],
  ),
  Client(
    id: '2',
    name: 'Laura Pérez',
    phone: '829-555-5678',
    avatar: 'https://i.pravatar.cc/150?img=2',
    nextService: 'Pedicure spa',
    lastVisit: DateTime(2024, 12, 20),
    isRecurrent: true,
    upcomingAppointments: [
      Appointment(
        id: 'a2',
        date: DateTime(2025, 2, 8, 14, 0),
        service: 'Pedicure spa',
      ),
      Appointment(
        id: 'a3',
        date: DateTime(2025, 3, 1, 9, 0),
        service: 'Pedicure spa',
      ),
    ],
  ),
  Client(
    id: '3',
    name: 'Ana Rodríguez',
    phone: '849-555-9876',
    avatar: 'https://i.pravatar.cc/150?img=3',
    nextService: null,
    lastVisit: DateTime(2024, 11, 15),
    isRecurrent: false,
    upcomingAppointments: null,
  ),
  Client(
    id: '4',
    name: 'Sofía Martínez',
    phone: '809-555-2222',
    avatar: 'https://i.pravatar.cc/150?img=4',
    nextService: 'Uñas acrílicas',
    lastVisit: DateTime(2025, 1, 22),
    isRecurrent: true,
    upcomingAppointments: [
      Appointment(
        id: 'a4',
        date: DateTime(2025, 2, 12, 11, 0),
        service: 'Uñas acrílicas',
      ),
    ],
  ),
  Client(
    id: '5',
    name: 'Carla Mejía',
    phone: '829-555-3333',
    avatar: 'https://i.pravatar.cc/150?img=5',
    nextService: null,
    lastVisit: null,
    isRecurrent: false,
    upcomingAppointments: null,
  ),
];