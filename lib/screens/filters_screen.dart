import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

Widget buildSwitchListTile(
    bool currentValue, Function updateValue, String title, String description) {
  return SwitchListTile(
    value: currentValue,
    onChanged: updateValue,
    title: Text(title),
    subtitle: Text(description),
  );
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetaran = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetaran = widget.currentFilters['vegetarian'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'vegetarian': _vegetaran,
                'vegan': _vegan,
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                buildSwitchListTile(
                  _vegetaran,
                  (newValue) {
                    setState(() {
                      _vegetaran = newValue;
                    });
                  },
                  'Vegetarian',
                  'Only include vegetarian meals',
                ),
                buildSwitchListTile(
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  },
                  'Vegan',
                  'Only include vegan meals',
                ),
                buildSwitchListTile(
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue;
                    });
                  },
                  'Gluten-Free',
                  'Only include gluten-free meals',
                ),
                buildSwitchListTile(
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  },
                  'Lactose-Free',
                  'Only include lactose-free meals',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
