//
//  SupraConnectionController.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 7/2/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

let base_URL = "http://10.23.0.97:6502"
let all_nodes_url = base_URL + "/nodes/all"
let get_parameter_url = base_URL + ""
//let supra_URL = URL(string: url)


// Supra related Functions
func getValuesFromSupra(){
	Alamofire.request(base_URL).responseJSON{
		response in
		print("Result: \(response.result)")
		if response.result.isSuccess {
			let json = JSON (response.result.value ?? "No Value Returned")
			print(json.array?.joined() ?? "No Nodes are avtive.")
		}
	}
}
func getRunningNodesFromSupra() -> [String] {
	var returnValue : [String] = ["Unable to load Nodes."]
	Alamofire.request( all_nodes_url , method: .get).responseJSON{
		response in
		response.result.ifSuccess {
			let json = JSON (response.result.value ?? "No Value Returned")
			let nodesArray: [String] = json["nodeIDs"].arrayValue.map({ $0.stringValue})
			print(nodesArray)
			returnValue = nodesArray
			}
	}
	return returnValue
}

func setValuesInSupra(nodeID: String){
	let parameters: Parameters = [
		"nodeID" : nodeID
	]
	Alamofire.request( all_nodes_url , method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON{ response in
		response.result.ifSuccess {
			let json = JSON()
		}
	}
}

