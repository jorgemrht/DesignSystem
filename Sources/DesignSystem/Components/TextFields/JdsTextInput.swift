import SwiftUI

public enum JdsTextFieldPresentation: Sendable, CaseIterable {
  case plain
  case tinted
  case bordered
  case underlined
}

public struct JdsTextInput: @preconcurrency TextFieldStyle {
  @Environment(\.isEnabled) private var isEnabled
  @Environment(\.isFocused) private var isFocused

  private let title: String?
  private let message: String?
  private let symbol: JdsSystemSymbol?
  private let accessory: JdsTextFieldAccessory?
  private let presentation: JdsTextFieldPresentation
  private let state: JdsTextFieldState
  private let cornerRadius: CGFloat
  private let appearance: JdsTextFieldAppearance

  public init(
    title: String? = nil,
    message: String? = nil,
    symbol: JdsSystemSymbol? = nil,
    accessory: JdsTextFieldAccessory? = nil,
    presentation: JdsTextFieldPresentation = .plain,
    state: JdsTextFieldState = .normal,
    cornerRadius: CGFloat = .cornerRadiusM,
    appearance: JdsTextFieldAppearance = .standard
  ) {
    self.title = title
    self.message = message
    self.symbol = symbol
    self.accessory = accessory
    self.presentation = presentation
    self.state = state
    self.cornerRadius = cornerRadius
    self.appearance = appearance
  }

  @MainActor public func _body(configuration: TextField<Self._Label>) -> some View {
    let resolvedState = resolvedState

    VStack(alignment: .leading, spacing: .spacingXXXS) {
      if let title {
        Text(title)
          .font(size: .subheadline)
          .foregroundStyle(appearance.labelColor(state: resolvedState, isEnabled: isEnabled))
      }

      HStack(spacing: .spacingXXS) {
        if let symbol {
          Image(systemSymbol: symbol)
            .foregroundStyle(appearance.promptColor(isEnabled: isEnabled))
            .accessibilityHidden(true)
        }

        configuration
          .font(size: .body)
          .foregroundStyle(appearance.contentColor(isEnabled: isEnabled))

        if let accessory {
          JdsTextFieldAccessoryView(accessory: accessory, appearance: appearance)
        }
      }
      .padding(.horizontal, horizontalPadding)
      .frame(maxWidth: .infinity, minHeight: minHeight, alignment: .leading)
      .background {
        TextFieldBackground(
          presentation: presentation,
          state: resolvedState,
          appearance: appearance,
          cornerRadius: cornerRadius
        )
      }

      TextFieldSupportText(message: message, state: resolvedState, appearance: appearance)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .accessibilityElement(children: .combine)
    .accessibilityHint(accessibilityHint)
  }

  private var horizontalPadding: CGFloat {
    switch presentation {
    case .plain, .underlined:
      return 0
    case .tinted, .bordered:
      return .spacingS
    }
  }

  private var minHeight: CGFloat {
    switch presentation {
    case .plain, .underlined:
      return 44
    case .tinted, .bordered:
      return 52
    }
  }

  private var accessibilityHint: String {
    if state == .error, let message {
      return "Error: \(message)"
    }

    return message ?? ""
  }

  private var resolvedState: JdsTextFieldState {
    state == .error ? .error : (isFocused ? .focused : state)
  }
}

private struct TextFieldBackground: View {
  @Environment(\.isEnabled) private var isEnabled

  let presentation: JdsTextFieldPresentation
  let state: JdsTextFieldState
  let appearance: JdsTextFieldAppearance
  let cornerRadius: CGFloat

  var body: some View {
    let outline = appearance.outlineColor(
      state: state,
      isEnabled: isEnabled,
      presentation: presentation
    )

    switch presentation {
    case .plain:
      Color.clear

    case .tinted:
      let shape = RoundedRectangle(cornerRadius: cornerRadius)

      shape
        .fill(appearance.containerColor(isEnabled: isEnabled))
        .overlay(alignment: .bottom) {
          Rectangle()
            .fill(outline)
            .frame(height: state == .focused ? 2 : 1)
        }

    case .bordered:
      let shape = RoundedRectangle(cornerRadius: cornerRadius)

      shape
        .fill(.dsSurface)
        .overlay {
          shape.stroke(outline, lineWidth: state == .focused ? 2 : 1)
        }

    case .underlined:
      Rectangle()
        .fill(outline)
        .frame(height: state == .focused ? 2 : 1)
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
  }
}

#if DEBUG
#Preview("Text Field Light") {
  JdsTextInputMock()
    .preferredColorScheme(.light)
}

#Preview("Text Field Dark") {
  JdsTextInputMock()
    .preferredColorScheme(.dark)
}
#endif
