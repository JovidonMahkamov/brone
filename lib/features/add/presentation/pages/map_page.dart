import 'package:brone/core/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/elevated_button_widget.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _controller;

  final LatLng _center = const LatLng(41.3111, 69.2797);

  final Set<Marker> _markers = {
    Marker(markerId: MarkerId('1'), position: LatLng(41.32, 69.25)),
    Marker(markerId: MarkerId('2'), position: LatLng(41.33, 69.28)),
    Marker(markerId: MarkerId('3'), position: LatLng(41.30, 69.27)),
    Marker(markerId: MarkerId('4'), position: LatLng(41.31, 69.24)),
    Marker(markerId: MarkerId('5'), position: LatLng(41.28, 69.29)),
    Marker(markerId: MarkerId('6'), position: LatLng(41.27, 69.23)),
  };

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  int currentStep = 4;
  double zoom = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Joylashuv',
                    style: TextStyle(
                      fontSize: 23.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(6, (index) {
                      bool isCompleted = index < currentStep;
                      bool isCurrent = index == currentStep;
                      return Row(
                        children: [
                          Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? Colors.indigo
                                  : (isCurrent ? Colors.white : Colors.white),
                              border: Border.all(
                                color: isCompleted
                                    ? Colors.indigo
                                    : (isCurrent
                                          ? Colors.indigo
                                          : Colors.grey.shade400),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: isCompleted
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 16,
                                    )
                                  : (isCurrent
                                        ? Container(
                                            width: 8.w,
                                            height: 8.h,
                                            decoration: const BoxDecoration(
                                              color: Colors.indigo,
                                              shape: BoxShape.circle,
                                            ),
                                          )
                                        : null),
                            ),
                          ),
                          // Step line
                          if (index != 5)
                            Container(
                              width: 40.w,
                              height: 2.h,
                              color: index < currentStep
                                  ? Colors.indigo
                                  : Colors.grey.shade400,
                            ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  GoogleMap(
                    onMapCreated: (c) => _controller = c,
                    initialCameraPosition: CameraPosition(
                      target: _center,
                      zoom: zoom,
                    ),
                    markers: _markers,
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    zoomControlsEnabled: false,
                  ),
                  Positioned(
                    right: 20,
                    bottom: 260,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        zoom++;
                        _controller?.animateCamera(CameraUpdate.zoomTo(zoom));
                      },
                      child: const Icon(Icons.add),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 340,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        zoom--;
                        _controller?.animateCamera(CameraUpdate.zoomTo(zoom));
                      },
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  Positioned(
                    right: 20,
                    bottom: 180,
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        _controller?.animateCamera(
                          CameraUpdate.newLatLng(_center),
                        );
                      },
                      child: const Icon(Icons.near_me),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    right: 40,
                    bottom: 120,
                    child: Container(
                      height: 55.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          "Yangi ari ko’chasi, 32  uy",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp,
                            color: Color(0xff22348A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 50,
                    right: 20,
                    child: ElevatedWidget(
                      onPressed: () {if (currentStep < 6) currentStep++;Navigator.pushNamed(context, RouteNames.save);},
                      text: 'Davom etish',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
