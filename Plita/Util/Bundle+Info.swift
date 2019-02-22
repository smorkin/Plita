//
//  Bundle+Info.swift
//  Plita
//
//  Created by Louis D'hauwe on 13/03/2018.
//  Copyright © 2018 Silver Fox. All rights reserved.
//  Copyright © 2019 Simon Wigzell. All rights reserved.
//

import Foundation

extension Bundle {

	public var version: String {
		return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
	}

	public var build: String {
		return object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? ""
	}

}
