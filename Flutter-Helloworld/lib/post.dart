import 'dart:convert';

import 'package:http/http.dart' as http;

class Apidata
{
  Uri urllink= Uri.parse("http://localhost:8080/hello");

  Future getdata() async
  {
    final res= await http.get(urllink);
 
  
  if (res.statusCode==200)
  {
    
     return json.decode(res.body);
    
  }
  else
  {
    return "error";
  }
    

  }
  
  
}
