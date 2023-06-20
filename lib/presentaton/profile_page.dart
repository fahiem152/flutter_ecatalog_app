import 'package:flutter/material.dart';

import '../data/datasources/local_datasource.dart';
import 'login_page.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: const EdgeInsets.all(
            16,
          ),
          child: Row(
            children: [
              ClipOval(
                child: Image.network(
                  'https://picsum.photos/640/640?r=698',
                  width: 60,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Jhon Doe',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text('Customer'),
                ],
              ),
              const Spacer(),
              const Icon(
                Icons.edit,
                color: Color(0xff03dac6),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Account',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              DataTable(columns: const [
                DataColumn(
                  label: Text(
                    'Email',
                  ),
                ),
                DataColumn(
                  label: Text(
                    'adma@gmailc.com',
                  ),
                ),
              ], rows: const [
                DataRow(
                  cells: [
                    DataCell(
                      Text('Password'),
                    ),
                    DataCell(
                      Text('**********'),
                    ),
                  ],
                )
              ])
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Column(
            children: [
              Text(
                'Bergabung Sejak',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                '20-08-2023',
              )
            ],
          ),
        ),
        InkWell(
          onTap: () async {
            await LocalDatasource().removeToken();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const LoginPage();
            }));
          },
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.error,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(child: Text('Logout')),
          ),
        ),
      ],
    );
  }
}
