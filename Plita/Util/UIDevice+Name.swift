//
//  UIDevice+Name.swift
//  Plita
//
//  Created by Louis D'hauwe on 13/03/2018.
//  Copyright © 2018 Silver Fox. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {

	public var modelName: String {
		var systemInfo = utsname()
		uname(&systemInfo)
		let machineMirror = Mirror(reflecting: systemInfo.machine)
		let identifier = machineMirror.children.reduce("") { identifier, element in
			guard let value = element.value as? Int8, value != 0 else { return identifier }
			return identifier + String(UnicodeScalar(UInt8(value)))
		}
		return identifier
	}
}
