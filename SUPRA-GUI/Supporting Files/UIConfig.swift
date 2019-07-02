//
//  CONSTANTS.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 6/30/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

//let GET_SYSTEM_CONFIG = "GET_SYSTEM_CONFIG"
//let SET_FREQ = "SET_FREQ"
//let GET_FREQ = "GET_FREQ"
//let SET_FILTERS = "SET_FILTERS"
import UIKit

@IBDesignable extension UIButton {
	
	@IBInspectable var borderWidth: CGFloat {
		set {
			layer.borderWidth = newValue
		}
		get {
			return layer.borderWidth
		}
	}
	
	@IBInspectable var cornerRadius: CGFloat {
		set {
			layer.cornerRadius = newValue
		}
		get {
			return layer.cornerRadius
		}
	}
	
	@IBInspectable var borderColor: UIColor? {
		set {
			guard let uiColor = newValue else { return }
			layer.borderColor = uiColor.cgColor
		}
		get {
			guard let color = layer.borderColor else { return nil }
			return UIColor(cgColor: color)
		}
	}
}
