// Kelas abstarct sebagai kontarl layer jaringan yangkemudian di implementasikan oleh kelas turunan

abstract class BaseApiService {
  // melakukan get ke endpoint dan mengembalikan data dinamis
  Future<dynamic> getGetApiResponse(String endpoint);
  // melakukan post ke endpoint dengan data tertentu dan mengembalikan data dinamis
  Future<dynamic> postApiResponse(String url, dynamic data);
}
