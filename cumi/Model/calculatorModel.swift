//
//  calculatorModel.swift
//  cumi
//
//  Created by Piyush Pandey on 29/10/22.
//

import Foundation
import SwiftUI

enum Keys: String {
	case zero = "0"
	case one = "1"
	case two = "2"
	case three = "3"
	case four = "4"
	case five = "5"
	case six = "6"
	case seven = "7"
	case eight = "8"
	case nine = "9"
	case add = "+"
	case sub = "-"
	case multiply = "x"
	case divide = "/"
	case equal = "="
	case clear = "AC"
	case decimal = "."
	case percent = "%"
	case negative = "-/+"
	
	var buttonColor: Color {
		switch self {
			case .add, .sub, .multiply, .divide, .equal:
				return Color("Voperator")
			case .clear, .negative, .percent:
				return Color("Hoperator")
			default:
				return Color("num")
		}
	}
}

enum Operation {
	case add, sub, multiply, divide, none
}
