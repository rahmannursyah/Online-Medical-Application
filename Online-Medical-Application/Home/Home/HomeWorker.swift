//
//  HomeWorker.swift
//  Home
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import Data
import Networking

protocol HomeWorkerLogic: AnyObject {
}

public class HomeWorker: HomeWorkerLogic {
	weak var vm: HomeBusinessLogic?
	
	private let networkingCallInstance = DIContainer.shared.resolve(type: NetworkingProtocol.self)
}
