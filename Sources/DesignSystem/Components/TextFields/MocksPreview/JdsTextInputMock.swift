#if DEBUG
import SwiftUI

struct JdsTextInputMock: View {
  @State private var plain = ""
  @State private var filled = "dev@jds.dev"
  @State private var query = ""

  var body: some View {
    ScrollView {
      VStack(spacing: .spacingS) {
        TextField("Plain", text: $plain)
          .textFieldStyle(.JdsPlainTextField(title: "Plain normal"))

        TextField("Plain focused", text: $filled)
          .textFieldStyle(.JdsPlainTextField(title: "Plain focused", state: .focused))

        TextField("Plain error", text: $plain)
          .textFieldStyle(.JdsPlainTextField(title: "Plain error", message: "Invalid value", state: .error))

        TextField("Plain disabled", text: $plain)
          .textFieldStyle(.JdsPlainTextField(title: "Plain disabled", message: "Unavailable"))
          .disabled(true)

        TextField("Tinted", text: $plain)
          .textFieldStyle(.JdsTintedTextField(title: "Tinted normal"))

        TextField("Tinted focused", text: $filled)
          .textFieldStyle(.JdsTintedTextField(title: "Tinted focused", state: .focused))

        TextField("Tinted error", text: $plain)
          .textFieldStyle(.JdsTintedTextField(title: "Tinted error", message: "Invalid value", state: .error))

        TextField("Tinted disabled", text: $plain)
          .textFieldStyle(.JdsTintedTextField(title: "Tinted disabled", message: "Unavailable"))
          .disabled(true)

        TextField("Bordered", text: $plain)
          .textFieldStyle(.JdsBorderedTextField(title: "Bordered normal"))

        TextField("Bordered focused", text: $filled)
          .textFieldStyle(.JdsBorderedTextField(title: "Bordered focused", state: .focused))

        TextField("Bordered error", text: $plain)
          .textFieldStyle(.JdsBorderedTextField(title: "Bordered error", message: "Invalid value", state: .error))

        TextField("Bordered disabled", text: $plain)
          .textFieldStyle(.JdsBorderedTextField(title: "Bordered disabled", message: "Unavailable"))
          .disabled(true)

        TextField("Underlined", text: $plain)
          .textFieldStyle(.JdsUnderlinedTextField(title: "Underlined normal"))

        TextField("Underlined focused", text: $filled)
          .textFieldStyle(.JdsUnderlinedTextField(title: "Underlined focused", state: .focused))

        TextField("Underlined error", text: $plain)
          .textFieldStyle(.JdsUnderlinedTextField(title: "Underlined error", message: "Invalid value", state: .error))

        TextField("Underlined disabled", text: $plain)
          .textFieldStyle(.JdsUnderlinedTextField(title: "Underlined disabled", message: "Unavailable"))
          .disabled(true)

        TextField("Tinted square", text: $plain)
          .textFieldStyle(.JdsTintedTextField(title: "Tinted square", cornerRadius: .cornerRadiusNone))

        TextField("Bordered small radius", text: $plain)
          .textFieldStyle(.JdsBorderedTextField(title: "Bordered small radius", cornerRadius: .cornerRadiusS))

        TextField("Search", text: $query)
          .textFieldStyle(.JdsTintedTextField(title: "Icon", symbol: .magnifyingglass))

        TextField("Clearable", text: $query)
          .textFieldStyle(.JdsBorderedTextField(title: "Clearable", accessory: .clear($query)))

        SecureField("Secure", text: $query)
          .textFieldStyle(
            .JdsBorderedTextField(
              title: "Secure",
              accessory: .button(
                title: "Clear secure text",
                symbol: .xmarkCircleFill
              ) {
                query = ""
              }
            )
          )

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
    }
  }
}
#endif
