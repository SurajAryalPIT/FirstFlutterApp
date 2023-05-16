import 'package:flutter/material.dart';
import 'package:supporttools/models/product.dart';

import '../controlers/post_controller.dart';
import '../models/get_project_response_model.dart';
import '../models/module_list_response.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  String productDropDownValue = "";
  String moduleListDropDownValue = "";
  List<Product> productList = [];
  List<Product> moduleList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadProductList();
  }

  void loadProductList() async {
    GetProjectResponseModel getProjectResponseModel =
        await PostController.getProjectListing();
    for (var i in getProjectResponseModel.productList) {
      Product p = Product(i.alias, int.parse(i.ukId));
      productList.add(p);
    }
    productDropDownValue = productList[0].name;
    loadModuleList();
    setState(() {});
  }

  void loadModuleList() async {
    GetModuleListByProductResponse getModuleListByProject =
        await PostController.getModuleListing(
            findIdFromProject(productDropDownValue));
    for (var i in getModuleListByProject.moduleList) {
      Product p = Product(i.alias, int.parse(i.ukId));
      moduleList.add(p);
    }
    moduleListDropDownValue = moduleList[0].name;
    setState(() {});
  }

  int findIdFromProject(String name) {
    for (var i in productList) {
      if (i.name == name) {
        return i.id;
      }
    }
    return 0;
  }
  //   void loadModuleList() async {
  //   GetModuleListByProject getModuleListByProject =
  //       await PostController.getModuleListing(int.parse(dropdownValue.(0)));
  //   for (var i in getProjectResponseModel.productList) {
  //     productList.add("${i.ukId} ${i.alias}");
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            productList.isNotEmpty
                ? DropdownButton<String>(
                    value: productDropDownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        moduleList = [];
                        productDropDownValue = value!;
                      });
                      loadModuleList();
                    },
                    items: productList
                        .map<DropdownMenuItem<String>>((Product value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(value.name),
                      );
                    }).toList(),
                  )
                : Text("Loading..."),
            // Module List
            moduleList.isNotEmpty
                ? DropdownButton<String>(
                    value: moduleListDropDownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        moduleListDropDownValue = value!;
                      });
                    },
                    items: moduleList
                        .map<DropdownMenuItem<String>>((Product value) {
                      return DropdownMenuItem<String>(
                        value: value.name,
                        child: Text(value.name),
                      );
                    }).toList(),
                  )
                : Text("Loading..."),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Project Selector"),
            )
          ],
        ),
      ),
    );
  }
}
