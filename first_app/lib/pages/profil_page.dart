import 'package:flutter/material.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFE0E7FF), Color(0xFFFFFFFF)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Avatar
                    const CircleAvatar(
                      radius: 60,
                      //backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/9919?s=200&v=4'),
                      backgroundImage: AssetImage('assets/profile.png'),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Aman',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ingénieur IoT',
                      style: TextStyle(color: scheme.primary),
                    ),
                    const SizedBox(height: 16),

                    // Carte de description
                    Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: scheme.outlineVariant),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: const Text(
                          "Passionné par les systèmes embarqués. "
                          "J'aime construire des expériences performantes, accessibles "
                          "et élégantes.",
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Coordonnées
                    Card(
                      elevation: 0,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: scheme.outlineVariant),
                      ),
                      child: Column(
                        children: const [
                          _ContactTile(
                            icon: Icons.email,
                            label: 'alex.martin@example.com',
                          ),
                          Divider(height: 1),
                          _ContactTile(
                            icon: Icons.phone,
                            label: '+33 7 71 77 34 32',
                          ),
                          Divider(height: 1),
                          _ContactTile(
                            icon: Icons.location_on,
                            label: 'Paris, France',
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Bouton d’action
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Contactez-moi')),
                          );
                        },
                        icon: const Icon(Icons.send),
                        label: const Text('Me contacter'),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Footer
                    Opacity(
                      opacity: 0.7,
                      child: Text(
                        '<Footer>',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ContactTile extends StatelessWidget {
  final IconData icon;
  final String label;

  const _ContactTile({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: scheme.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: scheme.onPrimaryContainer),
      ),
      title: Text(label),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
    );
  }
}
