import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

class GifControllerService extends StatefulWidget {
  final String image;
  final double width;
  final double height;

  const GifControllerService({
    super.key,
    required this.image,
    required this.width,
    required this.height,
  });

  @override
  GifControllerServiceState createState() => GifControllerServiceState();
}

class GifControllerServiceState extends State<GifControllerService> with SingleTickerProviderStateMixin {
  late GifController _gifController;

  @override
  void initState() {
    super.initState();
    _gifController = GifController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Gif(
      controller: _gifController,
      width: widget.width,
      height: widget.height,
      image: AssetImage(widget.image),
    );
  }

  @override
  void dispose() {
    _gifController.dispose();
    super.dispose();
  }
}
