import 'package:flutter/material.dart';

import 'utils/job_card.dart';
import 'utils/recent_job_card.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List jobsForYou = [
    ['Uber', 'UI Designer', 'images/icons/uber.png', 45],
    ['Google', 'Product Dev', 'images/icons/google.png', 80],
    ['Apple', 'Software Eng.', 'images/icons/apple.png', 45],
  ];
  final List recentJobs = [
    ['Nike', 'Web Designer', 'images/icons/nike.png', 20],
    ['Apple', 'Software Eng.', 'images/icons/apple.png', 55],
    ['Google', 'Product Dev', 'images/icons/google.png', 69],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  appbar
          const SizedBox(height: 35),

          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Container(
              child: Image.asset(
                'images/icons/menu.png',
                color: Colors.grey[800],
              ),
              height: 40,
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
            ),
          ),

          const SizedBox(height: 15),

          //  discover a new path
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Discover a New Path',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 15),

          //  search bar
          Padding(
            padding: const EdgeInsets.only(
              left: 25,
              right: 10,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: Border.all(color: Colors.grey.shade100),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          icon: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Image.asset(
                              'images/icons/search.png',
                              color: Colors.grey[600],
                              height: 24,
                            ),
                          ),
                          border: InputBorder.none,
                          hintText: 'Search for a job..',
                          constraints:
                              const BoxConstraints.tightFor(height: 40)),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[800],
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    'images/icons/settings.png',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          //  for you -> job cards
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'For You',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 140,
            child: ListView.builder(
              itemCount: jobsForYou.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return JobCard(
                  companyName: jobsForYou[index][0],
                  jobTitle: jobsForYou[index][1],
                  logoImagePath: jobsForYou[index][2],
                  hourlyRate: jobsForYou[index][3],
                );
              },
            ),
          ),

          const SizedBox(height: 20),

          //  recently added -> job tiles
          const Padding(
            padding: EdgeInsets.only(left: 25.0),
            child: Text(
              'Recently Added',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView.builder(
                itemCount: recentJobs.length,
                itemBuilder: (context, index) {
                  return RecentJobCard(
                    companyName: recentJobs[index][0],
                    jobTitle: recentJobs[index][1],
                    logoImagePath: recentJobs[index][2],
                    hourlyRate: recentJobs[index][3],
                  );
                },
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     color: Colors.blue,
          //   ),
          // ),
        ],
      ),
    );
  }
}
