import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  final String imageurl, name, price, description;

  OrderPage(
      {required Key key,
        required this.imageurl,
        required this.name,
        required this.price,
        required this.description})
      : super(key: key);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {

  int quantity = 1; // Initialize the quantity to 1

  void _incrementQuantity() {
    setState(() {
      quantity++; // Increase the quantity
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--; // Decrease the quantity, but ensure it's not less than 1
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    TextEditingController NumberController=new TextEditingController();

    double priceWithoutSymbol = double.parse(widget.price.replaceAll('\$', '')); // Remove '$' and parse as double
    double totalPrice = priceWithoutSymbol * quantity;

    return Scaffold(
      appBar: AppBar(
        title: Text('Order Page'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              height: 200,
              width: 150,
              child: Image.network(widget.imageurl),
              alignment: Alignment.center,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(widget.name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.left),
                  SizedBox(height: 5,),
                  Text('Price: \$${widget.price}', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left),
                  SizedBox(height: 5,),
                  Padding(padding: EdgeInsets.all(10),
                      child: Text(widget.description)),
                ],
              ),
            ),
            // Text("Gallery",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //     textAlign: TextAlign.left),
            // Container(
            //   height: 100,
            //   width: 100,
            //   child: Image.network(widget.imageurl),
            // ),

            Text("Quantity",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  color: Colors.redAccent,
                  onPressed: _decrementQuantity,
                ),
                Text(
                  '$quantity',
                  style: TextStyle(fontSize: 20),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  color: Colors.green,
                  onPressed: _incrementQuantity,
                ),
              ],
            ),
            Text("Total Price: \$${totalPrice.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right),

            //===== phone number start ======//
            SizedBox(height: 10,),
            Container(
              width: 300,
              child: TextFormField(
                controller: NumberController,
                decoration: InputDecoration(
                  // border: InputBorder.none,
                  hintText: 'Enter Phone Number',
                  filled: true,
                  fillColor: Colors.pink[300],
                  contentPadding: const EdgeInsets.only(
                      left: 14.0, bottom: 6.0, top: 8.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ),

            //===== phone number end ==== //
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // _showDialog(context, totalPrice);
          // final firestore = FirebaseFirestore.instance;
          // final documentReference = firestore.collection('texts').doc();
          // documentReference.set({'text': "Your Total Price : \$${totalPrice.toStringAsFixed(2)}"});

          Map<String,dynamic>data={"Order":"Your Total Price : \$${totalPrice.toStringAsFixed(2)}","Number":NumberController.text};
          FirebaseFirestore.instance.collection("test").add(data);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Order Successfully !!'),
            ),
          );
        },
        label: Text("Order Confirm"),
        icon: Icon(Icons.card_travel),
      ),
    );
  }

// void _showDialog(BuildContext context, double totalPrice) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text(widget.name),
//         content: Text("Your Total Price : \$${totalPrice.toStringAsFixed(2)}"),
//         actions: <Widget>[
//           TextButton(
//             child: Text("Cancel"),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }
}
