// General
export 'package:flutter_screenutil/flutter_screenutil.dart';
export 'package:flutter/material.dart';
export 'package:google_maps_flutter/google_maps_flutter.dart';
export 'package:font_awesome_flutter/font_awesome_flutter.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'screens/pages/home.dart';
export 'package:google_nav_bar/google_nav_bar.dart';
export 'dart:typed_data';



export '../../gen/colors.gen.dart';
export 'base/widgets/app_text.dart';
export '../../gen/assets.gen.dart';
export '../../gen/fonts.gen.dart';
export 'base/widgets/curved_container.dart';
export 'screens/landing.dart';
// Home
export 'package:flutter/foundation.dart';
export 'package:flutter/gestures.dart';


//SERVICE

export '../../../base/service/service.dart';

//CUBIT
  //Current location
export 'package:bloc/bloc.dart';
export 'package:meta/meta.dart';
export 'base/service/location_repo.dart';
export '../screens/data/current/cubit/current_location_cubit.dart';
export '../../screens/data/current/models/current_location.dart';

  //history
  export 'package:locator_app/screens/pages/history.dart';
  export 'screens/data/history/models/history_model.dart';
  export 'screens/data/history/cubit/history_cubit.dart';

  //map
  export '../screens/data/current/cubit/cubit/map_cubit.dart';

