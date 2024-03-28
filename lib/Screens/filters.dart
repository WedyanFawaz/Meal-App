import 'package:flutter/material.dart';
import 'package:meals_app/Screens/tabs.dart';
import 'package:meals_app/widget/main_drawer.dart';
import 'package:meals_app/widget/switch.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetrain,
  vegan
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key, required this.currentFilters});
final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeState = false;
  var _lactoseFreeState = false;
  var _vegetFreeState = false;
  var _veganFreeState = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeState = widget.currentFilters[Filter.glutenFree]!;
        _lactoseFreeState = widget.currentFilters[Filter.lactoseFree]!;
            _vegetFreeState = widget.currentFilters[Filter.vegetrain]!;
                _veganFreeState = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // drawer: MainDrawer(onSelectScreen: (identifier){
        //   Navigator.pop(context);

        //   if (identifier=='Meals'){
        //     Navigator.push(context, MaterialPageRoute(builder: (ctx)=> TabScreen()));
        //   }

        // }),
        appBar: AppBar(
          title: const Text('Your Filters'),
        ),
        body: WillPopScope( //It returns data 
          onWillPop: ()  async{ 
            Navigator.of(context).pop({ //When click pop this changes made , transfare data
              Filter.glutenFree : _glutenFreeState,
              Filter.lactoseFree: _lactoseFreeState,
              Filter.vegetrain: _vegetFreeState,
              Filter.vegan: _veganFreeState
            }); 
            return false;
            },
          child: Column(
            children: [
              SwitchItem(
                xFreeSubtitle: 'only include Gluten-free meals',
                  xfreeName: 'Gluten-free',
                  xFree: _glutenFreeState,
                  onChanged: (newValue) {
                    setState(() {
                      _glutenFreeState = newValue;
                    });
                  }),
              SwitchItem(
                xFreeSubtitle: 'only include lactose-free meals',
                  xfreeName: 'lactose-free',
                  xFree: _lactoseFreeState,
                  onChanged: (newValue) {
                    setState(() {
                      _lactoseFreeState = newValue;
                    });
                  }),
              SwitchItem(
                xFreeSubtitle: 'only include vegetarian meals',
                  xfreeName: 'vegetarian',
                  xFree: _vegetFreeState,
                  onChanged: (newValue) {
                    setState(() {
                      _vegetFreeState = newValue;
                    });
                  }),
              SwitchItem(
                xFreeSubtitle:'only include vegen meals' ,
                  xfreeName: 'vegen',
                  xFree: _veganFreeState,
                  onChanged: (newValue) {
                    setState(() {
                      _veganFreeState = newValue;
                    });
                  }),
            ],
          ),
        ));
  }
}
