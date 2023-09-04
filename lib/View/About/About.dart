import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black54),
        title: Text("Sobre o aplicativo",
            style: TextStyle(
                fontWeight: FontWeight.w800, color: Colors.grey.shade800)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: 200,
            child: Text(""),
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage('images/logo.png'))),
          ),
          ListTile(
            leading: CircleAvatar(
              child: Icon(
                Icons.verified_sharp,
                color: Colors.amber.shade400,
              ),
              backgroundColor: Colors.white,
            ),
            title: Text("Versão"),
            subtitle: Text("1.0.2"),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('images/logo.png'),
              backgroundColor: Colors.white,
            ),
            title: Text("Projecto"),
            subtitle: Text("Akulu - Akulu II"),
          ),
          ListTile(
            title: Text("Desenvolvedor"),
            subtitle: Text("Nelson Alexandre Mutane"),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                onPressed: () {
                  launch("mailto:nelsonmutane@gmail.com");
                },
                icon: Icon(Icons.mail),
                color: Colors.grey.shade600,
              ),
            ),
            trailing: IconButton(
                onPressed: () {
                  launch("tel:+258847607095");
                },
                icon: Icon(
                  Icons.call,
                  color: Colors.grey.shade600,
                )),
          ),
          ListTile(
            leading: CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.developer_mode,
                  color: Colors.grey.shade600,
                )),
            title: Text("Contribuidores de desenvolvimento"),
            subtitle: Text("Edson Meque"),
          ),
          GestureDetector(
              child: ListTile(
            title: Text("Licença"),
            subtitle: Text("BSD-3-Clause (LICENSE)",
                style: TextStyle(fontWeight: FontWeight.w800)),
            leading: CircleAvatar(
                backgroundColor: Colors.white, child: Icon(Icons.file_present)),
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'BSD-3-Clause (LICENSE)',
                  style: TextStyle(fontWeight: FontWeight.w800),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Copyright 2021 Nelson Alexandre Mutane and contributors. All rights reserved."),
                      Text(
                          "Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:"),
                      Text(" "),
                      Text(
                          "* Redistributions of source code must retain the above copyright"),
                      Text(
                          "notice, this list of conditions and the following disclaimer."),
                      Text(" "),
                      Text(
                          "* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer n the documentation and/or other materials provided with the distribution."),
                      Text(" "),
                      Text(
                          "* Neither the name of Sumburero. nor the names of its"),
                      Text(
                          "contributors may be used to endorse or promote products derived from this software without specific prior written permission."),
                      Text(" "),
                      Text(
                          'THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.'),
                    ],
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Close'),
                  )
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
