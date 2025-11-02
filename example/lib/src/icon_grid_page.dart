import 'package:example/src/icon_tile.dart';
import 'package:flutter/material.dart';
import 'package:iconex_flutter/iconex_flutter.dart';

typedef IconForName = IconData Function(String name);

/// A reusable grid page with a search field.
class IconGridPage extends StatefulWidget {
  const IconGridPage({
    super.key,
    required this.title,
    required this.entries,
    required this.iconBuilder,
  });

  final String title;

  /// List of available icon *names* (e.g., 'home', 'infoSquare', ...).
  final List<String> entries;

  /// Given an icon name, resolve to IconData (from Iconex.*).
  final IconForName iconBuilder;

  @override
  State<IconGridPage> createState() => _IconGridPageState();
}

class _IconGridPageState extends State<IconGridPage> {
  late SearchController searchController = SearchController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 8),
          child: SearchBar(
            padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 16.0),
            ),
            controller: searchController,
            leading: Icon(Iconex.light.search),
          ),
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: searchController,
            builder: (context, controller, _) {
              List<String> filteredIconNames;

              if (controller.text.isEmpty) {
                filteredIconNames = widget.entries;
              } else {
                filteredIconNames = widget.entries
                    .where(
                      (icon) => icon.toLowerCase().contains(
                        controller.text.toLowerCase(),
                      ),
                    )
                    .toList();
              }

              return GridView.builder(
                padding: const EdgeInsets.all(12.0),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8,
                ),
                itemCount: filteredIconNames.length,
                itemBuilder: (context, index) {
                  final name = filteredIconNames[index];
                  final icon = widget.iconBuilder(name);

                  return IconTile(name: name, icon: icon);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
