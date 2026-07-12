import SwiftUI

public struct JdsTextArea: View {
  private let title: String?
  private let placeholder: String
  private let message: String?
  private let state: JdsTextFieldState
  private let minHeight: CGFloat
  private let maxLength: Int?
  private let showsCharacterCount: Bool
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
    maxLength: Int? = nil,
    showsCharacterCount: Bool = false,
    cornerRadius: CGFloat = .cornerRadiusM,
    appearance: JdsTextFieldAppearance = .standard
  ) {
    self.title = title
    self._text = text
    self.placeholder = placeholder
    self.message = message
    self.state = state
    self.minHeight = minHeight
    self.maxLength = maxLength
    self.showsCharacterCount = showsCharacterCount
    self.cornerRadius = cornerRadius
    self.appearance = appearance
  }

  public var body: some View {
    VStack(alignment: .leading, spacing: .spacingXXXS) {
      if let title {
        Text(title)
          .font(size: .subheadline)
          .foregroundStyle(appearance.labelColor(state: state, isEnabled: isEnabled))
      }

      ZStack(alignment: .topLeading) {
        if text.isEmpty {
          Text(placeholder)
            .font(size: .body)
            .foregroundStyle(appearance.promptColor(isEnabled: isEnabled))
            .padding(.top, .spacingXS)
            .padding(.horizontal, .spacingS)
            .allowsHitTesting(false)
        }

        TextEditor(text: $text)
          .font(size: .body)
          .foregroundStyle(appearance.contentColor(isEnabled: isEnabled))
          .scrollContentBackground(.hidden)
          .padding(.horizontal, .spacingXXS)
          .padding(.vertical, .spacingXXXS)
          .frame(minHeight: minHeight)
          .onChange(of: text) { _, newValue in
            guard let maxLength, newValue.count > maxLength else { return }
            text = String(newValue.prefix(maxLength))
          }
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

      HStack(alignment: .firstTextBaseline, spacing: .spacingXXS) {
        TextFieldSupportText(message: message, state: state, appearance: appearance)

        Spacer(minLength: .spacingXXS)

        if showsCharacterCount, let maxLength {
          Text("\(text.count)/\(maxLength)")
            .font(size: .caption)
            .foregroundStyle(appearance.supportColor(state: state, isEnabled: isEnabled))
        }
      }
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
#Preview("Text Area Light") {
  JdsTextAreaMock()
    .preferredColorScheme(.light)
}

#Preview("Text Area Dark") {
  JdsTextAreaMock()
    .preferredColorScheme(.dark)
}
#endif
