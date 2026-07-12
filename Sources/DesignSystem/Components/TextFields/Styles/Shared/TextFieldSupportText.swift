import SwiftUI

struct TextFieldSupportText: View {
  let message: String?
  let state: JdsTextFieldState
  let appearance: JdsTextFieldAppearance

  @Environment(\.isEnabled) private var isEnabled

  var body: some View {
    if let message {
      Text(message)
        .font(size: .caption)
        .foregroundStyle(appearance.supportColor(state: state, isEnabled: isEnabled))
        .accessibilityLabel(state == .error ? "Error: \(message)" : message)
    }
  }
}
