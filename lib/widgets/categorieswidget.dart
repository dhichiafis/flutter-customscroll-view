import 'package:flutter/material.dart';
import 'package:mysliver/data/apptextstyle.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    super.key,
    required this.categoryTitle,
    required this.handleFilter
    });
  final String categoryTitle;
  final void Function() handleFilter;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleFilter,
      child: Container(
        margin: EdgeInsets.all(12),
        width: 80,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(50),
                child: Image.network('https://plus.unsplash.com/premium_photo-1793384525127-0efc8c205575?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D',
                width: 100,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(height: 8,),
            Text('${categoryTitle}',style: LightAppTheme.bodyMedium,)
          ],
        ),
      ),
    );
  }
}