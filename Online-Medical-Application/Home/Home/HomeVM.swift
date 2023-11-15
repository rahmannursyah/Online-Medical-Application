//
//  HomeVM.swift
//  Home
//
//  Created by Rahmannur Rizki Syahputra on 15/11/23.
//

import Foundation
import Domain

protocol HomeBusinessLogic: AnyObject {
}

public class HomeVM: HomeBusinessLogic {
	
	weak var viewController: HomeDisplayLogic?
	var worker: HomeWorkerLogic?
}
