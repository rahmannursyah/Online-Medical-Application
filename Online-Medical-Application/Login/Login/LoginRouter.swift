//
//  LoginRouter.swift
//  Login
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation

protocol LoginRouterLogic {
	func routeToHomeScreen()
}

public class LoginRouter: LoginRouterLogic {
	weak var viewController: LoginDisplayLogic?
	
	func routeToHomeScreen() {
		// todo
	}
	
	
}
