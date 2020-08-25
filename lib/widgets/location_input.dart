import 'package:flutter/material.dart';
import 'package:location/location.dart';
import '../controllers/location_controller.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl;
  Future<void> getCurrentLocation() async {
    final LocationData locationData = await Location().getLocation();
    setState(() {
      _previewImageUrl = LocationController.generateLocationPreviewImageUrl(
          locationData.latitude, locationData.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height / 3,
          width: double.infinity,
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
          child: _previewImageUrl == null
              ? Text(
                  'No location selected',
                  textAlign: TextAlign.center,
                )
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: getCurrentLocation,
              icon: Icon(
                Icons.location_on,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                'Current location',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            FlatButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.map,
                color: Theme.of(context).primaryColor,
              ),
              label: Text(
                'Select from map',
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        )
      ],
    );
  }
}
