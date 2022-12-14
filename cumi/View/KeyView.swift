//
//  KeyView.swift
//  cumi
//
//  Created by Piyush Pandey on 31/10/22.
//

import SwiftUI

struct KeyView: View {
	@State var value = "0"
	@State var runningValue = 0
	@State var currentOperations: Operation = .none
	@State private var changeColor = false
	
	let buttons : [[Keys]] = [
		[.clear, .negative, .percent, .divide],
		[.seven, .eight, .nine, .multiply],
		[.four, .five, .six, .sub],
		[.one, .two, .three, .add],
		[.zero, .decimal, .equal]
	]
	
	var body: some View {
		VStack {
			Spacer()
			HStack {
				RoundedRectangle(cornerRadius: 15)
					.foregroundColor(changeColor ? Color("num").opacity(0.4) : Color.purple.opacity(0.4))
					.scaleEffect(changeColor ? 1.5 : 1)
					.frame(width: 360, height: 280)
					.animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor)
//					.onAppear(perform: {self.changeColor.toggle()})
					.overlay(Text(value)
						.fontWeight(.bold)
						.font(.system(size: 100))
					)
			}.padding()
			ForEach(buttons, id: \.self) { row in
				HStack(spacing: 10) {
					ForEach(row, id: \.self) {el in
						Button {
							self.tapKey(button: el)
						} label: {
							Text(el.rawValue)
								.font(.system(size: 30))
								.frame(width: getWidth(el: el), height: getHeight(el: el))
								.foregroundColor(.black)
								.background(el.buttonColor)
								.cornerRadius(50)
								.shadow(color: el.buttonColor.opacity(0.6), radius: 6, x: 4, y: 4)
						}
					}
				}.padding(.bottom, 6)
			}
		}
	}
	
	func getWidth(el: Keys) -> CGFloat {
		if el == .zero {
			return (UIScreen.main.bounds.width - (5 * 10)) / 2
		}
		return (UIScreen.main.bounds.width - (5 * 10)) / 4
	}
	
	func getHeight(el: Keys) -> CGFloat {
		return (UIScreen.main.bounds.width + (30)) / 5
	}
	
	func tapKey(button: Keys)  {
		switch button {
			case .add, .sub, .multiply, .divide, .equal:
				if button == .add {
					self.currentOperations = .add
					self.runningValue = Int(self.value) ?? 0
				} else if button == .sub {
					self.currentOperations = .sub
					self.runningValue = Int(self.value) ?? 0
				} else if button == .multiply {
					self.currentOperations = .multiply
					self.runningValue = Int(self.value) ?? 0
				} else if button == .divide {
					self.currentOperations = .divide
					self.runningValue = Int(self.value) ?? 0
				} else if button == .equal {
					let runningValue = self.runningValue
					let currentValue = Int(self.value) ?? 0
					
					switch self.currentOperations {
						case .add:
							self.value = "\(runningValue + currentValue)"
						case .sub:
							self.value = "\(runningValue - currentValue)"
						case .multiply:
							self.value = "\(runningValue * currentValue)"
						case .divide:
							self.value = "\(runningValue / currentValue)"
						case .none:
							break
					}
				}
				if button != .equal {
					self.value = "0"
				}
			case .clear:
				self.value = "0"
			case .decimal, .negative, .percent:
				break
			default:
				let number = button.rawValue
				if self.value == "0" {
					value = number
				} else {
					self.value = "\(self.value)\(number)"
				}
		}
	}
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
