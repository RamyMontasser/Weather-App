import 'package:geolocator/geolocator.dart';

class LocationService {
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }
    return await Geolocator.getCurrentPosition(locationSettings: LocationSettings(
      accuracy: LocationAccuracy.low, 
      distanceFilter: 100,)).timeout(
      const Duration(seconds: 5), // ✅ استنى 5 ثواني بس
      onTimeout: () {
        // ✅ لو الـ 5 ثواني خلصوا، ارمي إيرور عشان الكيوبت يلقطه ويقفل اللودينج
        return Future.error(
          'Location request timed out. Please check Emulator GPS.',
        );
      },
    );
  }
}