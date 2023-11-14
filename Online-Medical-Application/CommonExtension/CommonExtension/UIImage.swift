//
//  UIImage.swift
//  CommonExtension
//
//  Created by Rahmannur Rizki Syahputra on 14/11/23.
//

import UIKit

public extension UIImage {
	convenience init?(named: String, bundle: String, compatibleWith: UITraitCollection? = nil) {
		self.init(named: named, in: Bundle.init(identifier: bundle), compatibleWith: compatibleWith)
	}
}
