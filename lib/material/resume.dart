import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse('https://flutter.dev');

class BagasBote extends StatelessWidget {
  const BagasBote({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
 appBar: AppBar(
        title: Text("Curiculum Vitae", style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton( icon: Icon(FontAwesomeIcons.commentDots, color: Colors.black,),
          onPressed: (){}),
          IconButton(icon: Icon(Icons.more_vert, color:
           Colors.black,), onPressed: (){}, )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            Container( 
              margin: const EdgeInsets.all(16), 
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade200
              ),
              child: Text("Lebih dari 1 tahun pengalaman dalam pengembangan apikasi berbasis Website maupun Dekstop."),
            ),
            _buildTitle("Skills"),
            SizedBox(height: 10),
            _buildSkillRow("PHP", 0.60),
            SizedBox(height: 4),
            _buildSkillRow("Java", 0.75),
            SizedBox(height: 4),
            _buildSkillRow("Vue JS", 0.71),
            SizedBox(height: 4),
            _buildSkillRow("Network", 0.71),
            SizedBox(height: 20),

            _buildTitle("Experience"),
            SizedBox(height: 5),
            _buildExperienceRow(company: "Poltek GT", position: "PHP", duration: "2021 - 2022"),
            _buildExperienceRow(company: "Poltek GT", position: "Java", duration: "2021 - 2022"),
            _buildExperienceRow(company: "Poltek GT", position: "Vue JS", duration: "2021 - 2022"),
            _buildExperienceRow(company: "Scholl in Indonesia", position: "Network", duration: "2017 - 2020"),
            _buildTitle("Education"),
            SizedBox(height: 5),
            _buildExperienceRow(company: "SDN PASIR JAYA", position: "Student", duration: "2008 - 2014"),
            _buildExperienceRow(company: "SMPN 3 CIKUPA", position: "Student", duration: "2014 - 2017"),
            _buildExperienceRow(company: "SMK BINA AM MA'MUR", position: "Student", duration: "2017 - 2020"),
            _buildTitle("Contact"),
            SizedBox(height: 5,),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20),
                child: Icon(Icons.mail, color: Color.fromARGB(255, 154, 34, 25),),
              ),
              title: Text("bagasztri29@gmail.com"),
            ),
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 20),
                child: Icon(Icons.phone, color: Color.fromARGB(255, 15, 141, 8),),
              ),
              title: Text("+62 878 7746 6352"),
            ),
            _buildSocialsRow(),
            SizedBox(height: 20,),
          ],
          ),
      ),
      ), 
    );
  }

  Row _buildSocialsRow() {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: 20,),
              IconButton(
                color: Color.fromARGB(255, 33, 40, 243),
             icon: Icon(FontAwesomeIcons.facebookF),
             onPressed: (){
              _launchUrl("https://facebook.com/kodehive");
             },
             ),
              SizedBox(width: 5,),
                IconButton(
                color: Color.fromARGB(255, 255, 0, 0),
             icon: Icon(FontAwesomeIcons.youtube),
             onPressed: (){
              _launchUrl("https://youtu.be/Ssfs8vkoo8M");
             },
             ),
             SizedBox(width: 5,),
            //  SizedBox(width: 20,),
              IconButton(
                color: Colors.indigo,
             icon: Icon(FontAwesomeIcons.github),
             onPressed: (){
              _launchUrl("https://github.com/bagastrihendrawan");
             },
             ),
             SizedBox(width: 5,),
                IconButton(
                color: Color.fromARGB(255, 255, 0, 123),
             icon: Icon(FontAwesomeIcons.instagram),
             onPressed: (){
              _launchUrl("https://instagram.com/bagasbote");
             },
             ),
             SizedBox(width: 10,),
            ],
          );
  }



Future<void> _launchUrl(String s) async {
  launch(s);
}


  ListTile _buildExperienceRow({required String company, required String position, required String duration}) {
    return ListTile(
      leading: Padding(
        padding: const EdgeInsets.only(top: 8, left: 20),
        child: Icon(Icons.school, color: Color.fromARGB(255, 49, 50, 59)),
      ),
            title: Text(company, style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),),
            subtitle: Text("$position ($duration)"),
            );
  }

  Row _buildSkillRow(String skill, double level) {
    return Row(
            children: <Widget>[
              SizedBox(width: 16),
              Expanded(
                flex: 2,
                child: Text(skill.toUpperCase(), textAlign: TextAlign.right,)),
              SizedBox(width: 10,),
              Expanded(
                flex: 5,
                child: LinearProgressIndicator(
                  value: level,
                ),
                ),
                SizedBox(width: 16,),
            ],
          );
  }

  Padding _buildTitle(String title) {
    return Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title.toUpperCase(), style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),),
                Divider(color: Colors.grey,),
              ],
            ),
          );
  }

  Row _buildHeader() {
    return Row(children: <Widget>[
            SizedBox(width: 18),
            Container(
              width: 80,
              height: 80,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Color.fromARGB(255, 238, 91, 209),
                child: CircleAvatar(
                  radius: 37,
                  backgroundImage: AssetImage("images/bagas.jpg")))),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Bagas Tri Hendrawan", style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 10,),
                  Text("FullStack Developer"),
                  SizedBox(height: 5,),
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Color.fromARGB(255, 177, 0, 0),),
                      SizedBox(height: 10,),
                      Text("Tangerang, Indonesia", style: TextStyle(
                        color: Colors.grey
                      ),),
                    ],
                  ),
                ],
              )
          ],);
  }
}