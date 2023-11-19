import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:tangle/utils/white_space.dart';
import '../widgets/widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(MaterialIcons.filter_list),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesome.bell_o),
              ),
            ],
          ),
        ),
        body: const Stack(
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Row(children: [
                BioDetails(
                  name: 'Wendy',
                  age: '28',
                  image: 'lady1',
                  location: 'Lekki Penisula Lagos',
                  occupation: 'Doctor',
                ),
                BioDetails(
                  name: 'Amina',
                  age: '26',
                  image: 'lady2',
                  location: 'Wasu 2 Abuja',
                  occupation: 'Campaign Manager',
                ),
              ]),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ActionButtons(icon: Icons.favorite,),
                  WhiteSpace(width: 5),
                  ActionButtons(icon: Icons.star,),
                  WhiteSpace(width: 5),
                  ActionButtons(icon: Icons.cancel_outlined),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
