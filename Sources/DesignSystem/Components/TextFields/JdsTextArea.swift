import SwiftUI

public struct JdsTextArea: View {
  private let title: String?
  private let placeholder: String
  private let message: String?
  private let state: JdsTextFieldState
  private let minHeight: CGFloat
  private let cornerRadius: CGFloat
  private let appearance: JdsTextFieldAppearance

  @Binding private var text: String
  @Environment(\.isEnabled) private var isEnabled

  public init(
    _ title: String? = nil,
    text: Binding<String>,
    placeholder: String = "",
    message: String? = nil,
    state: JdsTextFieldState = .normal,
    minHeight: CGFloat = 120,
    cornerRadius: CGFloat = .cornerRadiusM,
    appearance: JdsTextFieldAppearance = .standard
  ) {
    self.title = title
    self._text = text
    self.placeholder = placeholder
    self.message = message
    self.state = state
    self.minHeight = minHeight
    self.cornerRadius = cornerRadius
    self.appearance = appearance
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: .spacingXXXS) {
      if let title {
        Text(title)
          .font(.subheadline)
          .foregroundStyle(appearance.labelColor(state: state, isEnabled: isEnabled))
      }

      ZStack(alignment: .topLeading) {
        if text.isEmpty {
          Text(placeholder)
            .font(.body)
            .foregroundStyle(appearance.promptColor(isEnabled: isEnabled))
            .padding(.top, .spacingXS)
            .padding(.horizontal, .spacingS)
            .allowsHitTesting(false)
        }

        TextEditor(text: $text)
          .font(.body)
          .foregroundStyle(appearance.contentColor(isEnabled: isEnabled))
          .scrollContentBackground(.hidden)
          .padding(.horizontal, .spacingXXS)
          .padding(.vertical, .spacingXXXS)
          .frame(minHeight: minHeight)
      }
      .background {
        let shape = RoundedRectangle(cornerRadius: cornerRadius)
        let outline = appearance.outlineColor(
          state: state,
          isEnabled: isEnabled,
          presentation: .bordered
        )

        shape
          .fill(.dsSurface)
          .overlay {
            shape.stroke(outline, lineWidth: state == .focused ? 2 : 1)
          }
      }

      TextFieldSupportText(message: message, state: state, appearance: appearance)
    }
    .accessibilityElement(children: .combine)
    .accessibilityHint(accessibilityHint)
  }

  private var accessibilityHint: String {
    if state == .error, let message {
      return "Error: \(message)"
    }

    return message ?? ""
  }
}

#if DEBUG
private struct JdsTextAreaPreview: View {
  @State private var notes = ""
  @State private var errorText = "Too short"

  var body: some View {
    VStack(spacing: .spacingS) {
      JdsTextArea("Notes", text: $notes, placeholder: "Add a note")

      JdsTextArea(
        "Square notes",
        text: $notes,
        placeholder: "Add a note",
        cornerRadius: .cornerRadiusNone
      )

      JdsTextArea(
        "Feedback",
        text: $errorText,
        placeholder: "Tell us more",
        message: "Minimum 20 characters",
        state: .error,
        cornerRadius: .cornerRadiusS
      )

      JdsTextArea("Disabled", text: $notes, placeholder: "Unavailable")
        .disabled(true)

      JdsTextArea(
        "Custom",
        text: $notes,
        placeholder: "Custom appearance",
        state: .focused,
        appearance: JdsTextFieldAppearance(
          text: .dsOnTertiaryContainer,
          prompt: .dsOnSurfaceVariant,
          label: .dsOnTertiaryContainer,
          helper: .dsOnSurfaceVariant,
          container: .dsSurface,
          indicator: .dsOutline,
          focusedIndicator: .dsTertiary,
          error: .dsError
        )
      )
    }
    .padding(.spacingM)
    .background(.dsSurface)
  }
}

#Preview("Text Area Light") {
  JdsTextAreaPreview()
    .preferredColorScheme(.light)
}

#Preview("Text Area Dark") {
  JdsTextAreaPreview()
    .preferredColorScheme(.dark)
}
#endif
