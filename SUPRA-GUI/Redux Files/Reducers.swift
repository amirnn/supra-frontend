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

struct AppState: StateType {
	// ... app state properties here ...
	var frequency: Float = 0
	var count: Int = 0
	var filters: [String]
	var depth: Float = 0
	// var navigationState = NavigationState()
}



func appReducer(action: Action, state: AppState?) -> AppState {
	var state = state ?? AppState(frequency: 0, count: 0, filters: ["none"], depth: 0)
	switch action {
	case _ as GET_SYSTEM_CONFIG:
		state = getSystemConfig(state: state)
	case let action as SET_FREQ:
		state = setFreq(state: state, freq: action.freq)
	default: break
	}
	return state
}




func getSystemConfig(state:AppState) -> AppState {
	return state
}

func setFreq(state: AppState ,freq: Float) -> AppState {
	//TODO:
	var newState = state
	newState.frequency = freq
	return state
}
