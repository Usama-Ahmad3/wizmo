import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:wizmo/models/sell_car_model.dart';
import 'package:wizmo/res/colors/app_colors.dart';
import 'package:wizmo/res/common_widgets/button_widget.dart';
import 'package:wizmo/view/home_screens/sell_screen/sell_screen/map_screen/map_screen_provider.dart';

class MapScreen extends StatelessWidget {
 final TextEditingController location;
 final SellCarModel sellCarModel;
 const MapScreen({super.key, required this.location, required this.sellCarModel});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    var map = Provider.of<MapScreenProvider>(context, listen: false);
    map.getLocationPermission(location, sellCarModel);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Consumer<MapScreenProvider>(
                  builder: (context, value, child) => value.loading
                      ? const Center(child: CircularProgressIndicator())
                      : GoogleMap(
                          onMapCreated: (controller) {
                            value.mapController = controller;
                          },
                          liteModeEnabled: true,
                          onTap: (latLng) {
                            value.allMarkers.add(Marker(
                              markerId: const MarkerId('myMarker'),
                              draggable: false,
                              onTap: () {
                                debugPrint('marker');
                              },
                              position:
                                  LatLng(latLng.latitude, latLng.longitude),
                            ));
                          },
                          compassEnabled: true,
                          mapType: MapType.normal,
                          buildingsEnabled: true,
                          indoorViewEnabled: true,
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          initialCameraPosition: CameraPosition(
                              target: LatLng(value.lat, value.long),
                              zoom: 15.0),
                          markers: Set.from(value.allMarkers),
                          // markers: _markers.values.toSet(),
                        ),
                ),
                Positioned(
                  top: height * 0.04,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: height * 0.01),
                        child: Consumer<MapScreenProvider>(
                          builder: (context, value, child) => InkWell(
                              onTap: () {
                                value.pop(context);
                              },
                              child: Container(
                                  height: height * 0.04,
                                  width: width * 0.13,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                  ),
                                  child: Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: width * 0.02),
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ))),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: height * 0.2,
            width: width,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40), topLeft: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    height: 8,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.grey.shade300,
                      //color: Color(color),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Consumer<MapScreenProvider>(
                    builder: (context, value, child) {
                      return value.loading
                          ? const CircularProgressIndicator()
                          : Text(
                              location.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.black),
                            );
                    },
                  ),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  Consumer<MapScreenProvider>(
                    builder: (context, value, child) => ButtonWidget(
                        text: 'Continue',
                        onTap: () {
                          value.pop(context);
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
