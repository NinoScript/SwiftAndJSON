//
//  ManualJSONTests.swift
//  SwiftAndJSON
//
//  Created by Cristian Arenas Ulloa on 10/24/15.
//  Copyright © 2015 Cristián Arenas Ulloa. All rights reserved.
//

import XCTest
@testable import SwiftAndJSON

extension Simple:ManualJSON {
	init(any: AnyObject) throws {
		guard
			let dict = any as? [String:AnyObject],
			let s = dict["s"] as? String
			else { throw JsonError.error }
		
		string = s
	}
}
extension Nested:ManualJSON {
	init(any: AnyObject) throws {
		guard
			let dict = any as? [String:AnyObject],
			let i = dict["i"] as? Int,
			let s = dict["s"]
			else { throw JsonError.error }
		
		int = i
		simple = try Simple(any: s)
	}
}
extension Nullable:ManualJSON {
	init(any: AnyObject) throws {
		guard
			let dict = any as? [String:AnyObject]
			else { throw JsonError.error }
		
		if let n = dict["n"] as? Int? {
			null = n
		} else {
			null = nil
		}
		
		if let o = dict["o"] as? Int? {
			omitted = o
		} else {
			omitted = nil
		}
		
		if let v = dict["v"] as? Int? {
			value = v
		} else {
			value = nil
		}
	}
}

class ManualJSONTests: XCTestCase {
	func testSimple() {
		guard let simple = try? Simple(json: simpleJSON)
			else { return XCTFail() }
		XCTAssert(simple.string == s)
	}
	
	func testNested() {
		guard let nested = try? Nested(json: nestedJSON)
			else { return XCTFail() }
		XCTAssert(nested.int == i)
		XCTAssert(nested.simple.string == s)
	}
	
	func testNullable() {
		guard let nullable = try? Nullable(json: nullableJSON)
			else { return XCTFail() }
		XCTAssert(nullable.null == nil)
		XCTAssert(nullable.omitted == nil)
		XCTAssert(nullable.value == i)
	}
}
