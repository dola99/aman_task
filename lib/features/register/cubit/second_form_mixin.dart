import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:test_app/Model/register_model.dart';
import 'package:test_app/core/constant.dart';
import 'package:test_app/features/register/cubit/register_cubit.dart';
import 'package:test_app/widgets/snack_bar.dart';

mixin SecondFormMixin on Cubit<RegisterState> {
  SecondRegisterForm secondRegisterForm = SecondRegisterForm();

  Future<void> getLocation(BuildContext context) async {
    var location = await getUserLocation(context);
    if (location != null) {
      secondRegisterForm.latLng = LatLng(location.latitude, location.longitude);
    }
  }

  Future<Position?> getUserLocation(BuildContext context) async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationServiceEnabled) {
      // Handle case where location services are disabled
      return null;
    }

    PermissionStatus permission = await Permission.locationWhenInUse.status;

    if (permission == PermissionStatus.granted) {
      try {
        return await Geolocator.getCurrentPosition();
      } catch (e) {
        return null;
      }
    } else {
      // Request location permission
      PermissionStatus permissionStatus =
          await Permission.locationWhenInUse.request();

      if (permissionStatus == PermissionStatus.granted) {
        // ignore: use_build_context_synchronously
        ShowSnackBar.show(
            context: context,
            message: 'Location obtained successfully.',
            textColor: AppColors.bgGrey_900,
            color: AppColors.primaryColor,
            isSuccess: true);
        return await Geolocator.getCurrentPosition();
      } else {
        // Handle case where location permission is denied
        return null;
      }
    }
  }
}
