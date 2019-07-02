//
//  ViewController.swift
//  SUPRA-GUI
//
//  Created by Amir Nourinia on 6/28/19.
//  Copyright © 2019 Amir Nourinia. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {
	
	override func viewWillAppear(_ animated: Bool) {
		mainStore.subscribe(self)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	override func viewWillDisappear(_ animated: Bool) {
		mainStore.unsubscribe(self)
	}
	
	// TODO: Highlight Active Menu Button
	func newState(state: AppState) {
		showCurrentMenu(currentMenu: state.currentMenu)
	}
	
	// MARK: OUTLETS
	@IBOutlet weak var menuLabel: UILabel!
	@IBOutlet weak var measureButton: UIButton!
	@IBOutlet weak var frequencyButton: UIButton!
	@IBOutlet weak var depthButton: UIButton!
	@IBOutlet weak var configButton: UIButton!
	
	// MARK: ACTIONS
	@IBAction func showMeasureMenu(_ sender: UIButton) {
		unsetAllHighlightColors()
		setCurrentHighlight(currentMenu: sender)
		mainStore.dispatch(SHOW_MEASURE_MENU())
	}
	
	@IBAction func showFreqMenu(_ sender: UIButton) {
		unsetAllHighlightColors()
		setCurrentHighlight(currentMenu: sender)
		mainStore.dispatch(SHOW_FREQ_MENU())
	}
	
	@IBAction func showDepthMenu(_ sender: UIButton) {
		unsetAllHighlightColors()
		setCurrentHighlight(currentMenu: sender)
		mainStore.dispatch(SHOW_DEPTH_MENU())
	}
	@IBAction func showConfigMenu(_ sender: UIButton) {
		unsetAllHighlightColors()
		setCurrentHighlight(currentMenu: sender)
		mainStore.dispatch(SHOW_CONFIG_MENU())
	}
	// set current highight
	func setCurrentHighlight (currentMenu: UIButton) {
		currentMenu.borderColor = #colorLiteral(red: 0.8509803922, green: 0.8470588235, blue: 0.4470588235, alpha: 1)
		currentMenu.setTitleColor(#colorLiteral(red: 0.8509803922, green: 0.8470588235, blue: 0.4470588235, alpha: 1), for: UIControl.State.normal)
	}
	// Unset All the highlights
	func unsetAllHighlightColors(){
		measureButton.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		measureButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
		
		frequencyButton.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		frequencyButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
		
		depthButton.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		depthButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
		
		configButton.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
		configButton.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
	}
	
	
	
	// Control the Menu's Behaviour
	func showCurrentMenu(currentMenu: Menus){
		switch currentMenu {
		case Menus.Measure_Menu:
			//TODO: Show Measure Menu
			menuLabel.text = "Frequency: \(mainStore.state.frequency) \n Filter Active: \(mainStore.state.filters.joined(separator: ", "))"
		case Menus.Frequency_Menu:
			menuLabel.text = "You pushed Frequncy Button!"
		case Menus.Depth_Menu:
			menuLabel.text = "You pushed Depth Button!"
		case Menus.Config_Menu:
			menuLabel.text = "You pushed Config Button!"
		default:
			break
		}
	}
	
}

