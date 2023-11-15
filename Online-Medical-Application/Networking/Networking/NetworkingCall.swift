//
//  NetworkingCall.swift
//  Networking
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import Domain

public enum HttpMethod: String {
	case GET = "GET"
	case POST = "POST"
	case PUT = "PUT"
	case DELETE = "DELETE"
}

/// Protocol for networking related actions
public protocol NetworkingProtocol: AnyObject {
	/// Reusable API calls to external URL and then decode the data into a readable json according to what the user needs
	/// - Parameter urlStr: The URL in String format
	/// - Parameter intoType: The generic data type to decode the result to
	/// - Parameter error: Returns error if there's a problem during fetching or decoding
	/// - Returns a completion using escaping closure letting the called knows that the fetching and decoding process has ended
	func fetchJsonDataFromApi<T: Decodable>(urlStr: String, intoType: T.Type, method: HttpMethod, parameters: [String: Any]?, completion: @escaping (_ response: T?, _ error: Error?) -> Void)
}

public class NetworkingCall: NetworkingProtocol {
	
	public static let shared = NetworkingCall()
	
	private init() {
		/// Make init private to ensure singleton implementation of this class
	}
	
	/// Fetch data from api with generic T type
	public func fetchJsonDataFromApi<T>(urlStr: String, intoType: T.Type, method: HttpMethod, parameters: [String: Any]?, completion: @escaping (T?, Error?) -> Void) where T : Decodable {
		if let url = URL(string: urlStr) {
			var request = URLRequest(url: url)
			request.httpMethod = method.rawValue
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			request.addValue("application/json", forHTTPHeaderField: "Accept")
			
			if let parameters {
				do {
					request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
				} catch let error {
					print(error.localizedDescription)
				}
			}
			
			let task = URLSession.shared.dataTask(with: request) { data, response, error in
				if let error = error {
					completion(nil, error)
				}
				
				if let data = data {
					do {
						let decodedData = try JSONDecoder().decode(T.self, from: data)
						completion(decodedData, nil)
					} catch let error {
						completion(nil, error)
					}
				}
			}
			task.resume()
		} else {
			completion(nil, NSError(domain: "Failed to get URL from string", code: 999))
		}
	}
	
	
}
