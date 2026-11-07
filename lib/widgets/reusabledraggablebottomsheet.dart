
import 'package:flutter/material.dart';
import 'package:mysliver/data/appcolor.dart';
import 'package:mysliver/data/apptextstyle.dart';
import 'package:mysliver/data/data.dart';
import 'package:mysliver/widgets/productcontainer.dart';

class ReusableDraggableBottomSheet extends StatefulWidget {
  const ReusableDraggableBottomSheet({
    super.key,
    required this.searchedProducts,
  });

  final List<Product> searchedProducts;

  @override
  State<ReusableDraggableBottomSheet> createState() =>
      _ReusableDraggableBottomSheetState();
}

class _ReusableDraggableBottomSheetState
    extends State<ReusableDraggableBottomSheet> {

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.15,
      minChildSize: 0.15,
      maxChildSize: 0.95,

      snap: true,
      snapSizes: const [0.15, 0.95],

      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: LightAppColors.secondaryBackground,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),

          child: CustomScrollView(
            controller: scrollController,

            slivers: [

              // Heading
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    bottom: 20,
                  ),
                  child: Center(
                    child: Text(
                      'Your search items',
                      style: LightAppTheme.bodyBold,
                    ),
                  ),
                ),
              ),

              // Product grid
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),

                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final product = widget.searchedProducts[index];

                      return Productcontainer(
                        myproduct: product,
                      );
                    },
                    childCount: widget.searchedProducts.length,
                  ),

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.75,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
