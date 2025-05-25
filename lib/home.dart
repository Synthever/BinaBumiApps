import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header section with welcome message and notification
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hai, welcome back!',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Pamela Tri Anjani',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.notifications_none, color: Colors.orange, size: 28),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              
              // Nature scene hero image with coin card overlay
              Stack(
                children: [
                  // Background nature image
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/nature_scene.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  
                  // Coin card overlay
                  Positioned(
                    top: 120,
                    bottom: -5,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.94, // Adjust width to be responsive
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20), // Increased vertical padding from 12 to 25
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            // Coin icon
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFC857),
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                'Rp',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            // Coin info
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding: EdgeInsets.only(top: 0.1), // Add negative top padding to move text higher
                                  child: Text(
                                    'Rp 1.000',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                Text(
                                  '20 koin',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            // Progress indicator
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 45, // Increased height from 40 to 45
                                  width: 45,  // Increased width from 40 to 45
                                  child: CircularProgressIndicator(
                                    value: 0.9,
                                    backgroundColor: Colors.grey.withOpacity(0.3),
                                    valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF4CAF50)),
                                    strokeWidth: 5,
                                  ),
                                ),
                                const Text(
                                  '90%',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF4CAF50),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Menu buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildMenuButton('Maps', Icons.map),
                  _buildMenuButton('Tukar Koin', Icons.recycling),
                  _buildMenuButton('History', Icons.history),
                ],
              ),
              
              const SizedBox(height: 30),
              
              // Task section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title now placed above the horizontal scrolling content
                    const Text(
                      'Ayo ikuti dan selesaikan tugas nya!',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Horizontal scrolling task cards
                    SizedBox(
                      height: 180, // Height just for the cards
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildTaskCard(
                            'Dapatkan 100 botol dalam 3 hari dan dapatkan bonus 10 koin',
                            'assets/images/task1.png',
                          ),
                          const SizedBox(width: 12),
                          _buildTaskCard(
                            'Kumpulkan lebih banyak botol dalam seminggu dan dapatkan hadiah nya',
                            'assets/images/task2.png',
                          ),
                          const SizedBox(width: 12),
                          _buildTaskCard(
                            'Kumpulkan lebih banyak botol dalam seminggu dan dapatkan hadiah nya',
                            'assets/images/task2.png',
                          ),
                          const SizedBox(width: 12),
                          _buildTaskCard(
                            'Kumpulkan lebih banyak botol dalam seminggu dan dapatkan hadiah nya',
                            'assets/images/task2.png',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Nearby section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title now placed above the horizontal scrolling content
                    const Text(
                      'terdekat',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Horizontal scrolling location cards
                    SizedBox(
                      height: 230, // Increased height from 220 to 230 to eliminate overflow
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildLocationCard(
                            'Universitas Amikom Yogyakarta',
                            'Jl. Ring Road Utara, Ngringin, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
                            '4 km',
                            '50% terisi',
                            '24 jam',
                          ),
                          const SizedBox(width: 12),
                          _buildLocationCard(
                            'Pakuwon Mall Jogja',
                            'Jl. Ring Road Utara, Kaliwaru, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
                            '5 km',
                            '50% terisi',
                            '24 jam',
                          ),
                          const SizedBox(width: 12),
                          _buildLocationCard(
                            'Pakuwon Mall Jogja',
                            'Jl. Ring Road Utara, Kaliwaru, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
                            '5 km',
                            '50% terisi',
                            '24 jam',
                          ),
                          const SizedBox(width: 12),
                          _buildLocationCard(
                            'Pakuwon Mall Jogja',
                            'Jl. Ring Road Utara, Kaliwaru, Condongcatur, Kec. Depok, Kabupaten Sleman, Daerah Istimewa Yogyakarta 55281',
                            '5 km',
                            '50% terisi',
                            '24 jam',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Donation section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Open donasi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            // Image with no padding or margin
                            Image.asset(
                              'assets/images/donation.png',
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Ayo, jadi bagian dari perubahan ini!',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    '🌱 Setiap botol yang kita kumpulkan adalah langkah kecil menuju perubahan besar.',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      const Text(
                                        '#BinaBumi #KurangSampahPlastik #SaveOurPlanet',
                                        style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 12,
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xFF2D5731),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: const Text(
                                          'Lihat detail',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      const Text(
                                        'Rp 24.000.000',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const Text(' dari Rp 100.000.000 terkumpul'),
                                      const Spacer(),
                                      const Text(
                                        '25%',
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  LinearProgressIndicator(
                                    value: 0.25,
                                    backgroundColor: Colors.grey.shade200,
                                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_giftcard),
            label: 'Reward',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Edukasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
  
  Widget _buildMenuButton(String label, IconData icon) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.green,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFFFE8D1),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
  
  Widget _buildTaskCard(String text, String imagePath) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(0.7),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Mulai',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _buildLocationCard(String title, String address, String distance, String status, String hours) {
    return Container(
      width: 260,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Icon(
                    Icons.location_city,
                    size: 30,
                    color: Colors.green,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Status :'),
                  Row(
                    children: [
                      const Icon(Icons.recycling, size: 16, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(status, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time, size: 16, color: Colors.orange),
                      const SizedBox(width: 4),
                      Text(hours, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.circle, size: 10, color: Colors.green),
                      const SizedBox(width: 4),
                      Text(distance, style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            address,
            style: const TextStyle(
              fontSize: 11, // Reduced font size from 12 to 11
              color: Colors.grey,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10), // Reduced spacing from 12 to 10
          SizedBox(
            width: double.infinity,
            height: 36, // Set explicit height for button to prevent resizing
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2D5731),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              icon: const Icon(Icons.directions, size: 16, color: Colors.white),
              label: const Text(
                'Rute',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
