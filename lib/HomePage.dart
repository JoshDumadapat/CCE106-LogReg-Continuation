import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_reg_stateful_act/LoginForm.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  bool _isDarkColor(Color color) {
    final luminance = color.computeLuminance();
    return luminance < 0.5;
  }

  SystemUiOverlayStyle _getStatusBarStyle(Color backgroundColor) {
    if (_isDarkColor(backgroundColor)) {
      return SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      );
    } else {
      return SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      );
    }
  }

  buildNavBar(BuildContext context) => Container(
      height: 100,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 46, 48, 49),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Nike',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: Colors.white,
                letterSpacing: 1.2,
              ),
            ),
          ),

          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 22),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.logout, color: Colors.white, size: 22),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginForm()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );

  buildColumn(BuildContext context) => SizedBox(
    width: double.infinity,
    child: Stack(
      children: [
        Image.asset('assets/product.png'),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: _getStatusBarStyle(const Color.fromARGB(255, 46, 48, 49)),
            child: buildNavBar(context),
          ),
        ),
      ],
    ),
  );

  buildRowProductInfo() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: const [
      Row(
        children: [
          Text(
            'Product Name: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Text(
            'Air Jordan 1',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      Row(
        children: [
          Text(
            'Price: ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
          ),
          Text(
            '\$500',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      SizedBox(height: 20),
    ],
  );

  buildDescriptionLabel() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 20),
      const Text(
        'Description:',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ],
  );

  buildDescriptionText() => const Align(
    alignment: Alignment.centerLeft,
    child: Text(
      textAlign: TextAlign.justify,
      'The Air Jordan 1 High Retro “Chicago Bulls DMP” is a classic sneaker known for its bold style and comfort. It features the iconic red, white, and black design, making it perfect for both everyday wear and basketball fans.',
      style: TextStyle(fontSize: 16),
    ),
  );

  buildRatingLabel(int rating, int numreviews) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          Text(
            'Rating:   ',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          for (int i = 1; i <= rating; i++)
            const Icon(Icons.star, color: Colors.amber),
          for (int i = 1; i <= (5 - rating); i++)
            const Icon(
              Icons.star,
              color: Color.fromARGB(255, 135, 135, 135),
              size: 25,
            ),
          const SizedBox(width: 10),
        ],
      ),
      Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 46, 48, 49),
              foregroundColor: Colors.white,
            ),
            onPressed: () {},
            child: Text('Add to Cart'),
          ),
        ],
      ),
    ],
  );

  buildrowtabs() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      buildRowProductInfo(),
      const SizedBox(height: 20),
      buildDescriptionLabel(),
      const SizedBox(height: 10),
      buildDescriptionText(),
      const SizedBox(height: 30),
      buildRatingLabel(3, 5),
      const SizedBox(height: 10),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: _getStatusBarStyle(Colors.white),
        child: Column(
          children: [
            buildColumn(context),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 30),
                  buildrowtabs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
