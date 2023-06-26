import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImageHelper {
  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  ImageHelper({ImagePicker? imagePicker, ImageCropper? imageCropper})
      : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCropper = imageCropper ?? ImageCropper();

  Future<List<XFile?>> pickImage(
      {ImageSource source = ImageSource.gallery,
      int imageQuality = 100,
      bool multiple = false}) async {
    if (multiple) {
      return await _imagePicker.pickMultiImage(imageQuality: imageQuality);
    }
    final file = await _imagePicker.pickImage(
        source: source, imageQuality: imageQuality);

    return [file];
  }

  Future<CroppedFile?> crop(
          {required XFile file,
          CropAspectRatio? aspectRatio,
          CropStyle cropStyle = CropStyle.rectangle,
          bool multiple = false}) async =>
      await _imageCropper.cropImage(
          aspectRatio: aspectRatio,
          compressQuality: 100,
          uiSettings: [IOSUiSettings(), AndroidUiSettings()],
          sourcePath: file.path,
          cropStyle: cropStyle);
}
