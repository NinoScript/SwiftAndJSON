//
//  CommonTestData.swift
//  SwiftAndJSON
//
//  Created by Cristian Arenas Ulloa on 10/24/15.
//  Copyright © 2015 Cristián Arenas Ulloa. All rights reserved.
//

// Models
struct Simple {
	let string:String
}
struct Nested {
	let int:Int
	let simple:Simple
//	let deepValue:Int
}
struct Nullable {
	let null:Int?
	let omitted:Int?
	let value:Int?
}

// Data
let i = 123
let s = "a"

// JSON Strings
let simpleJSON = "{\"s\":\"\(s)\"}"
/* {
	"s": "a"
} */

let nestedJSON = "{\"i\":\(i), \"s\":\(simpleJSON)}"
/* {
	"i": 123,
	"s": {
		"s": "a"
	}
} */

let nullableJSON = "{\"n\":null, \"v\":\(i)}"
/* {
	"n": null,
//  "o": null,
	"v": 123
} */
