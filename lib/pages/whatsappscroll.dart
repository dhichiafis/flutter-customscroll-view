//THIS PAGE WE ARE BUILDING A SLIVERcUSTOM SCROLL
//The major features is that the searched product appears on a bottomscrollable sheet at the bottom of the page

import 'package:flutter/material.dart';
import 'package:mysliver/data/appcolor.dart';
import 'package:mysliver/data/apptextstyle.dart';
import 'package:mysliver/data/data.dart';
import 'package:mysliver/pages/filterpage.dart';
import 'package:mysliver/widgets/productcontainer.dart';
import 'package:mysliver/widgets/reusabledraggablebottomsheet.dart';
class WhatsappScroll extends StatefulWidget {
  const WhatsappScroll({super.key});

  @override
  State<WhatsappScroll> createState() => _WhatsappScrollState();
}

class _WhatsappScrollState extends State<WhatsappScroll> {
  String searchText='';

  List<Product>searchedProducts=[];
  List<Product> filteredProducts=[];
  final List<Product> products=[
    Product(id: 1, quantity: 12, title: 'tiger', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 2, quantity: 12, title: 'Lizard', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 3, quantity: 12, title: 'zebra', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 4, quantity: 12, title: 'cheetah', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
//    Product(id: 5, quantity: 12, title: 'Leopard', description: "this is  a solu tiger", price: 23444, image: ''),
    Product(id: 6, quantity: 12, title: 'hyena', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1608543104100-c24c77541d16?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 7, quantity: 12, title: 'chameleon', description: "this is  a solu tiger", price: 23444, image: 'https://plus.unsplash.com/premium_photo-1722827117771-51f0f24a9a1f?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
    Product(id: 1, quantity: 12, title: 'tiger', description: "this is  a solu tiger", price: 23444, image: 'https://images.unsplash.com/photo-1615963244664-5b845b2025ee?w=400&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
  ];
  void searchItemsByTitle(String text) {
  setState(() {
    searchText = text;

    if (text.trim().isEmpty) {
      searchedProducts = [];
    } else {
      searchedProducts = products.where((product) {
        return product.title
            .toLowerCase()
            .contains(text.trim().toLowerCase());
      }).toList();
    }
  });
}

  @override
  void initState(){
    super.initState();
    getAllProducts();
  }
  void getAllProducts(){
    setState(() {
      filteredProducts=products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightAppColors.backgroundColor,
      body: SafeArea(
        child: Stack(          
          children: [
            //this custom scroll view displays our products 
            CustomScrollView(
            controller: ScrollController(),
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Container(
                  height: 50,
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: LightAppColors.secondaryBackground
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.search,size:30,color: LightAppColors.primaryText,)),
                        Expanded(
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              //icon: Icon(Icons.search,size: 30,color: LightAppColors.primaryText,),
                              hintText: 'Search your product',
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none
                              )
                            ),
                            onChanged: (String value){
                              searchItemsByTitle(value);
                            },
                          ),
                        ),
                        IconButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return FilterPage();
                          }));
                        }, icon: Icon(Icons.tune,size: 30,color: LightAppColors.primaryText,))
                      ],
                    ),
                  ),
                ),
                
          
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 100,
                  color: Colors.amber,
          
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                  child: Text('All Products',style: LightAppTheme.bodyBold,),
                  ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: 8,),
              ),
              //sliverpadding needs two parameter
              //padding is the space between the scroll and teh child widget
              //the widget itself
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverGrid.builder(
                  itemCount: filteredProducts.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                   crossAxisSpacing: 10,
                    childAspectRatio: 0.75
                    ), 
                  itemBuilder: (context,int index){
                    return Productcontainer(myproduct:filteredProducts[index] ,);
                  }),
              )
              //)
            ],
            scrollDirection: Axis.vertical,
          ),
          if(searchText.trim().isNotEmpty)
            ReusableDraggableBottomSheet(searchedProducts: searchedProducts,)
          
  
          ]
        ),
      ),
    );
  }

  //Widget
}


class TextWidget extends StatelessWidget {
  const TextWidget({super.key,
  required this.text
  });
  final WassapText text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(text.headerText,style: LightAppTheme.bodyRegularBold,),
        Text(text.bodyText,style: LightAppTheme.bodySmall,)
       , Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(text.created_at.toString(),style: LightAppTheme.bodySmall,)
        ],
       )
      ],
    );
  }
}