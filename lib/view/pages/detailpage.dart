part of 'pages.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({super.key});

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Placeholder gambar dari internet
            Image.network(
              'https://cdn.pixabay.com/photo/2017/05/12/22/03/cartoon-panda-2308269_1280.png',
              width: 500,
              height: 500,
              // Icon fallback jika tidak ada internet
              errorBuilder: (ctx, _, __) => const Icon(Icons.image, size: 100),
            ),
            const SizedBox(height: 24),
            const Text(
              "Hello World",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
