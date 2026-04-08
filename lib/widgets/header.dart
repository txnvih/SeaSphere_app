import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0F1A).withOpacity(0.8), // bg-background/80
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.1), // border-border/50
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          /// 🔵 LOGO + TEXT (LEFT)
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, "/");
            },
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    /// Glow effect
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF3B82F6).withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                    ),

                    /// Logo image
                    Image.asset(
                      'assests/seaspherelogo.png',
                      width: 28,
                      height: 28,
                    ),
                  ],
                ),

                const SizedBox(width: 10),

                /// Text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: "Sea",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: "Sphere",
                            style: TextStyle(
                              color: Color(0xFF3B82F6),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      "Uncover Identify Protect",
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.white54,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// 🧭 NAVIGATION (RIGHT)
          Row(
            children: [

              /// Home Button
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, "/");
                },
                icon: const Icon(Icons.home, size: 18, color: Colors.white),
                label: const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              /// About Button
              TextButton.icon(
                onPressed: () {
                  // You can create /about later
                },
                icon: const Icon(Icons.info, size: 18, color: Colors.white),
                label: const Text(
                  "About",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}