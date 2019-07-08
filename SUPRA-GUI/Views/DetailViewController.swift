//
//  DetailViewController.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 7/7/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//
// This View will controll whichsubview to show at a time.

import UIKit
import ReSwift

class DetailViewController: UIViewController, StoreSubscriber {
	
	override func viewWillAppear(_ animated: Bool) {
		mainStore.subscribe(self)
	}
	override func viewWillDisappear(_ animated: Bool) {
		mainStore.unsubscribe(self)
	}
	// TODO: State updated now show reflect the changes to the current active subview.
	func newState(state: AppState) {
		showCurrentMenu(currentMenu: state.currentMenu)
	}
	
	// Load sub views as lazy variables.
	
	lazy var measureViewController : MeasureViewController = {
		let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
		var viewController = storyBoard.instantiateViewController(withIdentifier: "MeasureViewController") as! MeasureViewController
		self.addChild(viewController)
		return viewController
	}()
	lazy var frequencyViewController : FrequencyViewController = {
		let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
		var viewController = storyBoard.instantiateViewController(withIdentifier: "FrequencyViewController") as! FrequencyViewController
		self.addChild(viewController)
		return viewController
	}()
	lazy var depthViewController : DepthViewController = {
		let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
		var viewController = storyBoard.instantiateViewController(withIdentifier: "DepthViewController") as! DepthViewController
		self.addChild(viewController)
		return viewController
	}()
	
	lazy var configViewController : ConfigViewController = {
		let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
		var viewController = storyBoard.instantiateViewController(withIdentifier: "ConfigViewController") as! ConfigViewController
		self.addChild(viewController)
		return viewController
	}()
	
	// Override addChild func
	override func addChild(_ childController: UIViewController) {
		super.addChild(childController)
		self.view.addSubview(childController.view)
		childController.view.frame = self.view.bounds
		childController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		childController.didMove(toParent: self)
	}
    override func viewDidLoad() {
        super.viewDidLoad()
		// Set Initial sub view to Measure.
		hideAllSubViews()
		measureViewController.view.isHidden = false
    }
	
	// Control the Menu's Behaviour
	func showCurrentMenu(currentMenu: Menus){
		switch currentMenu {
		case Menus.Measure_Menu:
			hideAllSubViews()
			measureViewController.view.isHidden = false
		case Menus.Frequency_Menu:
			hideAllSubViews()
			frequencyViewController.view.isHidden = false
		case Menus.Depth_Menu:
			hideAllSubViews()
			depthViewController.view.isHidden = false
		case Menus.Config_Menu:
			hideAllSubViews()
			configViewController.view.isHidden = false
		default:
			print("Unknown Menu requested by user.")
			break
		}
	}
	
	private func hideAllSubViews(){
		for var subview in self.view.subviews{
			subview.isHidden = true
		}
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
