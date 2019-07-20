//
//  SupraConnectionController.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 7/2/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

import Foundation
import ReSwift
import Alamofire
import SwiftyJSON

let base_URL = "http://10.23.0.6:6502"
let all_nodes_url = base_URL + "/nodes/all"
let input_nodes_url = base_URL + "/input"
let output_nodes_url = base_URL + "/output"
let get_parameter_url = base_URL + "/parameters"
let set_parameter_url = base_URL + "/parameters"
//let supra_URL = URL(string: url)


// Supra related Functions

func getSystemStatefromSupra(){
	
}

func getValuesFromSupra() {
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
	var activeNodesArray : [String]?
	Alamofire.request( all_nodes_url , method: .get).responseJSON {
		response in
		response.result.ifSuccess {
			let json = JSON (response.result.value ?? "No Value Returned")
			let nodesArray: [String] = json["nodeIDs"].arrayValue.map({ $0.stringValue})
			DispatchQueue.main.async {
				mainStore.dispatch(RECIEVED_DATA(data:["nodeIDs": nodesArray]))
			}
		activeNodesArray = nodesArray
		}
	}
	return activeNodesArray ?? ["Couldn't Load"]
}

func getParametersForNode( node:String ){
	let requestBody : Parameters = ["nodeID": node]
	Alamofire.request( all_nodes_url , method: .post, parameters: requestBody, encoding: JSONEncoding.default).responseJSON{
		response in
		response.result.ifSuccess {
			let jsonValue = JSON (response.result.value ?? "No Value Returned")
			//let parametersForNode: [String: Any] = jsonValue.dictionaryObject!
			DispatchQueue.main.async {
				mainStore.dispatch(RECIEVED_DATA(data: jsonValue))
			}
			//print(parametersForNode)
		}
	}
}
func setParametersForNode( node:String){
	
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

