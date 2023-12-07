/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/bell.svg
  SvgGenImage get bell => const SvgGenImage('assets/icons/bell.svg');

  /// File path: assets/icons/calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/icons/calendar.svg');

  /// File path: assets/icons/chevron-left.svg
  SvgGenImage get chevronLeft =>
      const SvgGenImage('assets/icons/chevron-left.svg');

  /// File path: assets/icons/credit-card.svg
  SvgGenImage get creditCard =>
      const SvgGenImage('assets/icons/credit-card.svg');

  /// File path: assets/icons/heart.svg
  SvgGenImage get heart => const SvgGenImage('assets/icons/heart.svg');

  /// File path: assets/icons/heart1.svg
  SvgGenImage get heart1 => const SvgGenImage('assets/icons/heart1.svg');

  /// File path: assets/icons/home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/home.svg');

  /// File path: assets/icons/location-marker.svg
  SvgGenImage get locationMarker =>
      const SvgGenImage('assets/icons/location-marker.svg');

  /// File path: assets/icons/map.svg
  SvgGenImage get map => const SvgGenImage('assets/icons/map.svg');

  /// File path: assets/icons/user.svg
  SvgGenImage get user => const SvgGenImage('assets/icons/user.svg');

  /// File path: assets/icons/wifi.svg
  SvgGenImage get wifi => const SvgGenImage('assets/icons/wifi.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        bell,
        calendar,
        chevronLeft,
        creditCard,
        heart,
        heart1,
        home,
        locationMarker,
        map,
        user,
        wifi
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/birds.png
  AssetGenImage get birds => const AssetGenImage('assets/images/birds.png');

  /// File path: assets/images/business.png
  AssetGenImage get business =>
      const AssetGenImage('assets/images/business.png');

  /// File path: assets/images/cake-shop.png
  AssetGenImage get cakeShop =>
      const AssetGenImage('assets/images/cake-shop.png');

  /// File path: assets/images/doctors.png
  AssetGenImage get doctors => const AssetGenImage('assets/images/doctors.png');

  /// File path: assets/images/girl.jpeg
  AssetGenImage get girl => const AssetGenImage('assets/images/girl.jpeg');

  /// File path: assets/images/keys.png
  AssetGenImage get keys => const AssetGenImage('assets/images/keys.png');

  /// File path: assets/images/man.jpeg
  AssetGenImage get man => const AssetGenImage('assets/images/man.jpeg');

  /// File path: assets/images/saloon.png
  AssetGenImage get saloon => const AssetGenImage('assets/images/saloon.png');

  /// File path: assets/images/telegram.webp
  AssetGenImage get telegram =>
      const AssetGenImage('assets/images/telegram.webp');

  /// List of all assets
  List<AssetGenImage> get values =>
      [birds, business, cakeShop, doctors, girl, keys, man, saloon, telegram];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
