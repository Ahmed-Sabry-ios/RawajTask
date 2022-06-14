import Foundation
import Alamofire

class APIServices {
    private init() {}
    static let instance = APIServices()
    func getData<T: Decodable, E: Decodable>(url: String, method: HTTPMethod ,params: Parameters?, encoding: ParameterEncoding ,headers: HTTPHeaders? ,completion: @escaping (T?, E?, Error?)->()) {
        
        let components = URLComponents(string:"\(Api_Router.DOMAIN_URL)\(url)")!
        let url = components.url!
        print(url)
        AF.request(url, method: method, parameters: params, encoding: encoding, headers: headers)
            .validate(statusCode: 200...300)
            .responseJSON { (response) in
   print(response)
                switch response.result {
                case .success(_):
                    guard let data = response.data else { return }
                    print("respons is ===> \(data)")
                    do {
                        print(data)
                        print(response.value)
                        let jsonData = try JSONDecoder().decode(T.self, from: data)
                        completion(jsonData, nil, nil)
                        print(jsonData)
                    } catch let jsonError {
                        print(jsonError)
                    }
                    
                case .failure(let error):
                    // switch on Error Status Code
                    guard let data = response.data else { return }
                    guard let statusCode = response.response?.statusCode else { return }
                    switch statusCode {
                    case 400..<500:
                        do {
                            print(data)
                            print(statusCode)
                            print(response.value)
                            let jsonError = try JSONDecoder().decode(E.self, from: data)
                            completion(nil, jsonError, nil)
                            print(jsonError)
                        } catch let jsonError {
                            print(jsonError)
                        }
                    default:
                        completion(nil, nil, error)
                        print(error)
                    }
                }
        }
    }
}
