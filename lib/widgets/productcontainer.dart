import 'package:flutter/material.dart';
import 'package:mysliver/data/appcolor.dart';
import 'package:mysliver/data/apptextstyle.dart';
import 'package:mysliver/data/data.dart';

class Productcontainer extends StatelessWidget {
  const Productcontainer({super.key,required this.myproduct});
  final Product myproduct;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: Image.network(
                "${myproduct.image}",
              fit: BoxFit.cover,width: double.maxFinite,),
            )),
            SizedBox(height: 8,),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                Text('${myproduct.title}',style: LightAppTheme.bodyRegularBold,)
                ,Text('Available items ${myproduct.quantity}',style: LightAppTheme.bodyRegularSmall,),
               // Text('4.96',style: LightAppTheme.bodyRegularSmall,),
                Text('kSH : ${myproduct.price}',style: LightAppTheme.bodyMedium,),
                Row(
                  children: [
                   // Smallbox(),
                    //Smallbox()
                  ],
                )
            ],
          )
        ],
      ),
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        //border: Border.all(
          //width: 1,
          //color: LightAppColors.primaryText
        //)
      ),
    );
  }
}