//
//  Color.swift
//  Component
//
//  Created by Rahmannur Rizki Syahputra on 14/11/23.
//

import UIKit
import CommonExtension

public enum Color: String {
	case primaryBlueColor = "#002060"
	case secondaryBlueColor = "#597393"
	
	/// Return the UIColor of the hex color
	public func instance() -> UIColor {
		return UIColor.init(hexString: self.rawValue) 
	}
}
