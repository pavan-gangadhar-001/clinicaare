import 'package:kivicare_flutter/model/doctor_dashboard_model.dart';

class AppointmentModel {
  List<UpcomingAppointment>? appointmentData;
  int? total;

  AppointmentModel({this.appointmentData, this.total});

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      appointmentData: json['data'] == null
          ? (json['data'] as List).map((i) {
              i['appointment_end_date'] = '2022-05-24';
              i['appointment_end_time'] = '12:00:00';
              i['appointment_start_date'] = '';
              i['appointment_start_time'] = '';
              i['clinic_id'] = '';
              i['clinic_name'] = '';
              i['created_at'] = '';
              i['description'] = '';
              i['appointment_report'] != null
                  ? (json['appointment_report'] as List)
                      .map((i) => AppointmentReport.fromJson(i))
                      .toList()
                  : [];
              i['doctor_id'] = '';
              i['discount_code'] = '';
              i['doctor_name'] = '';
              i['encounter_id'] = '';
              i['id'] = '';
              i['all_service_charges'] = '';
              i['patient_id'] = '';
              i['patient_name'] = '';
              i['status'] = '';
              i['visit_label'] = '';
              i['visit_type'] != null
                  ? (i['visit_type'] is String)
                      ? i['visit_type']
                      : (i['visit_type'] as List)
                          .map((i) => VisitType.fromJson(i))
                          .toList()
                  : '';
              i['zoom_data'] != null
                  ? new ZoomData.fromJson(json['zoom_data'])
                  : '';

              return UpcomingAppointment.fromJson(i);
            }).toList()
          : null,
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    if (this.appointmentData != null) {
      data['data'] = this.appointmentData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
