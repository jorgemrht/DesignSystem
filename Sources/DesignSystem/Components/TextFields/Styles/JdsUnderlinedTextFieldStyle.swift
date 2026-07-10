import SwiftUI

public extension TextFieldStyle where Self == JdsTextInput {
  static var JdsUnderlinedTextField: Self {
    .init(presentation: .underlined)
  }

  static func JdsUnderlinedTextField(
    title: String? = nil,
    message: String? = nil,
    symbol: JdsSystemSymbol? = nil,
    accessory: JdsTextFieldAccessory? = nil,
    state: JdsTextFieldState = .normal,
    cornerRadius: CGFloat = .cornerRadiusM,
    appearance: JdsTextFieldAppearance = .standard
  ) -> Self {
    .init(
      title: title,
      message: message,
      symbol: symbol,
      accessory: accessory,
      presentation: .underlined,
      state: state,
      cornerRadius: cornerRadius,
      appearance: appearance
    )
  }
}
