//: [Previous](@previous)

import Foundation

protocol Distribution {
	
	associatedtype Value
	
	func sample<G: RandomNumberGenerator>(using generator: inout G) -> Value
	func sample<G: RandomNumberGenerator>(count: Int, using generator: inout G) -> [Value]
}

extension Distribution {
	
	func sample() -> Value {
		var g = SystemRandomNumberGenerator()
		return sample(using: &g)
	}
	
	func sample(count: Int) -> [Value] {
		var g = SystemRandomNumberGenerator()
		return sample(count: count, using: &g)
	}
	
	func sample<G: RandomNumberGenerator>(count: Int, using generator: inout G) -> [Value] {
		var g = SystemRandomNumberGenerator()
		return (1...count).map { _ in sample(using: &g) }
	}
}

//////////////////////////////////////////////////////////////////////

struct UniformDistribution: Distribution {
	
	var range: ClosedRange<Int>
	
	func sample<G: RandomNumberGenerator>(using generator: inout G) -> Int {
		return Int.random(in: range, using: &generator)
	}
}

let d6 = UniformDistribution(range: 1...6)
d6.sample()
print(d6.sample())


//: [Next](@next)
