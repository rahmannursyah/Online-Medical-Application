//
//  Encodable.swift
//  CommonExtension
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation

public extension Encodable {
	func toDictionary() -> [String: Any] {
		do {
			let data = try JSONEncoder().encode(self)
			let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]
			return dict ?? [:]
		} catch {
			return [:]
		}
	}
}
