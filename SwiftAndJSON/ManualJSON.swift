//
//  ManualJSON.swift
//  SwiftAndJSON
//
//  Created by Cristian Arenas Ulloa on 10/24/15.
//  Copyright © 2015 Cristián Arenas Ulloa. All rights reserved.
//
import Cocoa

protocol ManualJSON {
	init(json:String) throws
	init(any:AnyObject) throws
}
extension ManualJSON {
	init(json:String) throws {
		try self.init(any:deserializeJSON(json))
	}
}
enum JsonError: ErrorType {
	case error
}
