import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DrawerProfileWidget extends StatelessWidget {
  const DrawerProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Iconsax.profile_circle,size: 40,),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Mahbub Ahmed Ashik"),
                    Text("+880 1704 4811 25"),
                  ],
                ),
              ),
            ],
          ),
          Icon(Iconsax.edit,size: 20,)
        ],
      ),
    );
  }
}