//: [Previous](@previous)

import Foundation

//func add<T: Numeric>(_ a: T, _ b: T) -> T {
//	return a + b
//}

//func add<T>(_ a: T, _ b: T) -> T where T: Numeric {
//	return a + b
//}

@inlinable func add<T: Numeric>(_ a: T, _ b: T) -> T {
	return a + b
}

add(3, 4)
add(UInt8(20), UInt8(33))

//: [Next](@next)
