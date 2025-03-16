// camera.dart
import 'dart:io'; // For File class
import 'package:healingbloom/screens/scanskin/loading_screen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:healingbloom/theme/app_theme.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;
  bool _isFrontCamera = true;
  XFile? _capturedImage;
  bool _isFlashOn = false;
  bool _isSwitchingCamera = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      _cameras = await availableCameras();
      _controller = CameraController(
        _cameras[_isFrontCamera ? 1 : 0],
        ResolutionPreset.ultraHigh,
      );
      await _controller.initialize();
      setState(() {
        _isCameraInitialized = true;
        _isSwitchingCamera = false;
      });
    } catch (e) {
      print('Camera Error: $e');
    }
  }

  void _switchCamera() async {
    if (_isSwitchingCamera) return;
    setState(() {
      _isSwitchingCamera = true;
      _isCameraInitialized = false;
    });
    _isFrontCamera = !_isFrontCamera;
    await _initializeCamera();
  }

  void _toggleFlash() async {
    if (_controller.value.flashMode == FlashMode.off) {
      await _controller.setFlashMode(FlashMode.torch);
      setState(() => _isFlashOn = true);
    } else {
      await _controller.setFlashMode(FlashMode.off);
      setState(() => _isFlashOn = false);
    }
  }

  void _captureImage() async {
    try {
      final image = await _controller.takePicture();
      setState(() => _capturedImage = image);
    } catch (e) {
      print('Capture Error: $e');
    }
  }

  void _resetCamera() {
    setState(() => _capturedImage = null);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: _capturedImage == null
          ? _cameraPreview()
          : _imagePreview(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _capturedImage == null
          ? _captureButton()
          : _previewControls(),
    );
  }

  Widget _cameraPreview() {
    if (!_isCameraInitialized) return Center(child: CircularProgressIndicator());
    return Stack(
      children: [
        CameraPreview(_controller),
        _cameraOverlay(),
        // Positioned(
        //   top: 60,
        //   left: 20,
        //   child: IconButton(
        //     icon: Icon(
        //       _isFlashOn ? Icons.flash_off : Icons.flash_on,
        //       color: Colors.white,
        //       size: 40,
        //     ),
        //     onPressed: _toggleFlash,
        //   ),
        // ),
        // Positioned(
        //   top: 60,
        //   right: 20,
        //   child: IconButton(
        //     icon: Icon(Icons.cameraswitch, color: Colors.white, size: 40),
        //     onPressed: _switchCamera,
        //   ),
        // ),
      ],
    );
  }

  Widget _imagePreview() {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.file(File(_capturedImage!.path), fit: BoxFit.cover),
        ),
        _cameraOverlay(),
      ],
    );
  }

  Widget _cameraOverlay() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black.withOpacity(0.6),
            Colors.transparent,
            Colors.transparent,
            Colors.black.withOpacity(0.6),
          ],
          stops: [0.0, 0.25, 0.75, 1.0],
        ),
      ),
      child: Center(
        child: Container(
          width: 250,
          height: 250,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.8), width: 2),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }

  Widget _captureButton() {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.champagneGold, width: 2),
        gradient: AppTheme.gradientPrimary,
        boxShadow: [AppTheme.luxuryShadow],
      ),
      child: IconButton(
        icon: Icon(Icons.camera_alt, size: 32),
        color: AppTheme.pearlWhite,
        onPressed: _captureImage,
      ),
    );
  }

  Widget _previewControls() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            heroTag: 'retake',
            onPressed: _resetCamera,
            backgroundColor: AppTheme.pearlWhite,
            foregroundColor: AppTheme.royalPlum,
            child: Icon(Icons.close),
          ),
          FloatingActionButton(
            heroTag: 'confirm',
            onPressed: () => _navigateToLoading(context),
            backgroundColor: AppTheme.royalPlum,
            foregroundColor: AppTheme.pearlWhite,
            child: Icon(Icons.check),
          ),
        ],
      ),
    );
  }

  void _navigateToLoading(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => LoadingScreen(imagePath: _capturedImage!.path),
        fullscreenDialog: true,
      ),
    ).then((_) => _resetCamera());
  }
}