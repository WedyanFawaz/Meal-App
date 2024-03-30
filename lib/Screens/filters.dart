import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/widget/switch.dart';

import '../providers/filter_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final activeFilters = ref.watch(filterProvider);
    return Scaffold(

        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: 
        Column(
            children: [
              SwitchItem(
                  xFreeSubtitle: 'only include Gluten-free meals',
                  xfreeName: 'Gluten-free',
                  xFree: activeFilters[Filter.glutenFree]!,
                  onChanged: (newValue) {
              ref.read(filterProvider.notifier).setFilter(Filter.glutenFree, newValue);

                  }),
              SwitchItem(
                  xFreeSubtitle: 'only include lactose-free meals',
                  xfreeName: 'lactose-free',
                  xFree:  activeFilters[Filter.lactoseFree]!,
                  onChanged: (newValue) {
                
                    ref.read(filterProvider.notifier).setFilter(Filter.lactoseFree, newValue);
                  
                  }),
              SwitchItem(
                  xFreeSubtitle: 'only include vegetarian meals',
                  xfreeName: 'vegetarian',
                  xFree:  activeFilters[Filter.vegetrain]!,
                  onChanged: (newValue) {
        ref.read(filterProvider.notifier).setFilter(Filter.vegetrain, newValue);
                  }),
              SwitchItem(
                  xFreeSubtitle: 'only include vegen meals',
                  xfreeName: 'vegen',
                  xFree:  activeFilters[Filter.vegan]!,
                  onChanged: (newValue) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, newValue);
                  }),
            ],
          ),
        );
  }
}
