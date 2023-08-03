import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:tasty_food/screens/map_screen.dart';

class YourDetails extends StatefulWidget {
 final String selectedLocation;
 final  double price;
 final LatLng latLng;

  const YourDetails({super.key, required this.selectedLocation, required this.price, required this.latLng, });

  @override
  State<YourDetails> createState() => _YourDetailsState();
}
TextEditingController nameController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController addressController = TextEditingController();
class _YourDetailsState extends State<YourDetails> {
  void saveInfo()async{
    String name = nameController .text.trim();
    String phone = phoneController .text.trim();
    String address = addressController .text.trim();
    String location = widget.selectedLocation.toString();
     var date = DateTime.now();
    Map<String,dynamic> info = {
      "name" : name,
      "phone" : phone,
      "address" : address,
      "location" : location,
      "latLng" : widget.latLng.toString(),
      "time" : date,
    };
     try{
       FirebaseFirestore.instance.collection("order").add(info);
     }catch(e){
       log(e.toString());
     }

  }
   int total= 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
       foregroundColor: Colors.white,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text("Your Details",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: nameController,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                labelText: "Name",
                labelStyle: TextStyle(color: Colors.black),
               focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
              ),
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
              ),
            ),
            TextFormField(

              controller: addressController,
              cursorColor: Colors.grey,
              decoration: const InputDecoration(
                  labelText: "Address",
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange)),
              ),
            ),
            // const SizedBox(height: 15,),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MapScreen(price: widget.price),));
              },
              title: const Row(
                children: [
                  Icon(Icons.add,color: Colors.orange,),
                  Text("Add location",style:TextStyle(color: Colors.orange,fontSize: 19),),
                ],
              ),
              subtitle: Text(widget.selectedLocation,style: const TextStyle(fontSize: 17),maxLines: 2,),
              trailing: const Icon(Icons.arrow_forward_ios_rounded,color: Colors.orange,),

            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price  ${widget.price}",style: const TextStyle(fontSize: 17),),
                Container(
                  width: 140,
                  height: 60,
                  decoration: BoxDecoration(
                    color:  Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          color:Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          minWidth: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          onPressed: (){
                            setState(() {
                              if(total<=1){
                                total = 1;
                              }else{
                                total = total-1;
                              }
                            });
                          },
                          child: const Icon(FontAwesomeIcons.minus,color: Colors.orange,),
                        ),
                        Text('$total' ,style:  const TextStyle(color:  Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                        MaterialButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          minWidth: 0,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          onPressed: (){
                            setState(() {
                              total = total+1;
                            });
                          },
                          child:  const Icon(Icons.add,color:  Colors.orange),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
             SizedBox(height: MediaQuery.of(context).size.height* 0.15,),
            SizedBox(
              height: MediaQuery.of(context).size.height* 0.28,
              child: Card(

                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Total price",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text((total*widget.price).toString()),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tax",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text("00.00"),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text("free"),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Delivery time",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                          Text("50 min"),
                        ],
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.orange),

                          ),
                            onPressed: (){
                            saveInfo();
                            }, child: const Text("Submit",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)),
                      )
                    ],
                  ),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }

}
