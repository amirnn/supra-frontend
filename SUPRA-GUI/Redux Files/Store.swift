//
//  Store.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 7/2/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

import Foundation
import ReSwift

// List of Menus
enum Menus {
	case Measure_Menu
	case Frequency_Menu
	case Filters_Menu
	case Depth_Menu
	case Config_Menu
}

// Store implmentation
struct AppState: StateType {
	var frequency: Double = 0
	var filters: [String] = ["none"]
	var depth: Double = 0
	var currentMenu: Menus = Menus.Measure_Menu
	// var navigationState = NavigationState()
}

// Store Initilization
let mainStore = Store(
	reducer: appReducer,
	state: AppState(),   // You may also start with `nil`
	middleware: [])
