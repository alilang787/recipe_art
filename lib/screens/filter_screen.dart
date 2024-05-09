import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipe_art/providers/filter_provider.dart';
import 'package:recipe_art/widgets/drawer.dart';

class FilterScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters_vals = ref.watch(filters_provider);
    final filter_notiy = ref.read(filters_provider.notifier);
    Widget tile(String title, String subtitle, value) {
      return ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        title: Text(title),
        titleTextStyle: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800),
        subtitle: Padding(
          padding: const EdgeInsets.only(left: 6),
          child: Text(subtitle),
        ),
        subtitleTextStyle: TextStyle(color: Colors.grey),
        trailing: Switch.adaptive(
            value: value,
            onChanged: (val) {
              if (title == 'Gluten Free') {
                filter_notiy.setFilters(Filters.glutenFree, val);
              } else if (title == 'Lactose Free') {
                filter_notiy.setFilters(Filters.lactoseFree, val);
              } else if (title == 'Vegan') {
                filter_notiy.setFilters(Filters.vegan, val);
              } else if (title == 'Vegetarian') {
                filter_notiy.setFilters(Filters.vegetarian, val);
              }
            }),
      );
    }

    final List<Map> filter_switches = [
      {
        'title': 'Gluten Free',
        'subtitle': 'you will see only gluten-free recipes',
        'value': filters_vals[Filters.glutenFree]
      },
      {
        'title': 'Lactose Free',
        'subtitle': 'you will see only lactose-free recipes',
        'value': filters_vals[Filters.lactoseFree],
      },
      {
        'title': 'Vegan',
        'subtitle': 'you will see only vegan recipes',
        'value': filters_vals[Filters.vegan]
      },
      {
        'title': 'Vegetarian',
        'subtitle': 'you will see only vegetarian recipes',
        'value': filters_vals[Filters.vegetarian]
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'FILTERS',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      drawer: DrawerMain(),
      body: Center(
        child: Column(
          children: [
            ...filter_switches.map(
              (e) => tile(e['title'], e['subtitle'], e['value']),
            )
          ],
        ),
      ),
    );
  }

  void handler(bool sVal, bool fVal) {}
}
