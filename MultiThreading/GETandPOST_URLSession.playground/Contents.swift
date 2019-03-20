import Cocoa

var str = "Hello, playground"

var getUrl = "http://jsonplaceholder.typicode.com/posts"

func getForUrl() {
  
  // попробуем получить запрос по ссылке
  
  guard let url = URL(string: getUrl) else {return}
  
  let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    if let response = response {
      print(response)
    }
    
    guard let data = data else {return}
    
    do {
      let json = try JSONSerialization.jsonObject(with: data, options: [])
      print(json)
      
    } catch {
      print(error)
    }
    
  }
  task.resume()
}

func postMethod() {
  guard let url = URL(string: getUrl) else {return}
  var request = URLRequest(url: url)
  request.httpMethod = "POST"
  // Смотреть на ContentType из response
  // там указанно как надо конфигурировать данные
  request.addValue("application/json", forHTTPHeaderField: "Content-Type")
  let params = ["Name": "Pavel"]
  
  do {
    let httpBody = try JSONSerialization.data(withJSONObject: params, options: [])
    
    request.httpBody = httpBody
  } catch {
    print("Dont JSON Create")
  }
  
  let session = URLSession.shared
  
  session.dataTask(with: request) { (data, response, error) in
    if let response = response {
      print(response)
    }
    
    guard let data = data else {return}
    
    do {
      
      let json = try JSONSerialization.jsonObject(with: data, options: [])
      print(json)
      
    }catch {
      print(error)
    }
  }.resume()
  
  
  
}
postMethod()
