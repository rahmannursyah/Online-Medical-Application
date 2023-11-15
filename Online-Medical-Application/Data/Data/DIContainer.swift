//
//  DIContainer.swift
//  Data
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation

protocol DIContainerLogic {
	/// Register the service to the container
	func register<Service>(type: Service.Type, component: Any)
	/// Resolve the service by accessing the type from the container
	func resolve<Service>(type: Service.Type) -> Service?
}

public class DIContainer: DIContainerLogic {

	public static let shared = DIContainer()
	
	private init() {
		/// Make init private to ensure singleton implementation of this class
	}
	
	var services: [String: Any] = [:]
	
	public func register<Service>(type: Service.Type, component service: Any) {
		services["\(type)"] = service
	}
	
	public func resolve<Service>(type: Service.Type) -> Service? {
		return services["\(type)"] as? Service
	}
}
