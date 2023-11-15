//
//  LoginWorker.swift
//  Login
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import Data
import Networking
import Domain
import CommonExtension

protocol LoginWorkerLogic: AnyObject {
	func submitLogin(request: LoginRequest)
}

public class LoginWorker: LoginWorkerLogic {
	weak var vm: LoginBusinessLogic?
	
	private let networkingCallInstance = DIContainer.shared.resolve(type: NetworkingProtocol.self)
	
	func submitLogin(request: LoginRequest) {
		networkingCallInstance?.fetchJsonDataFromApi(urlStr: AuthEndpoints.Login.fullUrlStr(), intoType: LoginResponse.self, method: .POST, parameters: request.toDictionary(), completion: { [weak self] response, error in
			if let response = response {
				/// Call successful but got error message from response
				if let errorMsg = response.error {
					self?.vm?.didFailedCallLogin(errorMsg: errorMsg)
				} else {
					/// No error message
					self?.vm?.didSuccessCallLogin()
				}
			} else {
				self?.vm?.didFailedCallLogin(errorMsg: error?.localizedDescription ?? "")
			}
		})
	}
}
