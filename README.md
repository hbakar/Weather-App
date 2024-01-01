<h1 align=center>Merhaba, Ben Hüseyin BAKAR</h1> 

<h2 align=center>Weather App</h2> 

![WhatsApp Image 2024-01-01 at 17 05 23](https://github.com/hbakar/Weather-App/assets/7202681/c0b7d7cd-933c-4c91-9f1a-737458b7dd0b)

Weather App IOS Swift Open Weather API

* Technologies
+ MVVM Architecture ✅
+ Dependency Injection ✅
+ Protocol Oriented Programming ✅
+ Nib ✅
+ Cocoapods ✅
+ Kingfisher ✅ 
+ Alamofire Generic ✅
+ URLSession Generic ✅


* API

Ex: https://api.openweathermap.org/data/2.5/weather

```` swift
final class ServiceManager {
   
    static let shared = ServiceManager()
    
    private init() { }
    
    func fetchRequest<T: Decodable>(with endpoint: Endpoint, completion: @escaping(Result<T, Error>) ->()) {
      
        guard let request = endpoint.generateURLRequest() else {
            completion(.failure(NSError(domain: "InvalidURL", code: 0)))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(T.self, from: data)
                    completion(.success(response))
                } 
                catch {
                    completion(.failure(error))
                    return
                }
            }
            else {
                completion(.failure(NSError(domain: "No data returned", code: 0)))
                return
            }
        }
        task.resume()
    }
}
....
````
