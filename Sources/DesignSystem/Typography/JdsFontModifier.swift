import SwiftUI

struct JdsFontModifier: ViewModifier {
  @Environment(\.jdsTypographyScale) private var typographyScale

  let size: FontSize
  let weight: Font.Weight

  func body(content: Content) -> some View {
    content
      .font(
        .system(size.textStyle, design: .default)
          .scaled(by: typographyScale.factor)
      )
      .fontWeight(weight)
  }
}
