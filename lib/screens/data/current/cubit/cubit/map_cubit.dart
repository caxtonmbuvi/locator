import 'package:flutter/services.dart';

import 'package:image/image.dart' as img;
import 'dart:ui' as ui;

import '../../../../../exports.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  // late Set<Marker> mapMarkers = Set();
  late GoogleMapController controller;
  late List<LatLng> coordinates;
  late List<CurrentLocationModel> data;

  void initMapController(
      GoogleMapController controller, List<CurrentLocationModel> data) {
    this.controller = controller;
    this.data = data;

    addMarkers();
  }

  // Future<BitmapDescriptor> _getMarkerBitmap(String url,
  //     {int width = 150}) async {
  //   // Fetch the image data from the network
  //   final response = await http.get(Uri.parse(url));
  //   final Uint8List imageData = response.bodyBytes;

  //   // Decode the image to an Image object
  //   img.Image? baseImage = img.decodeImage(imageData);
  //   if (baseImage == null) {
  //     throw Exception('Unable to decode image');
  //   }

  //   // Resize the image maintaining the aspect ratio
  //   int height = ((width / baseImage.width) * baseImage.height).round();
  //   img.Image resizedImage =
  //       img.copyResize(baseImage, width: width, height: height);

  //   // Load the marker pin image (assuming it's a local asset)
  //   ByteData data = await rootBundle.load('assets/marker_pin.png');
  //   var bytes = data.buffer.asUint8List();
  //   img.Image markerPin = img.decodeImage(bytes)!;

  //   // Resize the marker pin to fit the resized image
  //   // The height of the pin part of the marker should be considered here
  //   int pinPartHeight = 20; // Adjust this value as needed
  //   img.Image resizedMarkerPin =
  //       img.copyResize(markerPin, width: width, height: pinPartHeight);

  //   // Overlay the resized image onto the resized marker pin
  //   // The `dstY` value is set to the height of the pin part to position the image above the pin
  //   img.Image finalImage = img.copyInto(resizedMarkerPin, resizedImage,
  //       dstY: pinPartHeight, blend: false);

  //   // Encode the final image to a Uint8List
  //   Uint8List finalImageData = Uint8List.fromList(img.encodePng(finalImage));

  //   // Create a BitmapDescriptor from the final image
  //   return BitmapDescriptor.fromBytes(finalImageData);
  // }

  Future<BitmapDescriptor> _getMarkerBitmapFromAsset(String assetPath,
      {int width = 50}) async {
    // Load the image from the asset bundle
    final ByteData byteData = await rootBundle.load(assetPath);
    final Uint8List imageData = byteData.buffer.asUint8List();

    // Decode the image to an Image object
    img.Image? image = img.decodeImage(imageData);

    // Resize the image maintaining the aspect ratio
    int height = ((width / image!.width) * image.height).round();
    img.Image resizedImage =
        img.copyResize(image, width: width, height: height);

    // Convert the Image object to a Uint8List
    Uint8List resizedImageData =
        Uint8List.fromList(img.encodePng(resizedImage));

    // Create a BitmapDescriptor from the resized image
    return BitmapDescriptor.fromBytes(resizedImageData);
  }

  void addMarkers() async {
    final Set<Marker> markers_ = {};
    final List<dynamic> images = [
      Assets.images.business.path,
      Assets.images.birds.path,
      Assets.images.cakeShop.path
    ];

    for (final location in data) {
      final markerIcon = await _getMarkerBitmapFromAsset(images.first);
      final marker = Marker(
          markerId: MarkerId(location.avatar),
          position: LatLng(location.latlng.first, location.latlng.last),
          icon: markerIcon,
          infoWindow: InfoWindow());
      markers_.add(marker);
    }

    emit(Maploaded(controller, markers_));
  }
}
