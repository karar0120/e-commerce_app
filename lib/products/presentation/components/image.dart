
// ignore_for_file: must_be_immutable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../../core/style/color_consts.dart';
import '../../../core/style/image_consts.dart';
import '../../../core/style/sizes_consts.dart';
import '../../../core/style/string_consts.dart';
import '../../../core/style/text_style_consts.dart';


class ImagePickerController extends ChangeNotifier {

  XFile? _imagePicked;

  XFile? get imagePicked => _imagePicked;
  void showPicker(context,{required bool visibility,required String name}) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      showModalBottomSheet(
          context: context,
          builder: (BuildContext context) {
            return SafeArea(
              child: Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))
                ),
                child: Wrap(
                  children: <Widget>[
                    ListTile(
                        leading: const Icon(Icons.photo_library, color: ColorConsts.blackColor,),
                        title:  Text(StringConsts.photoLibrary,
                            style: TextStyleConsts.textMedium),
                        onTap: () async {
                          await getImageFromGallery();
                          cameraFile = null;
                          notifyListeners();
                          Navigator.pop(context);
                        }),
                    ListTile(
                      leading: const Icon(Icons.photo_camera,color: ColorConsts.blackColor,),
                      title:   Text(StringConsts.camera,
                          style: TextStyleConsts.textMedium),
                      onTap: () async {
                        await getImage();
                        galleryFile = null;
                        notifyListeners();
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            );
          }
      );
    }
  }


  File? cameraFile;
  Future getImage() async {
    final myFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (myFile!=null){
      cameraFile = File(myFile.path);
      _imagePicked=myFile;
    }
    notifyListeners();
  }

  File? galleryFile;

  Future getImageFromGallery() async {
    final myFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myFile!=null){
      galleryFile = File(myFile.path);
      _imagePicked=myFile;
    }
    notifyListeners();
  }





}


class AddProductPhoto extends StatelessWidget {
  const AddProductPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePickerController = Provider.of<ImagePickerController>(context);
    return Center(
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: PaddingConsts.p20),
              child:
              imagePickerController.galleryFile != null
                  ? SizedBox(
                height: SizeConsts.s100,
                child: CircleAvatar(
                  minRadius: 40,
                  maxRadius: 60,
                  backgroundImage:
                  FileImage(imagePickerController.galleryFile!),
                  backgroundColor: ColorConsts.whiteColor,
                ),
              )
                  : imagePickerController.cameraFile != null
                  ? SizedBox(
                height: SizeConsts.s100,
                child: CircleAvatar(
                  minRadius: 40,
                  maxRadius: 60,
                  backgroundImage:
                  FileImage(imagePickerController.cameraFile!),
                  backgroundColor: ColorConsts.whiteColor,
                ),
              )
                  :
              SizedBox(
                height: SizeConsts.s100,
                child: CircleAvatar(
                  minRadius: 40,
                  maxRadius: 60,
                  backgroundColor: ColorConsts.whiteColor,
                  child: Image.asset(
                      ImageConsts.cameraImagePlaceHolderPng),
                ),
              )),
          Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () async {
                  imagePickerController.showPicker(context,
                      visibility: false, name: "Choose a picture");
                },
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: -10,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child:const Icon(Icons.add_a_photo_rounded)),
              ))
        ],
      ),
    );
  }
}



class EditProductPhoto extends StatelessWidget {
  String imagePath;
  EditProductPhoto({Key? key,required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imagePickerController = Provider.of<ImagePickerController>(context);
    return Center(
      child: Stack(
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: PaddingConsts.p20),
              child:
              imagePickerController.galleryFile != null
                  ? SizedBox(
                height: SizeConsts.s100,
                child: CircleAvatar(
                  minRadius: 40,
                  maxRadius: 60,
                  backgroundImage:
                  FileImage(imagePickerController.galleryFile!),
                  backgroundColor: ColorConsts.whiteColor,
                ),
              )
                  : imagePickerController.cameraFile != null
                  ? SizedBox(
                height: SizeConsts.s100,
                child: CircleAvatar(
                  minRadius: 40,
                  maxRadius: 60,
                  backgroundImage:
                  FileImage(imagePickerController.cameraFile!),
                  backgroundColor: ColorConsts.whiteColor,
                ),
              )
                  :
              SizedBox(
                height: SizeConsts.s100,
                child: CircleAvatar(
                  minRadius: 40,
                  maxRadius: 60,
                  backgroundColor: ColorConsts.whiteColor,
                  child: Image.network(imagePath),
                ),
              )),
          Positioned(
              right: 0,
              bottom: 0,
              child: InkWell(
                onTap: () async {
                  imagePickerController.showPicker(context,
                      visibility: false, name: "Choose a picture");
                },
                child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: -10,
                          blurRadius: 10,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child:const Icon(Icons.add_a_photo_rounded)),
              ))
        ],
      ),
    );
  }
}
