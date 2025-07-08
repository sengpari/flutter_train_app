import 'package:flutter/material.dart';


class StationListPage extends StatelessWidget {
  final String type; // 'departure' or 'arrival'
final String? selectedOther;

StationListPage({super.key, required this.type, this.selectedOther});

  final List<String> stations = [
    '수서', '동탄', '평택지제', '천안아산', '오송',
    '대전', '김천구미', '동대구', '경주', '울산', '부산',
  ];

  @override
  Widget build(BuildContext context) {
     final filteredStations = stations.where((s) => s != selectedOther).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(type == 'departure' ? '출발역' : '도착역'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
       
        itemCount: filteredStations.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
    Navigator.pop(context, filteredStations[index]); 
  },
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xFFe0e0e0),
                    width: 1,
                  ),
                ),
              ),
              child: Text(
                filteredStations[index],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
