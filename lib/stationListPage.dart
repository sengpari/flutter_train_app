import 'package:flutter/material.dart';

class DepartureStationPage extends StatelessWidget {
  final List<String> stations = [
    '수서', '동탄', '평택지제', '천안아산', '오송',
    '대전', '김천구미', '동대구', '경주', '울산', '부산'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('출발역'), // ❶ 앱바 타이틀
        centerTitle: true,
        backgroundColor: Colors.pink[50],
        elevation: 0,
      ),
      backgroundColor: Colors.pink[50],
      body: ListView.builder(
        itemCount: stations.length,
        itemBuilder: (context, index) {
          return Container(
            height: 50, // ❹ 영역 높이
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFe0e0e0), // Colors.grey[300]
                  width: 1,
                ),
              ),
            ),
            child: Text(
              stations[index],
              style: const TextStyle( // ❸ 글자 스타일
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}
