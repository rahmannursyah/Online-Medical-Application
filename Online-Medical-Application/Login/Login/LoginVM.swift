//
//  LoginVM.swift
//  Login
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import Domain

protocol LoginBusinessLogic: AnyObject {
	func login(email: String, password: String)
	func didSuccessCallLogin()
	func didFailedCallLogin(errorMsg: String)
}

public class LoginVM: LoginBusinessLogic {
	
	weak var viewController: LoginDisplayLogic?
	var worker: LoginWorkerLogic?
	
	func login(email: String, password: String) {
		worker?.submitLogin(request: LoginRequest(email: email, password: password))
	}
	
	func didSuccessCallLogin() {
		viewController?.didSuccessLogin()
	}
	
	func didFailedCallLogin(errorMsg: String) {
		viewController?.didFailedLogin(errorMsg: errorMsg)
	}
}
