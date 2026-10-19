import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF424949)),
      appBarTheme: AppBarTheme(
        backgroundColor: Color(0xFF424949),
        foregroundColor: Colors.white,
      ),
    ),
    home: Feed(),
  ),
);

class Feed extends StatefulWidget {
  const Feed({super.key});

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  final publicacoes = [
    {'nome': 'Ana Silva', 'foto': 'assets/fotos/foto1.jpg'},
    {'nome': 'Bruno Santos', 'foto': 'assets/fotos/foto2.jpg'},
    {'nome': 'Camila Souza', 'foto': 'assets/fotos/foto3.jpg'},
  ];

  final curtidas = [0, 0, 0];
  final gostei = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Meu Feed')),
      body: ListView.builder(
        itemCount: publicacoes.length,
        itemBuilder: (context, i) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Color(0xFF424949),
                foregroundColor: Colors.white,
                child: Icon(Icons.person),
              ),
              title: Text(publicacoes[i]['nome']!),
            ),
            Image.asset(
              publicacoes[i]['foto']!,
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                width: double.infinity,
                height: 250,
                child: Center(child: Icon(Icons.image_outlined, size: 48)),
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    gostei[i] ? Icons.favorite : Icons.favorite_border,
                    color: gostei[i] ? Colors.red : null,
                  ),
                  onPressed: () => setState(() {
                    gostei[i] = !gostei[i];
                    curtidas[i] += gostei[i] ? 1 : -1;
                  }),
                ),
                IconButton(
                  icon: const Icon(Icons.comment_outlined),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Botão comentar')),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.share_outlined),
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Botão compartilhar')),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text('${curtidas[i]} curtidas'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
