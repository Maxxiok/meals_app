import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: ref.watch(filtersProvider)[Filter.glutenFree]!,
            onChanged: (val) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, val);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only show gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 33, right: 22),
          ),
          SwitchListTile(
            value: ref.watch(filtersProvider)[Filter.lactoseFree]!,
            onChanged: (val) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, val);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only show lactose-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 33, right: 22),
          ),
          SwitchListTile(
            value: ref.watch(filtersProvider)[Filter.vegetarian]!,
            onChanged: (val) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, val);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only show vegetarian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 33, right: 22),
          ),
          SwitchListTile(
            value: ref.watch(filtersProvider)[Filter.vegan]!,
            onChanged: (val) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, val);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only show vegan meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 33, right: 22),
          ),
        ],
      ),
    );
  }
}
