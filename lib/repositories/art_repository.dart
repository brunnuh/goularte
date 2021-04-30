import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:goularte/models/art.dart';
import 'package:goularte/repositories/table_keys.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ArtRepository {
  int limit = 9;

  Future<List<Art>> getArts(int page) async {
    List<Art> arts = [];

    final queryBuilder = QueryBuilder<ParseObject>(ParseObject(keyArts));

    queryBuilder.setLimit(limit);
    queryBuilder.setAmountToSkip(page * limit);
    queryBuilder.orderByAscending(keyCreatedAt);

    queryBuilder.includeObject([keyArtUser]);

    //regras
    queryBuilder.whereEqualTo(keyArtAccepted, true);

    try {
      final response = await queryBuilder.query();
      if (response.success) {
        response.result.forEach((ParseObject e) {
          arts.add(Art.fromJson(e));
        });
        return arts;
      }
      return [];
    } catch (e) {
      return Future.error('Falha ao buscar artes');
    }
  }

  Future<bool> downloadArt(String url, String name) async {
    try {
      final path = await getExternalStorageDirectory();
      await FlutterDownloader.enqueue(
          url: url, savedDir: path.path, fileName: name);
      return true;
    } catch (e) {
      return Future.error('Falha ao fazer download da imagem');
    }
  }

  Future<bool> postArt(File art) async {
    try {
      final ParseUser parseUser = await ParseUser.currentUser();
      final parseFile = ParseFile(art, name: path.basename(art.path));
      final responseImage = await parseFile.save();

      if (responseImage.success) {
        final parseObject = ParseObject(keyArts);

        //regras
        final parseAcl = ParseACL(owner: parseUser);
        parseAcl.setPublicWriteAccess(allowed: false);
        parseAcl.setPublicReadAccess(allowed: true);

        parseObject.setACL(parseAcl);

        //adc na table
        parseObject.set<ParseFile>(keyArtImage, parseFile);
        parseObject.set<ParseUser>(keyArtUser, parseUser);

        //enviar
        final response = await parseObject.save();
        if (response.success) {
          return true;
        }
        return false;
      }
    } catch (e) {
      return Future.error(
          'Falha ao enviar imagem, tente novamente mais tarde.');
    }
  }
}
