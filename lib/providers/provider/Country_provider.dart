import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CountryProvider extends ChangeNotifier{
  String country ;
  SharedPreferences _shared ;
  CountryProvider(){
    this._loadFromPref();
  }

  _initPref() async{
    if (_shared == null) {
      _shared = await SharedPreferences.getInstance() ;
    }
    return _shared ;
  }

  _saveCountry() async{
    await _initPref() ;
    _shared.setString("country", this.country) ;
  }
  _loadFromPref() async{
    await _initPref() ;
    country = _shared.getString("country") ?? "null" ;
    notifyListeners() ;
  }

  setCountry(){
    _saveCountry();
    notifyListeners();
  }

}