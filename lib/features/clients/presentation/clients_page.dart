// IMPORT FLUTTER
import 'package:flutter/material.dart';
// IMPORT CORE
import 'package:manicuristas/core/theme/app_colors.dart';
import 'package:manicuristas/core/theme/app_text_styles.dart';
// IMPORT MODELS & MOCKS
import 'package:manicuristas/features/clients/domain/models/client_model.dart';
import 'package:manicuristas/features/clients/mock/clients_mock.dart';
// IMPORT WIDGETS
import 'package:manicuristas/features/clients/presentation/widgets/client_card.dart';
import 'package:manicuristas/features/clients/presentation/widgets/search_input.dart';
import 'package:manicuristas/features/clients/presentation/widgets/client_filter_chips.dart';
// IMPORT PAGES
import 'package:manicuristas/features/agenda/presentation/new_appointment_page.dart';

class ClientsPage extends StatefulWidget {
  const ClientsPage({super.key});

  @override
  State<ClientsPage> createState() => _ClientsPageState();
}

class _ClientsPageState extends State<ClientsPage> {
  String _searchText = '';
  ClientsFilter _selectedFilter = ClientsFilter.todos;

  List<Client> get _filteredClients {
    return clientsMock.where((client) {
      final matchesSearch = client.name
          .toLowerCase()
          .contains(_searchText.toLowerCase());

      final matchesFilter = switch (_selectedFilter) {
        ClientsFilter.todos => true,
        ClientsFilter.recurrentes => client.isRecurrent,
        ClientsFilter.conCitas =>
          client.upcomingAppointments != null &&
          client.upcomingAppointments!.isNotEmpty,
      };

      return matchesSearch && matchesFilter;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Title
              Text(
                'Clientes',
                style: AppTextStyles.title,
              ),

              const SizedBox(height: 16),

              // 🔍 Search
              SearchInput(
                hintText: 'Buscar cliente',
                onChanged: (value) {
                  setState(() {
                    _searchText = value;
                  });
                },
              ),

              const SizedBox(height: 16),

              // 🧩 Filters
              ClientsFilterChips(
                selectedFilter: _selectedFilter,
                onChanged: (filter) {
                  setState(() {
                    _selectedFilter = filter;
                  });
                },
              ),

              const SizedBox(height: 24),

              // 📋 List
              Expanded(
                child: ListView.separated(
                  itemCount: _filteredClients.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final client = _filteredClients[index];

                    return ClientCard(
                      client: client,
                      onBook: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewReservationPage(
                              client: client,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

