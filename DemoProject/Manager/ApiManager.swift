//
//  ApiManager.swift
//  DemoProject
//
//  Created by Brainwork Technologies on 17/07/2020.
//  Copyright © 2020 Advatix Inc. All rights reserved.
//

import Foundation
class ApiManager
{
    
    static let shared = ApiManager()
    
    private init()
    {
        
    }
    
    private let jsonDecoder = JSONDecoder()
    typealias dictionary = [String: Any]
    typealias array = [Any]
    
    
    enum ApiError:Error
    {
        
   case apiError
   case invalidEndPoint
   case invalidResponse
   case noData
   case decodeError
    }
    
    func callApiWithRequest<T:Decodable>(url:String,mehtod:String = "GET",comletion:@escaping(Result<T,ApiError>)-> Void)
    {
        
         let url = URL(string: url)
                var request: URLRequest = URLRequest(url: url!)
               
                request.httpMethod = mehtod
                request.timeoutInterval = 60
         
                URLSession.shared.datatask(with: request) { (result) in
                    
                    switch result{
                    case .success(let (_, data)):
      
                        do {
                            
                            let modal = try self.jsonDecoder.decode(T.self, from: data)
                            
                            comletion(.success(modal))
                            
                        }catch let parseerror
                        {
                            print(parseerror)
                            comletion(.failure(.decodeError))
                            
                        }
        
                    case .failure(_):
                        comletion(.failure(.apiError))

                    }
    
     }.resume()
    
}
    
}
extension URLSession{
   
    func  datatask(with urlRequest:URLRequest, result: @escaping (Result<(URLResponse, Data),Error>)->Void) -> URLSessionDataTask {
        return dataTask(with: urlRequest){(data, urlResponse, error) in
            
            //print("data===>",data)
            //print("response===>",urlResponse)
            //print("error===>",error)
            
            if let error = error{
                result(.failure(error))
                return
            }
            guard let urlResponse = urlResponse, let data = data else {
                let error = NSError(domain: "error", code: 0, userInfo: nil)
                result(.failure(error))
                return
            }
            result(.success((urlResponse, data)))
        }
    }
    

}
