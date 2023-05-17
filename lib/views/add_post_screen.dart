import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:supporttools/config.dart';
import 'package:supporttools/models/post_request_model.dart';
import 'package:supporttools/models/product.dart';
import 'package:supporttools/utils/utils.dart';

import '../controlers/post_controller.dart';
import '../models/get_project_response_model.dart';
import '../models/module_list_response.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  TextEditingController cEnquiryFrom = TextEditingController();
  TextEditingController cSeverity = TextEditingController();
  TextEditingController cSummary = TextEditingController();
  TextEditingController cDescription = TextEditingController();

  Map<String, int> assignTOMap = {
    "Support": 1,
    "Maintainance": 2,
    "Development": 3
  };

  String productDropDownValue = "";
  String assignToDropDownValue = "Support";
  String moduleListDropDownValue = "";

  String priority = "Normal";
  List<Product> productList = [];
  List<Product> moduleList = [];
  bool reportStayisChecked = true;
  String fileLOcation = "";

  void selectFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        fileLOcation = files[0].path;
      });
    } else {
      // User canceled the picker
    }
  }

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

  int findIDFromModule(String name) {
    for (var i in moduleList) {
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Product List
              Row(
                children: [
                  Text(
                    "Select Product: ",
                    style: TextStyle(fontSize: 15),
                  ),
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
                ],
              ),
              // Module List

              Row(
                children: [
                  Text(
                    "Select Module: ",
                    style: TextStyle(fontSize: 15),
                  ),
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
                ],
              ),

              TextFormField(
                controller: cEnquiryFrom,
                decoration: InputDecoration(hintText: "Enquiry Form"),
              ),
              TextFormField(
                controller: cSeverity,
                decoration: InputDecoration(hintText: "Severity"),
              ),
              // high low
              Row(
                children: [
                  const Text(
                    "Select Priority: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  DropdownButton<String>(
                    value: priority,
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
                        priority = value!;
                      });
                    },
                    items: ["Normal", "High", "Low"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),

              Row(
                children: [
                  const Text(
                    "Report Stay: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  CheckboxMenuButton(
                      value: reportStayisChecked,
                      onChanged: (val) {
                        setState(() {
                          reportStayisChecked = !reportStayisChecked;
                        });
                      },
                      child: Text("Report Stay"))
                ],
              ),

              TextFormField(
                controller: cSummary,
                decoration: InputDecoration(hintText: "Summary"),
              ),
              TextFormField(
                maxLines: 3,
                controller: cDescription,
                decoration: InputDecoration(hintText: "Description"),
              ),
              Row(
                children: [
                  const Text(
                    "Assign To: ",
                    style: TextStyle(fontSize: 15),
                  ),
                  DropdownButton<String>(
                    value: assignToDropDownValue,
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
                        assignToDropDownValue = value!;
                      });
                    },
                    items: assignTOMap.keys
                        .toList()
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),

              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          hintText: fileLOcation.isEmpty
                              ? "No File Choosen"
                              : fileLOcation),
                    ),
                  ),
                  Expanded(
                    child: MaterialButton(
                      onPressed: () {
                        selectFile();
                      },
                      child: Text("Choose FIle"),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),

              MaterialButton(
                height: 50,
                minWidth: 100,
                color: Colors.blue,
                onPressed: () async {
                  int productID = findIdFromProject(productDropDownValue);
                  int moduleID = findIDFromModule(moduleListDropDownValue);
                  int? assgnNo = assignTOMap[assignToDropDownValue];
                  PostRequestModel postRequestModel = PostRequestModel(
                      tokenNo: APPConfig.TOKEN_NO,
                      projectCategory: productID.toString(),
                      projectSubModule: moduleID.toString(),
                      enquiryFrom: cEnquiryFrom.text,
                      severity: cSeverity.text,
                      priority: priority,
                      reportStay: reportStayisChecked.toString(),
                      summary: cSummary.text,
                      description: cDescription.text,
                      uploadFile: fileLOcation,
                      viewStatus: 1,
                      assignTo: assgnNo.toString());
                  PostController pc = PostController();
                  pc.addPost(postRequestModel);
                },
                child: Text(
                  "Save",
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
