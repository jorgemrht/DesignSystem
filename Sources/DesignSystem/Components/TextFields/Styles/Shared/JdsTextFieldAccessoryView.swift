import SwiftUI

struct JdsTextFieldAccessoryView: View {
  let accessory: JdsTextFieldAccessory
  let appearance: JdsTextFieldAppearance

  @Environment(\.isEnabled) private var isEnabled

  var body: some View {
    switch accessory {
    case let .clearButton(title, isVisible, action):
      Button(title, systemImage: JdsSystemSymbol.xmarkCircleFill.rawValue) {
        action()
      }
      .labelStyle(.iconOnly)
      .buttonStyle(.plain)
      .frame(minWidth: 44, minHeight: 44)
      .foregroundStyle(appearance.promptColor(isEnabled: isEnabled))
      .opacity(isVisible ? 1 : 0)
      .disabled(!isVisible)

    case let .systemImage(symbol):
      Image(systemSymbol: symbol)
        .foregroundStyle(appearance.promptColor(isEnabled: isEnabled))
        .accessibilityHidden(true)

    case let .button(title, symbol, action):
      Button(title, systemImage: symbol.rawValue, action: action)
        .labelStyle(.iconOnly)
        .buttonStyle(.plain)
        .frame(minWidth: 44, minHeight: 44)
        .foregroundStyle(appearance.promptColor(isEnabled: isEnabled))

    case let .text(text):
      Text(text)
        .font(size: .body)
        .foregroundStyle(appearance.promptColor(isEnabled: isEnabled))
    }
  }
}
