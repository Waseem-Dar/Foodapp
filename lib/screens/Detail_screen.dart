
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tasty_food/screens/your_details_screen.dart';

class DetailScreen extends StatefulWidget {
  final String image;
  final String name;
  const DetailScreen({super.key, required this.image, required this.name});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double price = 599.00;
  bool fav =false;
   double rate = 4.0;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35,horizontal: 15),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Navigator.pop(context);
              },
                child: const Icon(Icons.arrow_back,color: Colors.orange,)),
            const SizedBox(height: 10,),
            const Text("Arizona Biltmore Restaurant",style: TextStyle(color: Colors.orange,fontSize: 40,fontWeight: FontWeight.bold),),
            const Text("Arizona best service & fast delivery",style: TextStyle(fontSize: 17),),
            const SizedBox(height: 5,),
            Row(
              children: [
                RatingBar.builder(
                  itemSize: 23,
                  initialRating: 4,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(right: 5),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      rate = rating ;
                    });
                  },
                ),
                Text("($rate k reviews)")
              ],
            ),
            const SizedBox(height: 10,),
             const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Delivery",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("Free",style: TextStyle(fontSize: 17),),
                  ],
                ),
                Column(
                  children: [
                    Text("Open Time",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text("11:00 AM",style: TextStyle(fontSize: 17),),
                  ],
                ),
                SizedBox(),
              ],
            ),
            const SizedBox(height: 10,),
            const Divider(
               height: 16,
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey,width: 2)
                      ),
                      child: const Icon(Icons.share_sharp),
                    ),
                    const SizedBox(width: 10,),
                    InkWell(
                      radius: 20,
                      onTap: (){
                        setState(() {
                          fav =!fav;
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey,width: 2)
                        ),
                        child:  Icon(fav?Icons.star:Icons.star_border),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey,width: 2)
                      ),
                      child: const Icon(Icons.location_on_sharp),
                    ),

                  ],
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: const BorderSide(color: Colors.orange,width: 2)),
                  onPressed: (){},
                  child: const Text("Contact",style: TextStyle(color: Colors.orange,fontSize: 19),),
                )
              ],
            ),
            const Divider(
              height: 16,
              thickness: 1,
            ),
            const Text("FAMOUS ITEM",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
            const SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .25,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(widget.image),fit: BoxFit.cover)
              ),
            ),
            const SizedBox(height: 10,),
             Text(widget.name,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
             Text("Rs : $price",style: const TextStyle(fontSize: 17),) ,
             const SizedBox(height: 20,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   YourDetails(selectedLocation: "Location", price: price,latLng: LatLng(1232, 1231), ),))
;              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(color: Colors.orange,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text("Order",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
