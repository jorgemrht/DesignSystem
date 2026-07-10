import SwiftUI

public extension TextFieldStyle where Self == JdsTextInput {
  static var JdsTintedTextField: Self {
    .init(presentation: .tinted)
  }

  static func JdsTintedTextField(
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
      presentation: .tinted,
      state: state,
      cornerRadius: cornerRadius,
      appearance: appearance
    )
  }
}
