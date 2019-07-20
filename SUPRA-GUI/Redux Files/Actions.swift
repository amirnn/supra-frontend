//
//  Actions.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 7/2/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

import Foundation
import UIKit
import ReSwift
import SwiftyJSON



// MARK: ACTIONS
// Measure Menu Actions
struct GET_SYSTEM_CONFIG: Action {}
struct SHOW_MEASURE_MENU: Action {}
struct SAVE_IMAGE: Action{}
struct FREEZE_IMAGE: Action{}

// Frequncy Actions
struct SHOW_FREQ_MENU: Action{}
struct SET_FREQ: Action{
	var freq: Double
}

// Depth Actions
struct SHOW_DEPTH_MENU: Action{}
struct SET_DEPTH: Action {
	var depth: Double
}


// Config Actions
struct SHOW_CONFIG_MENU: Action{}
// TGC Actions
struct SHOW_TGC_MENU: Action{}
struct SET_TGC_VALUES: Action{
	var chanelOne: Double
	var chanelTwo: Double
	var chanelThree: Double
}
// FILTERS Actions
struct SHOW_FILTERS_MENU: Action {}
struct SET_FILTERS: Action{
	var filters: [String]
}

// ASYNC Actions
struct RECIEVED_DATA: Action{
	var data : JSON
}

//func data_recieved_action_creator(state:AppState, store: Store<AppState>, dataType: String, data: [String]) -> Action?{
//	switch dataType {
//	case "nodeIDs":
//		return RECIEVED_DATA(data: JSON(dictionaryLiteral: [dataType: data]))
//	default:
//		return nil
//	}
//	
//}
