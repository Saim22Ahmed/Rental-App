/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/rentImage.jpg
  AssetGenImage get rentImage =>
      const AssetGenImage('assets/images/rentImage.jpg');

  /// File path: assets/images/rentImage10.jpg
  AssetGenImage get rentImage10 =>
      const AssetGenImage('assets/images/rentImage10.jpg');

  /// File path: assets/images/rentImage11.jpg
  AssetGenImage get rentImage11 =>
      const AssetGenImage('assets/images/rentImage11.jpg');

  /// File path: assets/images/rentImage12.jpg
  AssetGenImage get rentImage12 =>
      const AssetGenImage('assets/images/rentImage12.jpg');

  /// File path: assets/images/rentImage13.jpg
  AssetGenImage get rentImage13 =>
      const AssetGenImage('assets/images/rentImage13.jpg');

  /// File path: assets/images/rentImage14.jpg
  AssetGenImage get rentImage14 =>
      const AssetGenImage('assets/images/rentImage14.jpg');

  /// File path: assets/images/rentImage2.jpg
  AssetGenImage get rentImage2 =>
      const AssetGenImage('assets/images/rentImage2.jpg');

  /// File path: assets/images/rentImage3.jpg
  AssetGenImage get rentImage3 =>
      const AssetGenImage('assets/images/rentImage3.jpg');

  /// File path: assets/images/rentImage4.jpg
  AssetGenImage get rentImage4 =>
      const AssetGenImage('assets/images/rentImage4.jpg');

  /// File path: assets/images/rentImage5.jpg
  AssetGenImage get rentImage5 =>
      const AssetGenImage('assets/images/rentImage5.jpg');

  /// File path: assets/images/rentImage6.jpg
  AssetGenImage get rentImage6 =>
      const AssetGenImage('assets/images/rentImage6.jpg');

  /// File path: assets/images/rentImage7.jpg
  AssetGenImage get rentImage7 =>
      const AssetGenImage('assets/images/rentImage7.jpg');

  /// File path: assets/images/rentImage8.jpg
  AssetGenImage get rentImage8 =>
      const AssetGenImage('assets/images/rentImage8.jpg');

  /// File path: assets/images/rentImage9.jpg
  AssetGenImage get rentImage9 =>
      const AssetGenImage('assets/images/rentImage9.jpg');

  /// List of all assets
  List<AssetGenImage> get values => [
        rentImage,
        rentImage10,
        rentImage11,
        rentImage12,
        rentImage13,
        rentImage14,
        rentImage2,
        rentImage3,
        rentImage4,
        rentImage5,
        rentImage6,
        rentImage7,
        rentImage8,
        rentImage9
      ];
}

class Assets {
  Assets._();

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
