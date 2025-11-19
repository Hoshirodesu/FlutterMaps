```
Nama: Mochammad Raffi Fadhillah
NPM: 23552011066
Kelas: TIF RP 23 CID B
```

# Flutter Maps
![IMG-20251120-WA0002](https://github.com/user-attachments/assets/fe853268-8992-46d1-87d7-79e7b5797a03) | ![IMG-20251120-WA0003](https://github.com/user-attachments/assets/c97a5ec3-c7c5-4d40-9f63-fd4af49abdab) | ![IMG-20251120-WA0001](https://github.com/user-attachments/assets/04ce0cea-28e2-4113-baff-c711aa8214e3) | ![IMG-20251120-WA0004](https://github.com/user-attachments/assets/e70c01ce-2d00-4d06-a476-1b13e6c18a48) | ![IMG-20251120-WA0005](https://github.com/user-attachments/assets/d0d047f3-0156-4df6-bfd6-8b105c68123d) | ![IMG-20251120-WA0005](https://github.com/user-attachments/assets/d134088a-d2d5-4a36-bc1c-87bac6215264) | ![IMG-20251120-WA0007](https://github.com/user-attachments/assets/2f1cbc04-4717-48cd-8b35-82088dfc6a6f)
|:-------------------------------:|:-------------------------------:|:-------------------------------:|:-------------------------------:|:-------------------------------:|:-------------------------------:|:-------------------------------:|

### Aplikasi ini dikembangkan menggunakan flutter yang terdiri dari:
1. SplashScreen
2. Halaman Login
3. Halaman Register
4. Library Flutter (flutter_map: ^8.2.2)
5. Halaman List Informasi (ListView)
6. Menu Bottom Navigation
7. About Aplikasi

## Fitur dan penjelasan
### 1. SplashScreen
<img src="https://github.com/user-attachments/assets/fe853268-8992-46d1-87d7-79e7b5797a03" alt="splashscreen" width="340" height="760">

#### Menampilkan animasi splashscreen dengan animasi loading sebelum ke menu login
#### Hasil implementasi:
splash_screen.dart
```dart
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_page.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  Future<void> _navigateToNext() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return;
    
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    
    if (!mounted) return;
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => isLoggedIn ? const HomePage() : const LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.map,
              size: 100,
              color: Colors.white,
            ),
            const SizedBox(height: 20),
            const Text(
              'Flutter Maps',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
```






