import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ztour_mobile/Resources/assets.dart';
import 'package:ztour_mobile/Resources/network_image.dart';

class GalleryPageThree extends StatelessWidget {
  final List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Photos',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StaggeredGridView.countBuilder(
        padding: const EdgeInsets.all(8.0),
        crossAxisCount: 3,
        itemCount: 16,
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => _showImageDialog(context, zooM[index]),
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(zooM[index % zooM.length]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10.0)),
          ),
        ),
        staggeredTileBuilder: (index) => _staggeredTiles[index],
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
      ),
    );
  }
}

_showImageDialog(BuildContext context, String image) {
  showDialog(
    context: context,
    builder: (_) => Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              child: PNetworkImage(
                image,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
              const SizedBox(width: 10.0),
              IconButton(
                color: Colors.white,
                icon: Icon(Icons.share),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
