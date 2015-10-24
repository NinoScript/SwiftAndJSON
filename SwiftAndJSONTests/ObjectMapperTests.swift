//
//  ObjectMapperTests.swift
//  SwiftAndJSON
//
//  Created by Cristian Arenas Ulloa on 10/24/15.
//  Copyright © 2015 Cristián Arenas Ulloa. All rights reserved.
//

import XCTest
import ObjectMapper

extension Simple:Mappable {
	init?(_ map: Map) {
		string = map["s"].valueOrFail()
	}
	func mapping(map: Map) {}
}
extension Nested:Mappable {
	init?(_ map: Map) {
//		guard let s = Mapper<Simple>().map(map["s"]) else { return nil }
		int    = map["i"].valueOrFail()
		simple = map["s"].valueOrFail()
	}
	func mapping(map: Map) {}
}
extension Nullable:Mappable {
	init?(_ map: Map) {
		null    = map["n"].valueOrFail()
		omitted = map["o"].valueOrFail()
		value   = map["v"].valueOrFail()
	}
	func mapping(map: Map) {}
}

class ObjectMapperTests: XCTestCase {
	func testSimple() {
		guard let simple = Mapper<Simple>().map(simpleJSON)
			else { return XCTFail() }
		XCTAssert(simple.string == s)
	}
	
	func testNested() {
		guard let nested = Mapper<Nested>().map(nestedJSON)
			else { return XCTFail() }
		XCTAssert(nested.int == i)
		XCTAssert(nested.simple.string == s)
	}
	
	func testNullable() {
		guard let nullable = Mapper<Nullable>().map(nullableJSON)
			else { return XCTFail() }
		XCTAssert(nullable.null == nil)
		XCTAssert(nullable.omitted == nil)
		XCTAssert(nullable.value == i)
	}
}
