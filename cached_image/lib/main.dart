import 'package:baseflow_plugin_template/baseflow_plugin_template.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() {
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;

  runApp(
    BaseflowPluginExample(
      pluginName: 'CachedNetworkImage',
      githubURL: '',
      pubDevURL: '',
      pages: [
        ListContent.createPage(),
        GridContent.createPage(),
      ],
    ),
  );
}
class ListContent extends StatelessWidget {
  const ListContent({super.key});

  static ExamplePage createPage() {
    return ExamplePage(Icons.list, (context) => const ListContent());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => Card(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: 'https://loremflickr.com/320/240/music?lock=$index',
              placeholder: (BuildContext context, String url) => Container(
                width: 320,
                height: 240,
                color: Colors.purple,
              ),
            ),
          ],
        ),
      ),
      itemCount: 250,
    );
  }
}
class GridContent extends StatelessWidget {
  const GridContent({super.key});

  static ExamplePage createPage() {
    return ExamplePage(Icons.grid_on, (context) => const GridContent());
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 250,
      gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (BuildContext context, int index) => CachedNetworkImage(
        imageUrl: 'https://loremflickr.com/100/100/music?lock=$index',
        placeholder: _loader,
        errorWidget: _error,
      ),
    );
  }

  Widget _loader(BuildContext context, String url) {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _error(BuildContext context, String url, Object error) {
    return const Center(child: Icon(Icons.error));
  }
}
