import 'package:advance_pro/functions/custom_size.dart';
import 'package:advance_pro/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  Payload payload;

  ProductDetails({Key? key, required this.payload}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int _availableQuantity = 0;


  @override
  Widget build(BuildContext context) {
    _availableQuantity = widget.payload
        .availableQuantity!.toInt();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Product Details',
            style: TextStyle(
                color: Colors.black,
                fontSize: customSize(context, .05),
                fontWeight: FontWeight.w500),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        body: _bodyUI(),
      ),
    );
  }

  /// body
  Widget _bodyUI() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// image
          Container(
            margin: EdgeInsets.symmetric(vertical: customSize(context, .04)),
            width: customSize(context, 1),
            height: customSize(context, .6),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              border: Border.all(
                color: Colors.grey,
                width: .05,
              ),
            ),
            child: widget.payload.imageUrl == ''
                ?  Center(
                    child: Text(
                    'No image',
                    style: TextStyle(color: Colors.black, fontSize: customSize(context, .05)),
                  ))
                : ClipRRect(
                    borderRadius:
                        BorderRadius.circular(customSize(context, .015)),
                    child: CachedNetworkImage(
                      imageUrl: widget.payload.imageUrl!,
                      placeholder: (context, url) =>
                          const Center(child: CupertinoActivityIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          SizedBox(height: customSize(context, .04),),

          /// name
          Container(
            width: customSize(context, 1),
            padding: EdgeInsets.symmetric(horizontal: customSize(context, .05)),
            child: Text(
              widget.payload.name!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: customSize(context, .05),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: customSize(context, .03),),

          /// sku
          Padding(
            padding: EdgeInsets.symmetric(horizontal: customSize(context, .05)),
            child: Row(
              children: [
                Text(
                  'SKU:',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: customSize(context, .04),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: customSize(context, .04),
                ),
                SizedBox(height: customSize(context, .05),),
                Text(
                  widget.payload.sku!,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: customSize(context, .04),
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: customSize(context, .03),),

          /// upc
          Padding(
            padding: EdgeInsets.symmetric(horizontal: customSize(context, .05)),
            child: Row(
              children: [
                Text(
                  'UPC:',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: customSize(context, .04),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: customSize(context, .04),
                ),
                SizedBox(height: customSize(context, .05),),
                Text(
                  widget.payload.sku!,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: customSize(context, .04),
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: customSize(context, .03),),

          /// available
          Padding(
            padding: EdgeInsets.symmetric(horizontal: customSize(context, .05)),
            child: Row(
              children: [
                Text(
                  'Available:',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: customSize(context, .04),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: customSize(context, .04),
                ),
                SizedBox(height: customSize(context, .05),),
                Text(
                  _availableQuantity.toString(),
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: customSize(context, .04),
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: customSize(context, .03),),

          /// description
          Padding(
            padding: EdgeInsets.symmetric(horizontal: customSize(context, .05)),
            child: Row(
              children: [
                Text(
                  'Description:',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: customSize(context, .04),
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  width: customSize(context, .04),
                ),
                SizedBox(height: customSize(context, .05),),
                Text(
                  widget.payload.description!,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: customSize(context, .04),
                      fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ),
          SizedBox(height: customSize(context, .04),),
          Container(
            width: customSize(context, 1),
            height: customSize(context, .06),
            color: Colors.grey.shade200,
          ),
          SizedBox(height: customSize(context, .04),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: customSize(context, .05)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Inventory',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: customSize(context, .07),
                      fontWeight: FontWeight.w500),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.add_circle), color: Colors.blue,)
              ],
            ),
          ),
        ],
      );
}
