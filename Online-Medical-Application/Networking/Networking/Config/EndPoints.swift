//
//  EndPoints.swift
//  Networking
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation

public enum AuthEndpoints {
	case Login
	
	var path: String {
		switch self {
		case .Login:
			return "/login"
		}
	}
	
	public func fullUrlStr() -> String {
		var endpoint = ""
		let urlStr = Configuration.baseDomain + path
		return urlStr
	}
}
