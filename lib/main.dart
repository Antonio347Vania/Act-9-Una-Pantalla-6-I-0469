import 'package:flutter/material.dart';

void main() => runApp(const AppSoriana());

class AppSoriana extends StatelessWidget {
  const AppSoriana({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soriana App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Gris muy claro de fondo
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: const Icon(Icons.menu, color: Colors.black),
        title: const Text('Soriana', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.green),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 1. BARRA DE BÚSQUEDA (Estilo Naranja como la imagen)
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                        ),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: const TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 45,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                    ),
                    child: const Icon(Icons.search, color: Colors.white),
                  ),
                ],
              ),
            ),

            // 2. BANNER PROMOCIONAL
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.orange.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://img.freepik.com/vector-premium/banner-supermercado-alimentos-frescos-frutas-verduras_8071-13735.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(child: Text("Ofertas de Hoy")),
                ),
              ),
            ),

            // 3. BOTONES DE CATEGORÍA (Horizontal)
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildCategoryBtn("Vegetales", Colors.green.shade400),
                _buildCategoryBtn("Grocery", Colors.pink.shade300),
                _buildCategoryBtn("Fruits", Colors.blue.shade300),
              ],
            ),

            // 4. GRILLA DE PRODUCTOS
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text("Productos Destacados", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                final names = ["Aceite", "Arroz", "Detergente", "Leche"];
                final prices = ["\$42.00", "\$24.50", "\$115.00", "\$26.00"];
                // Usando imágenes de respaldo por si fallan
                final images = [
                  "https://raw.githubusercontent.com/Antonio347Vania/im-genes-para-flutter-6toI-11-Feb-2026/refs/heads/main/Aceite%20Aguacate.jpg",
                  "https://raw.githubusercontent.com/Antonio347Vania/im-genes-para-flutter-6toI-11-Feb-2026/refs/heads/main/Arroz.jpg",
                  "https://raw.githubusercontent.com/Antonio347Vania/im-genes-para-flutter-6toI-11-Feb-2026/refs/heads/main/detergente.jpg",
                  "https://raw.githubusercontent.com/Antonio347Vania/im-genes-para-flutter-6toI-11-Feb-2026/refs/heads/main/leche.jpg",
                ];

                return _buildProductCard(names[index], prices[index], images[index]);
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.apple), label: "Frutas"),
          BottomNavigationBarItem(icon: Icon(Icons.local_grocery_store), label: "Súper"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Cuenta"),
        ],
      ),
    );
  }

  // WIDGET PARA BOTONES DE CATEGORÍA
  Widget _buildCategoryBtn(String label, Color color) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(5)),
            child: const Text("Ver más", style: TextStyle(color: Colors.white, fontSize: 10)),
          )
        ],
      ),
    );
  }

  // WIDGET PARA TARJETA DE PRODUCTO
  Widget _buildProductCard(String name, String price, String img) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.network(img, fit: BoxFit.contain),
            ),
          ),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(price, style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(9)),
            ),
            child: const Icon(Icons.add_shopping_cart, color: Colors.white, size: 20),
          )
        ],
      ),
    );
  }
}