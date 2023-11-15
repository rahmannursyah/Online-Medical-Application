//
//  LoginResponse.swift
//  Domain
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation

public class LoginResponse: Codable {
	public let token: String?
	public let error: String?
}
