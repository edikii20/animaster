import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TestDioWidget extends StatefulWidget {
  const TestDioWidget({super.key});

  @override
  State<TestDioWidget> createState() => _TestDioWidgetState();
}

class _TestDioWidgetState extends State<TestDioWidget> {
  late final Dio client;

  @override
  void initState() {
    super.initState();
    client = Dio();
    postPosts();
  }

  Future<void> postPosts() async {
    final response = await client.postUri(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      data: jsonEncode({
        'title': 'foo',
        'body': 'bar',
        'userId': 1,
      }),
      options: Options(contentType: 'application/json; charset=UTF-8'),
    );

    print(response.statusCode);
    print(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
