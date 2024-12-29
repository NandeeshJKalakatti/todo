import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class FocusModePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Focus Mode'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '30:18',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'While your focus mode is on,\nall of your notifications will be off',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 32,
                  ),
                  child: Text('Stop Focusing'),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Overview',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const style = TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            );
                            String text;
                            switch (value.toInt()) {
                              case 0:
                                text = 'SUN';
                                break;
                              case 1:
                                text = 'MON';
                                break;
                              case 2:
                                text = 'TUE';
                                break;
                              case 3:
                                text = 'WED';
                                break;
                              case 4:
                                text = 'THU';
                                break;
                              case 5:
                                text = 'FRI';
                                break;
                              case 6:
                                text = 'SAT';
                                break;
                              default:
                                text = '';
                            }
                            return SideTitleWidget(
                              axisSide: meta.axisSide,
                              space: 10,
                              child: Text(text, style: style),
                            );
                          },
                          reservedSize: 22,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    barGroups: [
                      BarChartGroupData(
                        x: 0,
                        barRods: [
                          BarChartRodData(
                            toY: 3 * 30.0,
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 1,
                        barRods: [
                          BarChartRodData(
                            toY: 3 * 30.0,
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 2,
                        barRods: [
                          BarChartRodData(
                            toY: 5 * 30.0,
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 3,
                        barRods: [
                          BarChartRodData(
                            toY: 4 * 30.0,
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 4,
                        barRods: [
                          BarChartRodData(
                            toY: 6 * 30.0,
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 5,
                        barRods: [
                          BarChartRodData(
                            toY: 3 * 30.0,
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                      BarChartGroupData(
                        x: 6,
                        barRods: [
                          BarChartRodData(
                            toY: 2 * 30.0,
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildAppUsageTile(
                    'Instagram',
                    'You spent 4h on Instagram today',
                    Icons.camera_alt,
                  ),
                  _buildAppUsageTile(
                    'Twitter',
                    'You spent 3h on Twitter today',
                    Icons.alternate_email,
                  ),
                  _buildAppUsageTile(
                    'Facebook',
                    'You spent 1h on Facebook today',
                    Icons.facebook,
                  ),
                  _buildAppUsageTile(
                    'Telegram',
                    'You spent 30m on Telegram today',
                    Icons.send,
                  ),
                  _buildAppUsageTile(
                    'Gmail',
                    'You spent 45m on Gmail today',
                    Icons.email,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppUsageTile(String title, String subtitle, IconData icon) {
    return Card(
      color: Colors.grey[900],
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(color: Colors.grey),
        ),
        trailing: Icon(Icons.info_outline, color: Colors.grey),
      ),
    );
  }
}
