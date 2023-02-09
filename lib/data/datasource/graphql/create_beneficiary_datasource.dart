
import '../../../core/error_handler.dart';
import '../../../core/inject.dart';
import '../../../domain/entity/beneficiaries/beneficiary_entity.dart';
import '../../../services/graphql.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateBeneficiaryGraphqlDatasource{

  Future<ErrorHandler<Map<String, dynamic>>> call(BeneficiaryEntity beneficiaryEntity){
   return GraphqlQueryResource.query(
    '''
         mutation createBeneficiary{
         createBeneficiary(
         full_name:"${beneficiaryEntity.fullName}"
         number_of_visits: ${beneficiaryEntity.numberOfVisits}
         birth_date:"${DateFormat('yyyy-MM-dd').format(beneficiaryEntity.birthDate).toString()}"
         phone:"${beneficiaryEntity.phone}"
         service_date:"${DateFormat('yyyy-MM-dd').format(beneficiaryEntity.serviceDate).toString()}"
         home_care:${beneficiaryEntity.homeCare}
         date_received: "${DateFormat('yyyy-MM-dd').format(beneficiaryEntity.dateReceived).toString()}"
         status:${beneficiaryEntity.status}
         other_document_type:"${beneficiaryEntity.otherDocumentType}"
         other_reason_opening_case:"${beneficiaryEntity.otherReasonOfOpeningCase}"
         other_forwarded_service:"${beneficiaryEntity.otherForwardedService}"
         specify_purpose_of_visit:"${beneficiaryEntity.specifyPurposeOfVisit}"
         visit_proposes:"${beneficiaryEntity.visitProposes}"
         genre_ulid: "${Inject.toLowerCase(beneficiaryEntity.genreEntity?.ulid.toString())}"
         provenance_ulid:"${Inject.toLowerCase(beneficiaryEntity.provenanceEntity?.ulid.toString())}"
         reason_opening_case_ulid: "${Inject.toLowerCase(beneficiaryEntity.reasonOfOpeningCaseEntity?.ulid.toString())}"
         document_type_ulid:"${Inject.toLowerCase(beneficiaryEntity.documentTypeEntity?.ulid.toString())}"
         forwarded_service_ulid: "${Inject.toLowerCase(beneficiaryEntity.forwardedServiceEntity?.ulid.toString())}"
         purpose_of_visit_ulid: "${Inject.toLowerCase(beneficiaryEntity.purposeOfVisitEntity?.ulid.toString())}"
         ){
           ulid
           full_name
           number_of_visits
           birth_date
           phone
           service_date
           home_care
           date_received
           other_document_type
           other_reason_opening_case
           other_forwarded_service
           specify_purpose_of_visit
         genre{
             ulid
             name
         }
         provenance{
             ulid
             name
         }
         document_type{
             ulid
             name
         }
         reason_opening_case{
             ulid
             name
         }
         forwarded_service{
             ulid
             name
         }
         purpose_of_visit{
             ulid
             name
         }
           visit_proposes
           status
           created_at
           updated_at
         }
      }
   '''
   );
  }
}
