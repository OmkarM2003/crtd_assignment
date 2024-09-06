// Opportunities List Widget
import 'package:flutter/material.dart';

class OpportunitiesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return const OpportunityCard();
        },
      ),
    );
  }
}

// Opportunity Card Widget
class OpportunityCard extends StatelessWidget {
  const OpportunityCard();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromARGB(255, 197, 197, 197)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(backgroundColor: Colors.blue),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Jr. Java Programmer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      Text("CRTD Technologies"),
                    ],
                  ),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.location_on),
                  Text('Bhopal, Madhya Pradesh, India'),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.access_time),
                  SizedBox(width: 10),
                  Text('2 Year Exp'),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: const Color.fromARGB(255, 194, 21, 9),
                    ),
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Apply Now >',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Divider(
                  color: Colors.grey,
                  height: 20,
                  thickness: 1,
                  indent: 10,
                  endIndent: 10),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, color: Colors.green),
                        Text('Actively Recruiting',
                            style: TextStyle(color: Colors.green)),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.access_time),
                        Text("6 days ago"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
