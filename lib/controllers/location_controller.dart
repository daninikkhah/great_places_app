const String googleMapsApiKey = 'AIzaSyBg9yn5JtQgKRFbg6FCTy4ewbF24kRuAYI';

class LocationController {
  static String generateLocationPreviewImageUrl(
          double latitude, double longitude) =>
      'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$googleMapsApiKey';
}
