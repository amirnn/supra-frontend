//
//  ConfigViewController.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 7/8/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

import UIKit
import ReSwift

class ConfigViewController: UISplitViewController, StoreSubscriber {
	
	override func viewWillAppear(_ animated: Bool) {
		mainStore.subscribe(self)
	}
	override func viewWillDisappear(_ animated: Bool) {
		mainStore.unsubscribe(self)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
	}
	func newState(state: AppState) {
		//showCurrentMenu(currentMenu: state.currentMenu)
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
