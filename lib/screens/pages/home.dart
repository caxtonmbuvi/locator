import 'dart:async';

import '../../../../exports.dart';
import '../../base/globals/global.dart' as globals;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Marker> markers = [];
  final Completer<GoogleMapController> controller = Completer();

  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<CurrentLocationCubit>();
    locationCubit.getCurrentLocations();

    return SafeArea(
      bottom: false,
      child: BlocConsumer<CurrentLocationCubit, CurrentLocationState>(
          listener: (context, state) {
            if (state is CurrentLocationFailure) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is CurrentLocationInitial) {
              return Center(
                child: AppText.large("No New Data"),
              );
            } else if (state is CurrentLocationLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CurrentLocationLoaded) {
              // addMarkers(state.data);
    
              return buildData(state.data, markers);
            } else {
              return Center(
                child: AppText.large("No New Data"),
              );
            }
          },
        ),
    );
  }
}

Widget buidMap(List<CurrentLocationModel> data) {
  return BlocConsumer<MapCubit, MapState>(
      builder: (context, state) {
        Set<Marker> markers = {};
        if (state is Maploaded) {
          markers = state.markers;
        }
        return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(data.first.latlng.first, data.first.latlng.last),
              zoom: 10.5,
            ),
            mapType: MapType.normal,
            myLocationButtonEnabled: false,
            markers: markers,
            zoomControlsEnabled: false,
            onMapCreated: (mapController) {
              context.read<MapCubit>().initMapController(mapController, data);
            },
            gestureRecognizers: Set()
              ..add(
                  Factory<PanGestureRecognizer>(() => PanGestureRecognizer())));
      },
      listener: (context, state) {});
}

Set<String> setCategories(List<CurrentLocationModel> data) {
  Set<String> options = {};
  for (var info in data) {
    options.add(info.category);
  }

  return options;
}

// getAddress(double lat, double long) async {
//   String currentLocation = "";
//   List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
//   Placemark place = placemarks.first;

//   String? subLocality = place.subLocality ?? place.locality;
//   String? country = place.country;
//   if (subLocality != null && country != null) {
//     currentLocation = subLocality;
//   } else {
//     currentLocation = "Location info not available";
//   }

//   return currentLocation;
// }

Widget buildData(List<CurrentLocationModel> data, List<Marker> markers) {
  Set<String> allOptions = setCategories(data);

  return Stack(
    children: [
      buidMap(data),
      Positioned(
        top: 20.h,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          width: ScreenUtil().screenWidth,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FaIcon(
                      FontAwesomeIcons.magnifyingGlass,
                      size: 20.sp,
                      color: ColorName.darkGrey,
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 2,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80),
                  //set border radius more than 50% of height and width to make circle
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.settings_outlined,
                      size: 20.sp,
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
          bottom: 90.h,
          left: 15.w,
          right: 15.w,
          child: SizedBox(
            width: ScreenUtil().screenWidth,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(80.r)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.r),
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                                color: Colors.lightGreenAccent,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5.r),
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  size: 20.sp,
                                  color: ColorName.darkGrey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: AppText.medium(
                              "Add new tag",
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(80.r)),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8.r),
                            margin: EdgeInsets.all(5.r),
                            decoration: BoxDecoration(
                                color: Colors.lightGreenAccent,
                                borderRadius: BorderRadius.circular(20.r)),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(5.r),
                                child: FaIcon(
                                  FontAwesomeIcons.plus,
                                  size: 20.sp,
                                  color: ColorName.darkGrey,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 20.w),
                            child: AppText.medium(
                              "Add new item",
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Center(
                  child: CustomPaint(
                    size: Size(ScreenUtil().screenWidth,
                        200), // You can change this to your desired size
                    painter: CurvedSideContainerPainter(
                        color: Colors.lightGreenAccent,
                        topCurve: 0.15,
                        bottomCurve: 0.85),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 20.h, horizontal: 15.w),
                      width: ScreenUtil().screenWidth - 20.w,
                      height: 190,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10.w),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 5.h),
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(20.r)),
                                child: Center(
                                  child: AppText.medium("All"),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: allOptions.map((option) {
                                  return GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.w, vertical: 5.h),
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          borderRadius:
                                              BorderRadius.circular(20.r)),
                                      child: Center(
                                        child: AppText.medium(option),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              Container(
                                padding: EdgeInsets.all(8.r),
                                margin: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                    color: Colors.lightGreenAccent,
                                    borderRadius: BorderRadius.circular(20.r),
                                    border: Border.all(color: Colors.grey)),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.ellipsis,
                                    size: 20.sp,
                                    color: ColorName.darkGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                              height: 130.h,
                              child: ListView.builder(
                                  itemCount: data.length,
                                  itemBuilder: (BuildContext context, index) {
                                    var info = data[index];

                                    return GestureDetector(
                                      onTap: () {
                                        // globals.itemId = info.id;
                                        globals.selected =
                                            SelectedLocationModel(
                                                id: info.id,
                                                createdAt: info.createdAt,
                                                name: info.name,
                                                avatar: info.avatar,
                                                locationName: info.locationName,
                                                latlng: info.latlng,
                                                category: info.category);
                                        if (globals.selected == null ||
                                            globals.selected!.id.isEmpty) {
                                        } else {
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                            builder: (context) =>
                                                BlocProvider<HistoryCubit>(
                                              create: (context) => HistoryCubit(
                                                  LocationRepository()),
                                              child: const HistoryScreen(),
                                            ),
                                          ));
                                        }
                                      },
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                SizedBox(
                                                  width: 50.w,
                                                  height: 55.h,
                                                  child: ClipOval(
                                                    child: SizedBox.fromSize(
                                                      size:
                                                          const Size.fromRadius(
                                                              30),
                                                      child: Image.network(
                                                        info.avatar,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 8.w),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      AppText.large(
                                                        info.name,
                                                        fontSize: 16,
                                                      ),
                                                      AppText.small(
                                                        info.locationName,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(8.r),
                                                  margin: EdgeInsets.all(5.r),
                                                  decoration: BoxDecoration(
                                                      color: Colors
                                                          .lightGreenAccent,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.r),
                                                      border: Border.all(
                                                          color: Colors.grey)),
                                                  child: Center(
                                                    child: FaIcon(
                                                      FontAwesomeIcons.ellipsis,
                                                      size: 20.sp,
                                                      color: ColorName.darkGrey,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  padding: EdgeInsets.all(8.r),
                                                  margin: EdgeInsets.all(5.r),
                                                  decoration: BoxDecoration(
                                                    color: ColorName.blackColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.r),
                                                  ),
                                                  child: Center(
                                                    child: FaIcon(
                                                      FontAwesomeIcons
                                                          .locationArrow,
                                                      size: 20.sp,
                                                      color:
                                                          ColorName.whiteColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
    ],
  );
}
