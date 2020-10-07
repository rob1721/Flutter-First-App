// aca va toda la logica de conexion al storage
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageAPI {
  // obteniendo la referencia de la url
  final StorageReference _storageReference = FirebaseStorage.instance.ref();

  // obtenidndo el path de la imagen
  Future<StorageUploadTask> uploadFile(String path, File image) async {
    StorageUploadTask storageUploadTask
    // en que PATH quiero q viva mi imagen
    = _storageReference.child(path).putFile(image); // cada vez q se maneje un sistema de anidacion..mencionar quien es hijo

    return storageUploadTask;

  }
}