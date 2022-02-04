import 'package:advance_pro/functions/custom_size.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPreview extends StatelessWidget {
  String imageUrl;
  String name;
  String sku;
  String upc;
  String availableQuantity;

  ProductPreview(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.sku,
      required this.upc,
      required this.availableQuantity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ///image
          Container(
            margin: EdgeInsets.symmetric(vertical: customSize(context, .04)),
            width: customSize(context, .3),
            height: customSize(context, .3),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(customSize(context, .015))),
            child: imageUrl == ''
                ? const Center(
                    child: Text(
                    'No image',
                    style: TextStyle(color: Colors.grey),
                  ))
                : ClipRRect(
                    borderRadius:
                        BorderRadius.circular(customSize(context, .015)),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      placeholder: (context, url) =>
                          const Center(child: CupertinoActivityIndicator()),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          SizedBox(
            width: customSize(context, .03),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// name
              SizedBox(
                width: customSize(context, .5),
                child: Text(
                  name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: customSize(context, .05),
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: customSize(context, .03),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'SKU',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: customSize(context, .04),
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: customSize(context, .04),
                  ),

                  /// sku
                  Text(
                    sku,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: customSize(context, .04),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              upc != ''
                  ? SizedBox(
                      height: customSize(context, .03),
                    )
                  : const SizedBox(),

              /// upc
              upc != ''? Text(
                upc,
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: customSize(context, .04),
                    fontWeight: FontWeight.normal),
              ): const SizedBox(),
              SizedBox(
                height: customSize(context, .03),
              ),
              Row(
                children: [
                  Text(
                    'Available',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: customSize(context, .04),
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    width: customSize(context, .04),
                  ),

                  /// availability
                  Text(
                    availableQuantity,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: customSize(context, .04),
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
