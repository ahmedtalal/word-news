import 'package:flutter/material.dart';

@immutable
abstract class NewsEvents{}

class FetchNewsEvent extends NewsEvents{}
class FetchCategoryNewsEvent extends NewsEvents{}
