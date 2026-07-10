#if DEBUG
import SwiftUI

struct JdsTextAreaMock: View {
  @State private var notes = ""
  @State private var focusedText = "Focused text"
  @State private var errorText = "Too short"

  var body: some View {
    ScrollView {
      VStack(spacing: .spacingS) {
        JdsTextArea("Normal", text: $notes, placeholder: "Add a note")

        JdsTextArea(
          "Focused",
          text: $focusedText,
          placeholder: "Add a note",
          state: .focused
        )

        JdsTextArea(
          "Square notes",
          text: $notes,
          placeholder: "Add a note",
          cornerRadius: .cornerRadiusNone
        )

        JdsTextArea(
          "Error",
          text: $errorText,
          placeholder: "Tell us more",
          message: "Minimum 20 characters",
          state: .error,
          maxLength: 120,
          showsCharacterCount: true,
          cornerRadius: .cornerRadiusS
        )

        JdsTextArea(
          "Counter",
          text: $focusedText,
          placeholder: "Tell us more",
          maxLength: 120,
          showsCharacterCount: true
        )

        JdsTextArea("Disabled", text: $notes, placeholder: "Unavailable", message: "Unavailable")
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
    }
    .background(.dsSurface)
  }
}
#endif
