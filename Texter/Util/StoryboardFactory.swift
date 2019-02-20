//
//  StoryboardFactory.swift
//  Texter
//
//  Created by Louis D'hauwe on 14/03/2018.
//  Copyright © 2018 Silver Fox. All rights reserved.
//

import Foundation
import UIKit

protocol StoryboardIdentifiable {
	static var storyboardIdentifier: String { get }
}

extension UIStoryboard {
	
	static var main: MainStoryboard {
		return MainStoryboard()
	}

}

class MainStoryboard: StoryboardWrapper {
	
	let uiStoryboard: UIStoryboard
	
	init() {
		uiStoryboard = UIStoryboard(name: "Main", bundle: nil)
	}

	func documentViewController(document: Document) -> DocumentViewController {
		let vc: DocumentViewController = instantiateViewController()
		vc.document = document
		return vc
	}
	
	
}

protocol StoryboardWrapper {
	
	var uiStoryboard: UIStoryboard { get }
	
}

extension StoryboardWrapper {
	
	// MARK: - Generic
	
	// Alternatively, you could use this generic function,
	// Please note: this requires defining the UIViewController type
	// E.g.:
	// let fooVC: FooViewController = UIStoryboard.main.instantiateViewController()
	//
	// With the convenience functions, you can write:
	// let fooVC = UIStoryboard.main.fooViewController()
	
	func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
		
		guard let vc: T = instantiateViewController(withIdentifier: T.storyboardIdentifier) else {
			fatalError("Could not instantiate view controller \"\(T.self)\" for identifier: \"\(T.storyboardIdentifier)\"")
		}
		
		return vc
	}
	
	private func instantiateViewController<T: UIViewController>(withIdentifier identifier: String) -> T? {
		return uiStoryboard.instantiateViewController(withIdentifier: identifier) as? T
	}
	
}
