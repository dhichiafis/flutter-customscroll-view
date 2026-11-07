import 'package:flutter/material.dart';

class MyScrollablePage extends StatefulWidget {
  const MyScrollablePage({super.key});

  @override
  State<MyScrollablePage> createState() => _MyScrollablePageState();
}

class _MyScrollablePageState extends State<MyScrollablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        
        padding: EdgeInsets.only(left: 20,right: 20),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 250,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('center scrollview'),
                centerTitle: true,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 200,
                color: Colors.tealAccent,
                child: Text('This is a container'),
              ),
            ),
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (BuildContext context,int index){
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100*(index%9)],
                  child: Text('Grid items ${index}'),
                );
              }), 
              gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(
                //crossAxisCount: 2,
                maxCrossAxisExtent: 200,
                childAspectRatio: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
                ) ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.amberAccent,
                height: 100,
                child: Text('THis is amber accent'),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 100,
                child: Column(
                  children: [
                    Text('there is something'),
                    SizedBox(height: 8,),
                    Expanded(
                      child: ListView.builder(
                                        itemCount: 10,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder: (context,int index){
                      return SizedBox(
                        width: 100,
                        child: Card(
                          color: Colors.cyan[100*(index%9)],
                          child: Text('Item ${index}'),
                        ),
                      );
                                        }),
                    ),
                  ],
                )
              ),
            )
          ],
          controller: ScrollController(),
        ),
        )
    );
  }
}