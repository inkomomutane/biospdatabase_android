import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Model/Genre/Genre.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Components/DateComponent.dart';
import 'package:biospdatabase/View/Components/DateTimeComponent.dart';
import 'package:biospdatabase/View/Components/LabelComponent.dart';
import 'package:biospdatabase/View/Components/NumberComponent.dart';
import 'package:biospdatabase/View/Components/PhoneNumberComponent.dart';
import 'package:biospdatabase/View/Components/SelectComponent.dart';
import 'package:biospdatabase/View/Components/TextComponent.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BenificiaryForm extends StatefulWidget {
  const BenificiaryForm({Key? key}) : super(key: key);

  @override
  _BenificiaryFormState createState() => _BenificiaryFormState();
}

class _BenificiaryFormState extends State<BenificiaryForm> {
  final _formKey = GlobalKey<FormState>();

  int _currentIndex = 1;

  List<Genre> genres = [
    new Genre(
        uuid: Uuid().v4(),
        name: 'Sarcastic',
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    new Genre(
        name: 'Mascou',
        uuid: Uuid().v4(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    new Genre(
        name: 'Miraculs',
        uuid: Uuid().v4(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
  ];
  var benificiary = new Benificiary(
          uuid: Uuid().v4(),
          createdAt: DateTime.now(),
          updatedAt: DateTime.now())
      .toJson();

  //

  TextEditingController? fullName;
  TextEditingController? especific;

  @override
  Widget build(BuildContext context) {
    var data = Syncronization.getGenres();
    data.addAll(genres);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black45,
        elevation: 1,
        leading: GestureDetector(
          child: Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabelComponent(labelText: "Nome completo"),
              TextComponent(
                controller: fullName,
                hintText: "Nome completo",
                onChanged: (nomeCompleto) {
                  //   setState(() {
                  this.benificiary['full_name'] = nomeCompleto;

                  //print(nomeCompleto);
                  // });
                },
                onSaved: (nomeCompleto) {
                  // setState(() {
                  if (nomeCompleto != null) {
                    this.benificiary['full_name'] = nomeCompleto;
                  }

                  // });
                },
              ),
              LabelComponent(labelText: "Bairro"),
              SelectComponent(
                hintText: "Bairro",
                items: data.values.toList(),
                onChanged: (Genre? bairro) {
                  //setState(() {
                  if (bairro != null) {
                    this.benificiary['neighborhood_uuid'] = bairro.uuid;
                    print(bairro.toJson());
                  }

                  //});
                },
                onSaved: (Genre? bairro) {
                  //setState(() {
                  if (bairro != null) {
                    this.benificiary['neighborhood_uuid'] = bairro.uuid;
                    print(bairro.toJson());
                  }
                  //});
                },
              ),
              LabelComponent(labelText: "Sexo"),
              SelectComponent(
                hintText: "Sexo",
                items: ["Masculino", "Feminino"],
                onChanged: (sexo) {
                  // setState(() {
                  this.benificiary['genre_uuid'] = sexo;
                  // });
                },
                onSaved: (sexo) {
                  //setState(() {
                  this.benificiary['genre_uuid'] = sexo;
                  //});
                },
              ),
              LabelComponent(labelText: "1⁰ visita ou frequência"),
              NumberComponent(
                hintText: "1⁰ visita ou frequência",
                onChanged: (frequencia) {
                  //setState(() {
                  this.benificiary['number_of_visits'] = frequencia;
                  //});
                },
                onSaved: (frequencia) {
                  //  setState(() {
                  this.benificiary['number_of_visits'] = frequencia;
                  // });
                },
              ),
              LabelComponent(labelText: "Proviniência"),
              SelectComponent(
                hintText: "Proviniência",
                items: ["Comunidade"],
                onChanged: (proviniencia) {
                  //  setState(() {
                  this.benificiary['provenace_uuid'] = proviniencia;
                  //});
                },
                onSaved: (proviniencia) {
                  // setState(() {
                  this.benificiary['provenace_uuid'] = proviniencia;
                  //});
                },
              ),
              LabelComponent(labelText: "Data de nascimento"),
              DateComponent(
                onSubmited: (dataDeNascimento) {
                  //  setState(() {
                  if (dataDeNascimento != null) {
                    this.benificiary['birth_date'] =
                        dataDeNascimento.toIso8601String();
                  }

                  // });
                },
                onSaved: (dataDeNascimento) {
                  //setState(() {
                  if (dataDeNascimento != null) {
                    this.benificiary['birth_date'] =
                        dataDeNascimento.toIso8601String();
                  }
                  //});
                },
              ),
              LabelComponent(labelText: "Contacto"),
              PhoneNumberComponent(
                hintText: "Contacto",
                onChanged: (contacto) {
                  //setState(() {
                  this.benificiary['phone'] = contacto;
                  //});
                },
                onSaved: (contacto) {
                  //setState(() {
                  this.benificiary['phone'] = contacto;
                  //});
                },
              ),
              LabelComponent(labelText: "Data de atendimento"),
              DateTimeComponent(
                onChanged: (dataDeAtendimento) {
                  // setState(() {
                  if (dataDeAtendimento != null) {
                    this.benificiary['service_date'] =
                        dataDeAtendimento.toIso8601String();
                  }

                  //});
                },
                onSaved: (dataDeAtendimento) {
                  //setState(() {
                  if (dataDeAtendimento != null) {
                    this.benificiary['service_date'] =
                        dataDeAtendimento.toIso8601String();
                  }
                  //});
                },
              ),
              LabelComponent(labelText: "Objectivo da visita"),
              SelectComponent(
                hintText: "Objectivo da visita",
                items: ["1. Welma"],
                onChanged: (objectivoDaVisita) {
                  ///setState(() {
                  this.benificiary['purpose_of_visit'] = objectivoDaVisita;
                  // });
                },
                onSaved: (objectivoDaVisita) {
                  //setState(() {
                  this.benificiary['purpose_of_visit'] = objectivoDaVisita;
                  // });
                },
              ),
              LabelComponent(
                  labelText: "Se tiver formação profissional Especificar"),
              TextComponent(
                hintText: "Se tiver formação profissional Especificar",
                onChanged: (value) {},
                onSaved: (value) {},
              ),
              LabelComponent(labelText: "Motivo de abertura de processo"),
              SelectComponent(
                hintText: "Motivo de abertura de processo",
                items: ["1. Welma"],
                onChanged: (motivoDeAberturaDeProcesso) {
                  //setState(() {
                  this.benificiary['reason_opening_case_uuid'] =
                      motivoDeAberturaDeProcesso;
                  //});
                },
                onSaved: (motivoDeAberturaDeProcesso) {
                  //setState(() {
                  this.benificiary['reason_opening_case_uuid'] =
                      motivoDeAberturaDeProcesso;
                  //});
                },
              ),
              LabelComponent(labelText: "Documentos necessários"),
              SelectComponent(
                hintText: "Documentos necessários",
                items: ["1. Welma"],
                onChanged: (documentoNecessarios) {
                  //setState(() {
                  this.benificiary['document_type_uuid'] = documentoNecessarios;
                  // });
                },
                onSaved: (documentoNecessarios) {
                  //setState(() {
                  this.benificiary['document_type_uuid'] = documentoNecessarios;
                  //});
                },
              ),
              LabelComponent(labelText: "Serviço encaminhado"),
              SelectComponent(
                hintText: "Serviço encaminhado",
                items: ["1. FIP"],
              ),
              LabelComponent(labelText: "Especificar Serviço"),
              TextComponent(
                hintText: "Especificar Serviço",
                onChanged: (value) {},
                onSaved: (value) {},
              ),
              LabelComponent(
                  labelText: "Necessita de acompanhamento domiciliar?"),
              SelectComponent(
                hintText: "Necessita de acompanhamento domiciliar?",
                items: ["Sim", "Não"],
                onChanged: (necessitaDeAcompanhamento) {
                  //setState(() {
                  if (necessitaDeAcompanhamento == "sim") {
                    this.benificiary['home_care'] = true;
                  } else {
                    this.benificiary['home_care'] = false;
                  }
                  //});
                },
                onSaved: (necessitaDeAcompanhamento) {
                  // setState(() {
                  if (necessitaDeAcompanhamento == "sim") {
                    this.benificiary['home_care'] = true;
                  } else {
                    this.benificiary['home_care'] = false;
                  }
                  // });
                },
              ),
              LabelComponent(labelText: "Objectivo da(s)  visita(s)"),
              TextComponent(
                hintText: "Objectivo da(s)  visita(s)",
                onChanged: (value) {},
                onSaved: (value) {},
              ),
              LabelComponent(labelText: "Data que foi recebida pelo serviço"),
              DateTimeComponent(
                onChanged: (receivedDate) {
                  //setState(() {
                  if (receivedDate != null) {
                    this.benificiary['date_received'] =
                        receivedDate.toIso8601String();
                  }

                  //});
                },
                onSaved: (receivedDate) {
                  if (receivedDate != null) {
                    this.benificiary['date_received'] =
                        receivedDate.toIso8601String();
                  }

                  //});
                },
              ),
              LabelComponent(labelText: "Resolveu o seu problema?"),
              SelectComponent(
                hintText: "Resolveu o seu problema?",
                items: ["Sim", "Não"],
                onChanged: (problemaResolvido) {
                  //setState(() {
                  if (problemaResolvido == "Sim") {
                    this.benificiary['status'] = true;
                  } else {
                    this.benificiary['status'] = false;
                  }
                  //});
                },
                onSaved: (problemaResolvido) {
                  //setState(() {
                  if (problemaResolvido == "Sim") {
                    this.benificiary['status'] = true;
                  } else {
                    this.benificiary['status'] = false;
                  }
                  //  });
                },
              ),
              LabelComponent(labelText: ""),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() {
          this._currentIndex = index;
          if (index == 1) {
            _formKey.currentState!.save();
            print(Benificiary.fromJson(benificiary).toJson());
          } else {
            Navigator.of(context).pop();
          }
        }),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.block),
            title: Text('Cancelar'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.save),
            title: Text('Guardar'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
