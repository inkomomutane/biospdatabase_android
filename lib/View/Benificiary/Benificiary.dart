import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Model/DocumentType/DocumentType.dart';
import 'package:biospdatabase/Model/ForwardedService/ForwardedService.dart';
import 'package:biospdatabase/Model/Genre/Genre.dart';
import 'package:biospdatabase/Model/Neighborhood/Neighborhood.dart';
import 'package:biospdatabase/Model/Provenace/Provenace.dart';
import 'package:biospdatabase/Model/PurposeOfVisit/PurposeOfVisit.dart';
import 'package:biospdatabase/Model/ReasonOpeningCase/ReasonOpeningCase.dart';
import 'package:biospdatabase/Syncronization/Syncronization.dart';
import 'package:biospdatabase/View/Components/DateComponent.dart';
import 'package:biospdatabase/View/Components/DateTimeComponent.dart';
import 'package:biospdatabase/View/Components/LabelComponent.dart';
import 'package:biospdatabase/View/Components/NumberComponent.dart';
import 'package:biospdatabase/View/Components/PhoneNumberComponent.dart';
import 'package:biospdatabase/View/Components/SelectComponent.dart';
import 'package:biospdatabase/View/Components/TextComponent.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:dropdown_search2/dropdown_search2.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class BenificiaryForm extends StatefulWidget {
  const BenificiaryForm({Key? key, this.benificiaryForEdit}) : super(key: key);
  final Benificiary? benificiaryForEdit;
  @override
  _BenificiaryFormState createState() =>
      _BenificiaryFormState(benificiaryForEdit);
}

class _BenificiaryFormState extends State<BenificiaryForm> {
  _BenificiaryFormState(this.benificiaryForEdit);
  final _formKey = GlobalKey<FormState>();
  Benificiary? benificiaryForEdit;
  var benificiary;

  int _currentIndex = 1;
  @override
  void initState() {
    if (benificiaryForEdit != null) {
      benificiary = benificiaryForEdit!.toJson();
    } else {
      benificiary = new Benificiary(
              uuid: Uuid().v4(),
              createdAt: DateTime.now(),
              updatedAt: DateTime.now())
          .toJson();
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provenaces = Syncronization.getProvenances().values.toList();
    if (provenaces.isNotEmpty) {
      provenaces
          .sort((a, b) => a.name.codeUnitAt(0).compareTo(b.name.codeUnitAt(0)));
    }
    var proposeVisits = Syncronization.getProposeOfVisits().values.toList();

    if (proposeVisits.isNotEmpty) {
      proposeVisits
          .sort((a, b) => a.name.codeUnitAt(0).compareTo(b.name.codeUnitAt(0)));
    }

    var openingCase = Syncronization.getReasonsOfOpeningCases().values.toList();
    if (openingCase.isNotEmpty) {
      openingCase
          .sort((a, b) => a.name.codeUnitAt(0).compareTo(b.name.codeUnitAt(0)));
    }

    var documents = Syncronization.getDocumentTypes().values.toList();
    if (documents.isNotEmpty) {
      documents
          .sort((a, b) => a.name.codeUnitAt(0).compareTo(b.name.codeUnitAt(0)));
    }

    var forwarded = Syncronization.getForwardedServices().values.toList();
    if (forwarded.isNotEmpty) {
      forwarded.sort((a, b) => a.name.compareTo(b.name));
    }

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
                hintText: "Nome completo",
                initialValue: benificiaryForEdit != null
                    ? benificiaryForEdit!.fullName
                    : "",
                onChanged: (nomeCompleto) {
                  setState(() {
                    this.benificiary['full_name'] = nomeCompleto;
                  });
                },
                onSaved: (nomeCompleto) {
                  setState(() {
                    if (nomeCompleto != null) {
                      this.benificiary['full_name'] = nomeCompleto;
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Bairro"),
              SelectComponent(
                hintText: "Bairro",
                selectedItem:
                    Syncronization.getNeighborhoods().values.toList().isNotEmpty
                        ? (Syncronization.getNeighborhoods()
                                .values
                                .toList()
                                .where((element) {
                            if (benificiaryForEdit != null) {
                              return "${benificiaryForEdit!.neighborhoodUuid}" ==
                                  "${element.uuid}";
                            }
                            return false;
                          }).isNotEmpty
                            ? Syncronization.getNeighborhoods()
                                .values
                                .toList()
                                .where((element) {
                                return "${benificiaryForEdit!.neighborhoodUuid}" ==
                                    "${element.uuid}";
                              }).first
                            : Syncronization.getNeighborhoods().values.toList().first)
                        : null,
                items:
                    Syncronization.getNeighborhoods().values.toList().isNotEmpty
                        ? Syncronization.getNeighborhoods().values.toList()
                        : <Neighborhood>[],
                onChanged: (Neighborhood? bairro) {
                  setState(() {
                    if (bairro != null) {
                      this.benificiary['neighborhood_uuid'] = bairro.uuid;
                    }
                  });
                },
                onSaved: (Neighborhood? bairro) {
                  setState(() {
                    if (bairro != null) {
                      this.benificiary['neighborhood_uuid'] = bairro.uuid;
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Sexo"),
              SelectComponent(
                hintText: "Sexo",
                selectedItem:
                    Syncronization.getGenres().values.toList().isNotEmpty
                        ? (Syncronization.getGenres()
                                .values
                                .toList()
                                .where((element) {
                            if (benificiaryForEdit != null) {
                              return "${benificiaryForEdit!.genreUuid}" ==
                                  "${element.uuid}";
                            }
                            return false;
                          }).isNotEmpty
                            ? Syncronization.getGenres()
                                .values
                                .toList()
                                .where((element) {
                                return "${benificiaryForEdit!.genreUuid}" ==
                                    "${element.uuid}";
                              }).first
                            : null)
                        : null,
                items: Syncronization.getGenres().values.toList().isNotEmpty
                    ? Syncronization.getGenres().values.toList()
                    : <Genre>[],
                onChanged: (Genre? sexo) {
                  setState(() {
                    if (sexo != null) {
                      this.benificiary['genre_uuid'] = sexo.uuid;
                    }
                  });
                },
                onSaved: (Genre? sexo) {
                  setState(() {
                    if (sexo != null) {
                      this.benificiary['genre_uuid'] = sexo.uuid;
                    }
                  });
                },
              ),
              LabelComponent(labelText: "1⁰ visita ou frequência"),
              NumberComponent(
                hintText: "1⁰ visita ou frequência",
                initialValue: benificiaryForEdit != null
                    ? benificiaryForEdit!.numberOfVisits
                    : "",
                onChanged: (frequencia) {
                  setState(() {
                    this.benificiary['number_of_visits'] = frequencia;
                  });
                },
                onSaved: (frequencia) {
                  setState(() {
                    this.benificiary['number_of_visits'] = frequencia;
                  });
                },
              ),
              LabelComponent(labelText: "Proviniência"),
              SelectComponent(
                hintText: "Proviniência",
                showSearchBox: true,
                mode: Mode.DIALOG,
                selectedItem: provenaces.isNotEmpty
                    ? (Syncronization.getProvenances()
                            .values
                            .toList()
                            .where((element) {
                        if (benificiaryForEdit != null) {
                          return "${benificiaryForEdit!.provenaceUuid}" ==
                              "${element.uuid}";
                        }
                        return false;
                      }).isNotEmpty
                        ? Syncronization.getProvenances()
                            .values
                            .toList()
                            .where((element) {
                            return "${benificiaryForEdit!.provenaceUuid}" ==
                                "${element.uuid}";
                          }).first
                        : null)
                    : null,
                items:
                    Syncronization.getProvenances().values.toList().isNotEmpty
                        ? provenaces
                        : <Provenace>[],
                onChanged: (Provenace? proviniencia) {
                  setState(() {
                    if (proviniencia != null) {
                      this.benificiary['provenace_uuid'] = proviniencia.uuid;
                    }
                  });
                },
                onSaved: (Provenace? proviniencia) {
                  setState(() {
                    if (proviniencia != null) {
                      this.benificiary['provenace_uuid'] = proviniencia.uuid;
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Data de nascimento"),
              DateComponent(
                initialValue: benificiaryForEdit != null
                    ? benificiaryForEdit!.birthDate
                    : DateTime.now(),
                onSubmited: (dataDeNascimento) {
                  setState(() {
                    if (dataDeNascimento != null) {
                      this.benificiary['birth_date'] =
                          dataDeNascimento.toIso8601String();
                    }
                  });
                },
                onSaved: (dataDeNascimento) {
                  setState(() {
                    if (dataDeNascimento != null) {
                      this.benificiary['birth_date'] =
                          dataDeNascimento.toIso8601String();
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Contacto"),
              PhoneNumberComponent(
                hintText: "Contacto",
                initialValue:
                    benificiaryForEdit != null ? benificiaryForEdit!.phone : "",
                onChanged: (contacto) {
                  setState(() {
                    this.benificiary['phone'] = contacto;
                  });
                },
                onSaved: (contacto) {
                  setState(() {
                    this.benificiary['phone'] = contacto;
                  });
                },
              ),
              LabelComponent(labelText: "Data de atendimento"),
              DateTimeComponent(
                initialValue: benificiaryForEdit != null
                    ? benificiaryForEdit!.serviceDate
                    : DateTime.now(),
                onChanged: (dataDeAtendimento) {
                  setState(() {
                    if (dataDeAtendimento != null) {
                      this.benificiary['service_date'] =
                          dataDeAtendimento.toIso8601String();
                    }
                  });
                },
                onSaved: (dataDeAtendimento) {
                  setState(() {
                    if (dataDeAtendimento != null) {
                      this.benificiary['service_date'] =
                          dataDeAtendimento.toIso8601String();
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Objectivo da visita"),
              SelectComponent(
                hintText: "Objectivo da visita",
                showSearchBox: true,
                selectedItem: Syncronization.getProposeOfVisits()
                        .values
                        .toList()
                        .isNotEmpty
                    ? (Syncronization.getProposeOfVisits()
                            .values
                            .toList()
                            .where((element) {
                        if (benificiaryForEdit != null) {
                          return "${benificiaryForEdit!.purposeOfVisit}" ==
                              "${element.uuid}";
                        }
                        return false;
                      }).isNotEmpty
                        ? Syncronization.getProposeOfVisits()
                            .values
                            .toList()
                            .where((element) {
                            return "${benificiaryForEdit!.purposeOfVisit}" ==
                                "${element.uuid}";
                          }).first
                        : null)
                    : null,
                mode: Mode.DIALOG,
                items: Syncronization.getProposeOfVisits()
                        .values
                        .toList()
                        .isNotEmpty
                    ? proposeVisits
                    : <PurposeOfVisit>[],
                onChanged: (PurposeOfVisit? objectivoDaVisita) {
                  setState(() {
                    if (objectivoDaVisita != null) {
                      this.benificiary['purpose_of_visit'] =
                          objectivoDaVisita.uuid;
                    }
                  });
                },
                onSaved: (PurposeOfVisit? objectivoDaVisita) {
                  setState(() {
                    if (objectivoDaVisita != null) {
                      this.benificiary['purpose_of_visit'] =
                          objectivoDaVisita.uuid;
                    }
                  });
                },
              ),
              LabelComponent(
                  labelText: "Se tiver formação profissional Especificar"),
              TextComponent(
                hintText: "Se tiver formação profissional Especificar",
                initialValue: benificiaryForEdit != null
                    ? benificiaryForEdit!.specifyPurposeOfVisit
                    : "",
                onChanged: (specifyPurposeOfVisit) {
                  setState(() {
                    this.benificiary['specify_purpose_of_visit'] =
                        specifyPurposeOfVisit;
                  });
                },
                onSaved: (specifyPurposeOfVisit) {
                  setState(() {
                    this.benificiary['specify_purpose_of_visit'] =
                        specifyPurposeOfVisit;
                  });
                },
              ),
              LabelComponent(labelText: "Motivo de abertura de processo"),
              SelectComponent(
                hintText: "Motivo de abertura de processo",
                showSearchBox: true,
                selectedItem: Syncronization.getReasonsOfOpeningCases()
                        .values
                        .toList()
                        .isNotEmpty
                    ? (Syncronization.getReasonsOfOpeningCases()
                            .values
                            .toList()
                            .where((element) {
                        if (benificiaryForEdit != null) {
                          return "${benificiaryForEdit!.reasonOpeningCaseUuid}" ==
                              "${element.uuid}";
                        }
                        return false;
                      }).isNotEmpty
                        ? Syncronization.getReasonsOfOpeningCases()
                            .values
                            .toList()
                            .where((element) {
                            return "${benificiaryForEdit!.reasonOpeningCaseUuid}" ==
                                "${element.uuid}";
                          }).first
                        : null)
                    : null,
                mode: Mode.DIALOG,
                items: Syncronization.getReasonsOfOpeningCases()
                        .values
                        .toList()
                        .isNotEmpty
                    ? openingCase
                    : <ReasonOpeningCase>[],
                onChanged: (ReasonOpeningCase? motivoDeAberturaDeProcesso) {
                  setState(() {
                    if (motivoDeAberturaDeProcesso != null) {
                      this.benificiary['reason_opening_case_uuid'] =
                          motivoDeAberturaDeProcesso.uuid;
                    }
                  });
                },
                onSaved: (ReasonOpeningCase? motivoDeAberturaDeProcesso) {
                  setState(() {
                    if (motivoDeAberturaDeProcesso != null) {
                      this.benificiary['reason_opening_case_uuid'] =
                          motivoDeAberturaDeProcesso.uuid;
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Documentos necessários"),
              SelectComponent(
                hintText: "Documentos necessários",
                selectedItem:
                    Syncronization.getDocumentTypes().values.toList().isNotEmpty
                        ? (Syncronization.getDocumentTypes()
                                .values
                                .toList()
                                .where((element) {
                            if (benificiaryForEdit != null) {
                              return "${benificiaryForEdit!.documentTypeUuid}" ==
                                  "${element.uuid}";
                            }
                            return false;
                          }).isNotEmpty
                            ? Syncronization.getDocumentTypes()
                                .values
                                .toList()
                                .where((element) {
                                return "${benificiaryForEdit!.documentTypeUuid}" ==
                                    "${element.uuid}";
                              }).first
                            : null)
                        : null,
                showSearchBox: true,
                mode: Mode.DIALOG,
                items:
                    Syncronization.getDocumentTypes().values.toList().isNotEmpty
                        ? documents
                        : <DocumentType>[],
                onChanged: (DocumentType? documentoNecessarios) {
                  setState(() {
                    if (documentoNecessarios != null) {
                      this.benificiary['document_type_uuid'] =
                          documentoNecessarios.uuid;
                    }
                  });
                },
                onSaved: (DocumentType? documentoNecessarios) {
                  setState(() {
                    if (documentoNecessarios != null) {
                      this.benificiary['document_type_uuid'] =
                          documentoNecessarios.uuid;
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Serviço encaminhado"),
              SelectComponent(
                hintText: "Serviço encaminhado",
                showSearchBox: true,
                selectedItem: Syncronization.getForwardedServices()
                        .values
                        .toList()
                        .isNotEmpty
                    ? (Syncronization.getForwardedServices()
                            .values
                            .toList()
                            .where((element) {
                        if (benificiaryForEdit != null) {
                          return "${benificiaryForEdit!.forwardedServiceUuid}" ==
                              "${element.uuid}";
                        }
                        return false;
                      }).isNotEmpty
                        ? Syncronization.getForwardedServices()
                            .values
                            .toList()
                            .where((element) {
                            return "${benificiaryForEdit!.forwardedServiceUuid}" ==
                                "${element.uuid}";
                          }).first
                        : null)
                    : null,
                mode: Mode.DIALOG,
                items: Syncronization.getForwardedServices()
                        .values
                        .toList()
                        .isNotEmpty
                    ? forwarded
                    : <ForwardedService>[],
                onChanged: (ForwardedService? forwardedService) {
                  setState(() {
                    if (forwardedService != null) {
                      this.benificiary['forwarded_service_uuid'] =
                          forwardedService.uuid;
                    }
                  });
                },
                onSaved: (ForwardedService? forwardedService) {
                  setState(() {
                    if (forwardedService != null) {
                      this.benificiary['forwarded_service_uuid'] =
                          forwardedService.uuid;
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Especificar Serviço"),
              TextComponent(
                hintText: "Especificar Serviço",
                initialValue: benificiaryForEdit != null
                    ? benificiaryForEdit!.specifyForwardedService
                    : "",
                onChanged: (value) {
                  this.benificiary['specify_forwarded_service'] = value;
                },
                onSaved: (value) {
                  this.benificiary['specify_forwarded_service'] = value;
                },
              ),
              LabelComponent(
                  labelText: "Necessita de acompanhamento domiciliar?"),
              SelectComponent(
                hintText: "Necessita de acompanhamento domiciliar?",
                items: ["Sim", "Não"],
                selectedItem: benificiaryForEdit != null
                    ? (benificiaryForEdit!.homeCare == true ? "Sim" : "Não")
                    : null,
                onChanged: (necessitaDeAcompanhamento) {
                  setState(() {
                    if (necessitaDeAcompanhamento == "Sim") {
                      this.benificiary['home_care'] = true;
                    } else {
                      this.benificiary['home_care'] = false;
                    }
                  });
                },
                onSaved: (necessitaDeAcompanhamento) {
                  // setState(() {
                  if (necessitaDeAcompanhamento == "Sim") {
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
                initialValue: benificiaryForEdit != null
                    ? benificiaryForEdit!.visitProposes
                    : "",
                onChanged: (value) {
                  this.benificiary['visit_proposes'] = value;
                },
                onSaved: (value) {
                  this.benificiary['visit_proposes'] = value;
                },
              ),
              LabelComponent(labelText: "Data que foi recebida pelo serviço"),
              DateTimeComponent(
                initialValue: benificiaryForEdit != null
                    ? benificiaryForEdit!.dateReceived
                    : DateTime.now(),
                onChanged: (receivedDate) {
                  setState(() {
                    if (receivedDate != null) {
                      this.benificiary['date_received'] =
                          receivedDate.toIso8601String();
                    }
                  });
                },
                onSaved: (receivedDate) {
                  setState(() {
                    if (receivedDate != null) {
                      this.benificiary['date_received'] =
                          receivedDate.toIso8601String();
                    }
                  });
                },
              ),
              LabelComponent(labelText: "Resolveu o seu problema?"),
              SelectComponent(
                hintText: "Resolveu o seu problema?",
                items: ["Sim", "Não"],
                selectedItem: benificiaryForEdit != null
                    ? (benificiaryForEdit!.status == true ? "Sim" : "Não")
                    : null,
                onChanged: (problemaResolvido) {
                  setState(() {
                    if (problemaResolvido == "Sim") {
                      this.benificiary['status'] = true;
                    } else {
                      this.benificiary['status'] = false;
                    }
                  });
                },
                onSaved: (problemaResolvido) {
                  setState(() {
                    if (problemaResolvido == "Sim") {
                      this.benificiary['status'] = true;
                    } else {
                      this.benificiary['status'] = false;
                    }
                  });
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

            if (this.benificiaryForEdit != null) {
              if (Syncronization.addUdated(Benificiary.fromJson(benificiary))) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Benificiario Actualizado com sucesso',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ));
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Erro ao actualizar benificiario',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            } else {
              if (Syncronization.addCreated(
                  Benificiary.fromJson(benificiary))) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Benificiario criado com sucesso',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.green,
                ));
                Navigator.of(context).pop();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                    'Erro ao criar benificiario',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.red,
                ));
              }
            }
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
