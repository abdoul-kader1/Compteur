class ServeurException implements Exception{
  final String?message;
  ServeurException([this.message]);
  @override
  String toString()=>message??"";
}