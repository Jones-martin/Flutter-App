import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRearCameraSelected = true;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  void _initializeCamera() async {
    cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 20,
                  child: IconButton(
                    icon: Icon(
                      _isFlashOn ? Icons.flash_on : Icons.flash_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _isFlashOn = !_isFlashOn;
                      });
                      _controller.setFlashMode(
                        _isFlashOn ? FlashMode.torch : FlashMode.off,
                      );
                    },
                  ),
                ),
                Positioned(
                  bottom: 100,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.flip_camera_ios, color: Colors.white),
                    onPressed: () async {
                      _isRearCameraSelected = !_isRearCameraSelected;
                      _controller = CameraController(
                        cameras[_isRearCameraSelected ? 0 : 1],
                        ResolutionPreset.high,
                      );
                      _initializeControllerFuture = _controller.initialize();
                      setState(() {});
                    },
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: MediaQuery.of(context).size.width / 2 - 35,
                  child: FloatingActionButton(
                    onPressed: () async {
                      try {
                        await _initializeControllerFuture;
                        final image = await _controller.takePicture();
                        
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Icon(Icons.camera_alt, color: Colors.black),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
