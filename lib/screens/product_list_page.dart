import 'package:advance_pro/custom_widgets/product_preview.dart';
import 'package:advance_pro/functions/custom_size.dart';
import 'package:advance_pro/models/product_model.dart';
import 'package:advance_pro/providers/product_provider.dart';
import 'package:advance_pro/screens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  int _count = 0;
  bool _productFetchLoading = false;
  final TextEditingController _searchController = TextEditingController();
  int _selectedFilterOption = 0;
  List<Payload> _productList = [];
  List<Payload> _inStockProductList = [];
  List<Payload> _outOfStockProductList = [];
  List<Payload> _viewProductList = [];
  List<Payload> _searchProductList = [];

  void _customInit(ProductProvider productProvider) async {
    _count++;
    setState(() => _productFetchLoading = true);
    await productProvider.getAllProducts().then((value) {
      _productList = productProvider.allProductList;
      _viewProductList = _productList;
    });
    setState(() => _productFetchLoading = false);
  }

  void onSearch(String item) {
    setState(() {
      _searchProductList = _productList
          .where((element) => (element.name!
          .toLowerCase()
          .contains(item.toLowerCase())))
          .toList();
    });
    _viewProductList = _searchProductList;

  }

  @override
  Widget build(BuildContext context) {
    final ProductProvider productProvider =
        Provider.of<ProductProvider>(context);
    if (_count == 0) _customInit(productProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            'Products',
            style: TextStyle(
                color: Colors.black,
                fontSize: customSize(context, .05),
                fontWeight: FontWeight.w500),
          ),
        ),
        body: _bodyUI(productProvider),
      ),
    );
  }

  /// body
  Widget _bodyUI(ProductProvider productProvider) => SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(customSize(context, .04)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// search bar
              Row(
                children: [
                  _customSearchField(),
                  SizedBox(width: customSize(context, .02),),
                  ElevatedButton(onPressed: (){
                    onSearch(_searchController.text);
                  }, child: Text(
                    'Search',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: customSize(context, .04)),
                  ))
                ],
              ),
              SizedBox(
                height: customSize(context, .04),
              ),

              /// filter options
              SizedBox(
                height: customSize(context, .1),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedFilterOption = index;
                          });
                          if(_selectedFilterOption == 0){
                            setState(() {
                              _productFetchLoading = true;
                              _viewProductList = _productList;
                              _productFetchLoading = false;
                            });
                            print("in stock length = ${_viewProductList.length}");
                          }
                          if(_selectedFilterOption == 1){
                            setState(() {
                              _productFetchLoading = true;
                              _inStockProductList = _productList.where((product) => product.availableQuantity! > 0.0).toList();
                              _viewProductList = _inStockProductList;
                              _productFetchLoading = false;
                            });
                            print("in stock length = ${_viewProductList.length}");
                          }
                          if(_selectedFilterOption == 2){
                            setState(() {
                              _productFetchLoading = true;
                              _outOfStockProductList = _productList.where((product) => product.availableQuantity! <= 0.0).toList();
                              _viewProductList = _outOfStockProductList;
                              _productFetchLoading = false;
                            });
                            print("out stock length = ${_viewProductList.length}");
                          }
                        },
                        child: _customFilterOptions(
                            _selectedFilterOption == index
                                ? Colors.blue
                                : Colors.grey.shade400,
                            index == 0
                                ? 'All'
                                : index == 1
                                    ? 'In Stock'
                                    : 'Out of Stock',
                            _selectedFilterOption == index
                                ? Colors.white
                                : Colors.black));
                  },
                ),
              ),
              SizedBox(
                height: customSize(context, .04),
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: .5,
                height: 2,
              ),
              SizedBox(
                height: customSize(context, .04),
              ),

              /// product list
              _productFetchLoading? Padding(
                padding: EdgeInsets.symmetric(
                    vertical: customSize(context, .4)),
                child: const Center(
                    child: CupertinoActivityIndicator()
                ),
              ) : _viewProductList.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: customSize(context, .4)),
                      child: Center(
                          child: Text(
                        'No product available!',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: customSize(context, .05)),
                      )),
                    )
                  : ListView.builder(
                      itemCount: _viewProductList.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        int availableQuantity = _viewProductList[index]
                            .availableQuantity!.toInt();
                        return InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(payload: _viewProductList[index])));
                          },
                          child: ProductPreview(
                              imageUrl: _viewProductList[index].imageUrl!,
                              name: _viewProductList[index].name!,
                              sku: _viewProductList[index].sku!,
                              upc: _viewProductList[index].upc!,
                              availableQuantity: availableQuantity.toString()),
                        );
                      },
                    ),
            ],
          ),
        ),
      );

  /// search field
  Widget _customSearchField() => Expanded(
    child: TextFormField(
      controller: _searchController,
          autofocus: false,
          cursorColor: Colors.black,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.blue,
            ),
            contentPadding: EdgeInsets.symmetric(
                horizontal: customSize(context, .03),
                vertical: customSize(context, .005)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(customSize(context, .07)),
                borderSide: const BorderSide(color: Colors.blue, width: 2)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(customSize(context, .07)),
                borderSide: const BorderSide(color: Colors.blue, width: 2)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(customSize(context, .07)),
                borderSide: const BorderSide(color: Colors.blue, width: 2)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(customSize(context, .07)),
                borderSide: const BorderSide(color: Colors.blue, width: 2)),
          ),
        ),
  );

  /// custom filter options
  Widget _customFilterOptions(Color bgColor, String title, Color textColor) =>
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: customSize(context, .05),
            vertical: customSize(context, .01)),
        margin: EdgeInsets.only(right: customSize(context, .04)),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(customSize(context, .05)),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: customSize(context, .04),
          ),
        ),
      );
}
