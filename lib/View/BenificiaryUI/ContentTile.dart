import 'package:biospdatabase/Model/Benificiary/Benificiary.dart';
import 'package:biospdatabase/Controller/BenificiaryController.dart';
import 'package:biospdatabase/helpers/AgeCalculator.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContentTile extends StatefulWidget {
  const ContentTile({Key? key, required this.benificiary}) : super(key: key);
  final Benificiary benificiary;

  @override
  _ContentTileState createState() => _ContentTileState(this.benificiary);
}

class _ContentTileState extends State<ContentTile> {
  final Benificiary benificiary;

  _ContentTileState(this.benificiary);
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            title: Text(
              benificiary.fullName != null ? "${benificiary.fullName}" : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Nome completo"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              Syncronization.getNeighborhoods()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.neighborhoodUuid)
                      .isNotEmpty
                  ? Syncronization.getNeighborhoods()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.neighborhoodUuid)
                      .first
                      .name
                  : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Bairro"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              Syncronization.getGenres()
                      .values
                      .where((element) => element.uuid == benificiary.genreUuid)
                      .isNotEmpty
                  ? Syncronization.getGenres()
                      .values
                      .where((element) => element.uuid == benificiary.genreUuid)
                      .first
                      .name
                  : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Sexo"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              benificiary.phone != null ? "${benificiary.phone}" : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Contacto"),
            trailing: IconButton(
                onPressed: () {
                  launchUrlString(benificiary.phone != null
                      ? "tel:${benificiary.phone}"
                      : "tel:");
                },
                icon: Icon(Icons.call)),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              AgeCalculator.calculateAge(benificiary.birthDate).toString(),
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Idade"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              Syncronization.getProvenances()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.provenaceUuid)
                      .isNotEmpty
                  ? Syncronization.getProvenances()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.provenaceUuid)
                      .first
                      .name
                  : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Proviniência"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              Syncronization.getKnownOfBiosps()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.knownOfBiospUuid)
                      .isNotEmpty
                  ? Syncronization.getKnownOfBiosps()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.knownOfBiospUuid)
                      .first
                      .name
                  : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Como teve conhecimento de BIOSP"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              Syncronization.getProposeOfVisits()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.purposeOfVisit)
                      .isNotEmpty
                  ? Syncronization.getProposeOfVisits()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.purposeOfVisit)
                      .first
                      .name
                  : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Objectivo da visita"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              Syncronization.getReasonsOfOpeningCases()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.reasonOpeningCaseUuid)
                      .isNotEmpty
                  ? Syncronization.getReasonsOfOpeningCases()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.reasonOpeningCaseUuid)
                      .first
                      .name
                  : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Motivo de abertura de processo"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              Syncronization.getDocumentTypes()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.documentTypeUuid)
                      .isNotEmpty
                  ? Syncronization.getDocumentTypes()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.documentTypeUuid)
                      .first
                      .name
                  : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Documentos necessários"),
          ),
        ),
        Card(
          child: ListTile(
            title: Text(
              Syncronization.getForwardedServices()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.forwardedServiceUuid)
                      .isNotEmpty
                  ? Syncronization.getForwardedServices()
                      .values
                      .where((element) =>
                          element.uuid == benificiary.forwardedServiceUuid)
                      .first
                      .name
                  : "",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text("Serviço encaminhado"),
          ),
        ),
      ],
    );
  }
}
