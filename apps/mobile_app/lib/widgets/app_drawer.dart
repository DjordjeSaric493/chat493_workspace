import 'package:flutter/material.dart';
import 'package:serverpod_auth_idp_flutter/serverpod_auth_idp_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import '../const/colors.dart';
import '../main.dart';
/*
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // SessionManager već ima informaciju o korisniku ako je ulogovan
    final user = client.auth.authInfo?.authUserId;
    return Drawer(
      backgroundColor: AppColors.darkBlue,
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: AppColors.red,
              image: DecorationImage(
                image: NetworkImage(
                  'https://www.bgprevoz.rs/storage/vesti/vest-199-hO2tbLu31q7GRNCZKjRWq7Duy5eys1tsftBpjeTm.jpg',
                ), // Opciono: neka slika autobusa u pozadini
                opacity: 0.2,
                fit: BoxFit.cover,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: AppColors.lightYellow,
              child: Text(
                user?.userName?[0].toUpperCase() ?? 'U',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppColors.red,
                ),
              ),
            ),
            accountName: Text(
              user?.userName ?? 'Putnik',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: Text(
              user?.email ?? 'Nema karte (emaila)',
              style: const TextStyle(color: AppColors.lightGrey),
            ),
          ),

          // INFO SEKCIJA (Da potvrdimo user=1 status)
          ListTile(
            leading: const Icon(Icons.badge, color: AppColors.lightYellow),
            title: const Text(
              'Broj karte (ID)',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: Text(
              '${user?.id ?? "N/A"}',
              style: const TextStyle(color: Colors.grey),
            ),
          ),

          const Divider(color: Colors.white24),

          ListTile(
            leading: const Icon(Icons.directions_bus, color: Colors.white),
            title: const Text(
              'Moje linije',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => Navigator.pop(context),
          ),

          const Spacer(),

          // DUGME ZA ODJAVU
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: ListTile(
              leading: const Icon(Icons.exit_to_app, color: AppColors.red),
              title: const Text(
                'IZLAZ IZ BUSA',
                style: TextStyle(
                  color: AppColors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () async {
                // signOut() briše tokene i sa servera i sa uređaja
                await client.auth.signOutDevice();
              },
            ),
          ),
        ],
      ),
    );
  }
}
*/