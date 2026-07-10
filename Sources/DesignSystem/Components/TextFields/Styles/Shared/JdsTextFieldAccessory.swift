import SwiftUI

public enum JdsTextFieldAccessory {
  case clearButton(title: String, isVisible: Bool, action: () -> Void)
  case systemImage(JdsSystemSymbol)
  case button(title: String, symbol: JdsSystemSymbol, action: () -> Void)
  case text(String)

  public static func clear(
    _ text: Binding<String>,
    title: String = "Clear text"
  ) -> Self {
    .clearButton(title: title, isVisible: !text.wrappedValue.isEmpty) {
      text.wrappedValue = ""
    }
  }
}
