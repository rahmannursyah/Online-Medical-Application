//
//  LoginRouter.swift
//  Login
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import Home

protocol LoginRouterLogic {
	func routeToHomeScreen()
}

public class LoginRouter: LoginRouterLogic {
	weak var viewController: LoginVC?
	
	func routeToHomeScreen() {
		let homeVC = HomeVC()
		viewController?.present(homeVC, animated: true)
	}
	
	
}
