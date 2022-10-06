import 'package:flutter/material.dart';
import 'package:meals/widgets/main_drawer.dart';

class FliterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function savefilters;
  final Map<String, bool> currentFilters;

  FliterScreen(
    this.currentFilters,
    this.savefilters,
  );

  @override
  State<FliterScreen> createState() => _FliterScreenState();
}

class _FliterScreenState extends State<FliterScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  initState() {
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];

    super.initState();
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("APPBAr"),
          actions: [
            IconButton(
                onPressed: () {
                  final selectedFilters = {
                    'gluten': _glutenFree,
                    'lactose': _lactoseFree,
                    'vegan': _vegan,
                    'vegetarian': _vegetarian,
                  };

                  widget.savefilters(selectedFilters);
                },
                icon: Icon(Icons.save))
          ],
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Adjust your meal selection",
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildSwitchListTile(
                    "Gluten-free",
                    "Only include gluten-free meals",
                    _glutenFree,
                    (newValue) {
                      setState(
                        () {
                          _glutenFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    "Lactose-free",
                    "Only include Lactose-free meals",
                    _lactoseFree,
                    (newValue) {
                      setState(
                        () {
                          _lactoseFree = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    "Vegetarian-free",
                    "Only include Vegetarian-free meals",
                    _vegetarian,
                    (newValue) {
                      setState(
                        () {
                          _vegetarian = newValue;
                        },
                      );
                    },
                  ),
                  _buildSwitchListTile(
                    "Vegan-free",
                    "Only include Vegan-free meals",
                    _vegan,
                    (newValue) {
                      setState(
                        () {
                          _vegan = newValue;
                        },
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
