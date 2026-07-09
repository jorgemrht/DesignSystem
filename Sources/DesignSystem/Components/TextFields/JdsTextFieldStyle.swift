import SwiftUI

public enum JdsTextFieldPresentation: Sendable, CaseIterable {
  case plain
  case tinted
  case bordered
  case underlined
}

public struct JdsTextFieldStyle: @preconcurrency TextFieldStyle {
  @Environment(\.isEnabled) private var isEnabled

  private let title: String?
  private let message: String?
  private let symbol: JdsSystemSymbol?
  private let presentation: JdsTextFieldPresentation
  private let state: JdsTextFieldState
  private let cornerRadius: CGFloat
  private let appearance: JdsTextFieldAppearance

  public init(
    title: String? = nil,
    message: String? = nil,
    symbol: JdsSystemSymbol? = nil,
    presentation: JdsTextFieldPresentation = .plain,
    state: JdsTextFieldState = .normal,
    cornerRadius: CGFloat = .cornerRadiusM,
    appearance: JdsTextFieldAppearance = .standard
  ) {
    self.title = title
    self.message = message
    self.symbol = symbol
    self.presentation = presentation
    self.state = state
    self.cornerRadius = cornerRadius
    self.appearance = appearance
  }

  @MainActor public func _body(configuration: TextField<Self._Label>) -> some View {
    VStack(alignment: .leading, spacing: .spacingXXXS) {
      if let title {
        Text(title)
          .font(.subheadline)
          .foregroundStyle(appearance.labelColor(state: state, isEnabled: isEnabled))
      }

      HStack(spacing: .spacingXXS) {
        if let symbol {
          Image(systemSymbol: symbol)
            .foregroundStyle(appearance.promptColor(isEnabled: isEnabled))
            .accessibilityHidden(true)
        }

        configuration
          .font(.body)
          .foregroundStyle(appearance.contentColor(isEnabled: isEnabled))
      }
      .padding(.horizontal, horizontalPadding)
      .frame(maxWidth: .infinity, minHeight: minHeight, alignment: .leading)
      .background {
        TextFieldBackground(
          presentation: presentation,
          state: state,
          appearance: appearance,
          cornerRadius: cornerRadius
        )
      }

      TextFieldSupportText(message: message, state: state, appearance: appearance)
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
private struct JdsTextFieldStylePreview: View {
  @State private var plain = ""
  @State private var email = "dev@jds.dev"
  @State private var query = ""

  var body: some View {
    VStack(spacing: .spacingS) {
      TextField("Name", text: $plain)
        .textFieldStyle(.JdsPlainTextField(title: "Plain"))

      TextField("Email", text: $email)
        .textFieldStyle(.JdsTintedTextField(title: "Tinted", state: .focused))

      TextField("Company", text: $plain)
        .textFieldStyle(.JdsTintedTextField(title: "Tinted square", cornerRadius: .cornerRadiusNone))

      TextField("Username", text: $plain)
        .textFieldStyle(.JdsBorderedTextField(title: "Bordered"))

      TextField("Handle", text: $plain)
        .textFieldStyle(.JdsBorderedTextField(title: "Bordered small radius", cornerRadius: .cornerRadiusS))

      TextField("Invite code", text: $plain)
        .textFieldStyle(.JdsUnderlinedTextField(title: "Underlined", message: "Invalid code", state: .error))

      TextField("Search", text: $query)
        .textFieldStyle(.JdsTintedTextField(title: "Icon", symbol: .magnifyingglass))

      TextField("Disabled", text: $plain)
        .textFieldStyle(.JdsBorderedTextField(title: "Disabled", message: "Unavailable"))
        .disabled(true)

      TextField("Custom", text: $query)
        .textFieldStyle(
          .JdsTintedTextField(
            title: "Custom appearance",
            state: .focused,
            appearance: JdsTextFieldAppearance(
              text: .dsOnTertiaryContainer,
              prompt: .dsOnSurfaceVariant,
              label: .dsOnTertiaryContainer,
              helper: .dsOnSurfaceVariant,
              container: .dsTertiaryContainer,
              indicator: .dsOutline,
              focusedIndicator: .dsTertiary,
              error: .dsError
            )
          )
        )
    }
    .padding(.spacingM)
    .frame(width: 360)
  }
}

#Preview("Text Field Light") {
  JdsTextFieldStylePreview()
    .preferredColorScheme(.light)
}

#Preview("Text Field Dark") {
  JdsTextFieldStylePreview()
    .preferredColorScheme(.dark)
}
#endif
