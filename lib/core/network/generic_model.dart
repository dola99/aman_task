class GenericResponse<T> {
  final T data;
  final int responseCode;
  final bool status;

  GenericResponse({
    required this.data,
    required this.responseCode,
    required this.status,
  });

  factory GenericResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return GenericResponse<T>(
      data: fromJsonT(json['data'] as Map<String, dynamic>),
      responseCode: json['status'],
      status: json['success'],
    );
  }
}

class ListResponse<T> extends GenericResponse<List<T>> {
  ListResponse({
    String? responseTextArabic,
    String? responseText,
    required List<T> data,
    required int responseCode,
    required bool status,
  }) : super(
          data: data,
          responseCode: responseCode,
          status: status,
        );

  factory ListResponse.fromJson(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) fromJsonT) {
    return ListResponse<T>(
      data: (json['data'] as List)
          .map((i) => fromJsonT(i as Map<String, dynamic>))
          .toList(),
      responseCode: json['status'],
      status: json['success'],
    );
  }
}
