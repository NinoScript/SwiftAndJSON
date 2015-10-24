//
//  DeserializeJSON.swift
//  SwiftAndJSON
//
//  Created by Cristian Arenas Ulloa on 10/24/15.
//  Copyright © 2015 Cristián Arenas Ulloa. All rights reserved.
//

import Foundation

public func deserializeJSON(json:String) throws -> AnyObject {
	let data = json.dataUsingEncoding(NSUTF8StringEncoding)!
	let deserialized =  try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions())
	return deserialized
}
