//
//  LoginRequest.swift
//  Domain
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation

public class LoginRequest: Codable {
	public let email: String?
	public let password: String?
	
	public init(email: String?, password: String?) {
		self.email = email
		self.password = password
	}
}
