//
//  GenomeTests.swift
//  SwiftAndJSON
//
//  Created by Cristian Arenas Ulloa on 10/24/15.
//  Copyright © 2015 Cristián Arenas Ulloa. All rights reserved.
//

import XCTest
import SwiftAndJSON
import Genome

extension Simple:StandardMappable {
	init(map: Map) throws {
		try string = <~map["s"]
	}
	func sequence(map: Map) throws {}
}
extension Nested:StandardMappable {
	init(map: Map) throws {
		try int    = <~map["i"]
		try simple = <~map["s"]
	}
	func sequence(map: Map) throws {}
}
extension Nullable:StandardMappable {
	init(map: Map) throws {
		try null    = <~?map["n"]
		try omitted = <~?map["o"]
		try value   = <~?map["v"]
	}
	func sequence(map: Map) throws {}
}

func deserializeJSONasJSON(json:String) throws -> JSON {
	let deserialized = try deserializeJSON(json)
	return deserialized as! JSON // `as!' throws?
}

class GenomeTests: XCTestCase {
	func testSimple() {
		guard
			let json = try? deserializeJSONasJSON(simpleJSON),
			let simple = try? Simple.mappedInstance(json)
			else { return XCTFail() }
		XCTAssert(simple.string == s)
	}
	
	func testNested() {
		guard
		let json = try? deserializeJSONasJSON(nestedJSON),
			let nested = try? Nested.mappedInstance(json)
			else { return XCTFail() }
		XCTAssert(nested.int == i)
		XCTAssert(nested.simple.string == s)
	}
	
	func testNullable() {
		guard
		let json = try? deserializeJSONasJSON(nullableJSON),
			let nullable = try? Nullable.mappedInstance(json)
			else { return XCTFail() }
		XCTAssert(nullable.null == nil)
		XCTAssert(nullable.omitted == nil)
		XCTAssert(nullable.value == i)
	}
}
