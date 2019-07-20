//
//  MeasureViewController.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 7/7/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

import UIKit
import ReSwift

class MeasureViewController: UIViewController, StoreSubscriber {
	
	override func viewWillAppear(_ animated: Bool) {
		mainStore.subscribe(self)
	}
	override func viewWillDisappear(_ animated: Bool) {
		mainStore.unsubscribe(self)
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		// Do any additional setup after loading the view.
		mainStore.dispatch(GET_SYSTEM_CONFIG())
    }
	func newState(state: AppState) {
		//showCurrentMenu(currentMenu: state.currentMenu)
		updateView()
	}

	@IBOutlet weak var supraInfoLabel: UILabel!
	@IBOutlet weak var systemStateInfoLabel: UILabel!
	@IBAction func freezeButton(_ sender: UIButton) {
		mainStore.dispatch(FREEZE_IMAGE())
	}
	@IBAction func saveButton(_ sender: UIButton) {
		mainStore.dispatch(SAVE_IMAGE())
	}
	
	// MARK: Update the View and show the new details for the system
	func updateView(){
		systemStateInfoLabel.text = "Active Nodes: \(mainStore.state.activeNodes.joined(separator: ", ")) \n Frequency: \(mainStore.state.frequency) \n Filter Active: \(mainStore.state.filters.joined(separator: ", "))"
	}
	
	
	/*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
