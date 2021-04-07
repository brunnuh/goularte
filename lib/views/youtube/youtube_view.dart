import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class YoutubeView extends StatelessWidget {
  final List searchList;

  YoutubeView({@required this.searchList});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (_, index) {
          return Container(
            height: 140,
            margin: index == searchList.length - 1
                ? EdgeInsets.only(bottom: 40)
                : null,
            child: Card(
              child: Row(
                children: [
                  Container(
                    width: 130,
                    child: CachedNetworkImage(
                      imageUrl: searchList[index].thumbnails.maxResUrl,
                      fit: BoxFit.fitHeight,
                      height: 140,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            searchList[index].title.trim(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            '${searchList[index].engagement.viewCount} de visualizações',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 12,
                                backgroundImage:
                                    AssetImage('assets/image1.jpg'),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text('Goularte'),
                              const SizedBox(
                                width: 3,
                              ),
                              Icon(
                                Icons.check_circle,
                                size: 13,
                                color: Colors.grey,
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${searchList[index].description} de visualizações',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
