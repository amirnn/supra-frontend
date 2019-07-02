//
//  Redux.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 6/28/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire
import SwiftyJSON



func appReducer(action: Action, state: AppState?) -> AppState {
	var state = state ?? AppState()
	switch action {
	// Get System Config
	case _ as GET_SYSTEM_CONFIG:
		state = getSystemConfig(state: state)
		
	// Set Parameters
	case let action as SET_FREQ:
		state = setFreq(currentState: state, freq: action.freq)
	
	// Show Different Menus
	case _ as SHOW_MEASURE_MENU:
		state = showMeasureMenu(currentState: state)
	case _ as SHOW_FREQ_MENU:
		state = showFrequencyMenu(currentState: state)
	case _ as SHOW_DEPTH_MENU:
		state = showDepthMenu(currentState: state)
	case _ as SHOW_CONFIG_MENU:
		state = showConfigMenu(currentState: state)
	// Default Behaviour
	default: break
	}
	return state
}




func getSystemConfig(state:AppState) -> AppState {
	return state
}


// Show Different Menus Reducer Implmentations
func showMeasureMenu(currentState: AppState) -> AppState {
	var newState = currentState
	newState.currentMenu = Menus.Measure_Menu
	return newState
}

func showFrequencyMenu(currentState: AppState) -> AppState {
	var newState = currentState
	newState.currentMenu = Menus.Frequency_Menu
	return newState
}

func showDepthMenu(currentState: AppState) -> AppState {
	var newState = currentState
	newState.currentMenu = Menus.Depth_Menu
	return newState
}
func showConfigMenu(currentState: AppState) -> AppState {
	var newState = currentState
	newState.currentMenu = Menus.Config_Menu
	return newState
}


// Set Reducers
func setFreq(currentState: AppState ,freq: Double) -> AppState {
	var newState = currentState
	newState.frequency = freq
	return newState
}
