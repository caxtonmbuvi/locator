import '../../exports.dart';
import '../../base/globals/global.dart' as globals;

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final locationCubit = context.read<HistoryCubit>();
    locationCubit.getPreviousLocations();

    return Scaffold(
      backgroundColor: ColorName.whiteColor.withAlpha(245),
      body: SafeArea(
          child: BlocConsumer<HistoryCubit, HistoryState>(
        listener: (context, state) {
          if (state is HistoryLocationFailure) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        builder: (context, state) {
          if (state is HistoryInitial) {
            return Center(
              child: AppText.large("No New Data"),
            );
          } else if (state is HistoryLocationLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HistoryLocationLoaded) {
            // addMarkers(state.data);

            return loadBody(context,state.data);
          } else {
            return Center(
              child: AppText.large("No New Data"),
            );
          }
        },
      )),
    );
  }
}

Widget loadBody(BuildContext context, HistoryLocationModel data) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              width: ScreenUtil().screenWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    // styling the button
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      // Button color
                      backgroundColor: ColorName.whiteColor,
                    ),
                    // icon of the button
                    child: FaIcon(
                      FontAwesomeIcons.chevronLeft,
                      size: 20.sp,
                      color: ColorName.darkGrey,
                    ),
                  ),
                  AppText.large("Jeniffer"),
                  ElevatedButton(
                    onPressed: () {},
                    // styling the button
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      // Button color
                      backgroundColor: ColorName.blackColor,
                    ),
                    // icon of the button
                    child: FaIcon(
                      FontAwesomeIcons.locationArrow,
                      size: 20.sp,
                      color: ColorName.whiteColor,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 20.h),
                    width: 170.w,
                    height: 200.h,
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(30),
                        child: Image.network(
                          globals.selected!.avatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 70.h,
                    width: ScreenUtil().screenWidth,
                    decoration: BoxDecoration(
                        color: ColorName.whiteColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.r))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 55.h,
                          width: 50.w,
                          margin: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              color: ColorName.whiteColor,
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(color: ColorName.lightGrey)),
                          child: Center(
                              child: Icon(
                            Icons.info_outline,
                            size: 20.sp,
                          )),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 40.h,
                          margin: EdgeInsets.symmetric(
                            horizontal: 10.w,
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 15.w, vertical: 5.h),
                          decoration: BoxDecoration(
                              color: ColorName.primaryColor,
                              borderRadius: BorderRadius.circular(20.r)),
                          child: Center(
                            child: AppText.medium("id ${globals.selected!.id}"),
                          ),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Container(
                          height: 55.h,
                          width: 50.w,
                          margin: EdgeInsets.all(5.r),
                          decoration: BoxDecoration(
                              color: ColorName.whiteColor,
                              borderRadius: BorderRadius.circular(30.r),
                              border: Border.all(color: ColorName.lightGrey)),
                          child: Center(
                            child: Icon(
                              Icons.wechat_outlined,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomPaint(
                    size: Size(ScreenUtil().screenWidth,
                        210), // You can change this to your desired size
                    painter: CurvedSideContainerPainter(
                        color: Colors.white, topCurve: 0.2, bottomCurve: 0.85),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 20.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.large(
                                "Now is",
                                fontSize: 18,
                              ),
                              Icon(
                                Icons.location_on_outlined,
                                size: 25.sp,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.medium(
                                globals.selected!.locationName.toString(),
                                fontWeight: FontWeight.normal,
                              ),
                              AppText.medium(
                                'Since ${globals.selected!.createdAt.hour}:${globals.selected!.createdAt.minute}',
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 7.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 20.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppText.medium(
                                  "School",
                                ),
                                AppText.medium(
                                  data.history.isEmpty
                                      ? 'Still there'
                                      : "${(globals.selected!.createdAt.minute - data.history.last.date.minute).abs()}min updated",
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomPaint(
                    size: Size(ScreenUtil().screenWidth,
                        210), // You can change this to your desired size
                    painter: CurvedSideContainerPainter(
                        color: Colors.white, topCurve: 0.06, bottomCurve: 0.9),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.w, vertical: 30.h),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText.large(
                                "Last updates",
                                fontSize: 18,
                              ),
                              Container(
                                height: 35.h,
                                width: 30.w,
                                margin: EdgeInsets.all(5.r),
                                decoration: BoxDecoration(
                                    color: ColorName.whiteColor,
                                    borderRadius: BorderRadius.circular(20.r),
                                    border:
                                        Border.all(color: ColorName.lightGrey)),
                                child: Center(
                                  child: FaIcon(
                                    FontAwesomeIcons.chevronUp,
                                    size: 18.sp,
                                    color: ColorName.blackColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: data.history.length,
                              itemBuilder: ((context, index) {
                                var item = data.history[index];
                                return Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      AppText.medium(item.locationName),
                                      AppText.medium(
                                          '${item.date.hour}:${item.date.minute}')
                                    ],
                                  ),
                                );
                              })),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
        Positioned(
          bottom: 30.h,
          child: SizedBox(
            height: 50.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {},
                    // styling the button
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                      // Button color
                      backgroundColor: ColorName.blackColor,
                    ),
                    // icon of the button
                    child: Icon(
                      Icons.phone_outlined,
                      size: 20.sp,
                      color: ColorName.whiteColor,
                    )),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 10.w,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 40.w, vertical: 5.h),
                  decoration: BoxDecoration(
                      color: ColorName.blackColor,
                      borderRadius: BorderRadius.circular(60.r)),
                  child: Center(
                    child: AppText.large(
                      "Follow",
                      color: ColorName.whiteColor,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  // styling the button
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                    // Button color
                    backgroundColor: ColorName.blackColor,
                  ),
                  // icon of the button
                  child: FaIcon(
                    FontAwesomeIcons.batteryHalf,
                    size: 20.sp,
                    color: ColorName.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
