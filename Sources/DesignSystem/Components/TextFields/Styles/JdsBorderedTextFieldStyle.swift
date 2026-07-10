import SwiftUI

public extension TextFieldStyle where Self == JdsTextInput {
  static var JdsBorderedTextField: Self {
    .init(presentation: .bordered)
  }

  static func JdsBorderedTextField(
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
      presentation: .bordered,
      state: state,
      cornerRadius: cornerRadius,
      appearance: appearance
    )
  }
}
