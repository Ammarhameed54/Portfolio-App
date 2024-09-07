import 'package:flutter/material.dart';
import 'package:portfolio/about.dart';
import 'package:portfolio/projects.dart';
import 'package:sliding_sheet2/sliding_sheet2.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  myach(num, type) {
    return Row(
      children: [
        Text(
          num,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10),
          child: Text(type),
        ),
      ],
    );
  }

  myspec(icon, tech) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        color: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(icon), Text(tech)],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: ListView(
          children: [
            ListTile(
              textColor: Colors.white,
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => const AboutMe())),
              title: const Text("About Me"),
            ),
            ListTile(
              textColor: Colors.white,
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const ProjectsScreen())),
              title: const Text("Projects"),
            )
          ],
        ),
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          snap: true,
          snappings: [0.35, 0.7, 1.0],
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        body: Container(
          child: Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, left: 30),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return const LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [Colors.black, Colors.transparent])
                        .createShader(
                            Rect.fromLTRB(0, 0, rect.height, rect.width));
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    "assets/pic.png",
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.50),
                child: const Column(
                  children: [
                    Text(
                      "Ammar Hameed",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Flutter Developer",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(left: 30, top: 20, right: 20),
            height: 500,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myach('10', "Projects"),
                      myach('00', "Clients"),
                      myach('02', "Messages"),
                    ],
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Specialized In",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          myspec(Icons.flutter_dash_rounded, "Flutter"),
                          myspec(Icons.code, "Dart"),
                          myspec(Icons.web, "Web"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          myspec(Icons.html_rounded, "Html5"),
                          myspec(Icons.css_rounded, "Css"),
                          myspec(Icons.javascript, "JavaScript"),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          myspec(Icons.code, "Python"),
                          myspec(Icons.code, "Git/GitHub"),
                          myspec(Icons.settings, "D.Scientist"),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
