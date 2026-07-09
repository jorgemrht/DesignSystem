import SwiftUI

public struct JdsBorderedButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  private let size: JdsButtonSize
  private let isFullWidth: Bool
  private let cornerRadius: CGFloat
  private let appearance: JdsButtonAppearance

  public init(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false,
    cornerRadius: CGFloat = .cornerRadiusL
  ) {
    self.size = size
    self.isFullWidth = isFullWidth
    self.cornerRadius = cornerRadius
    self.appearance = .borderedButton
  }

  public init(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false,
    cornerRadius: CGFloat = .cornerRadiusL,
    appearance: JdsButtonAppearance
  ) {
    self.size = size
    self.isFullWidth = isFullWidth
    self.cornerRadius = cornerRadius
    self.appearance = appearance
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .modifier(
        ButtonAppearanceModifier(
          appearance: appearance,
          size: size,
          isFullWidth: isFullWidth,
          cornerRadius: cornerRadius,
          isEnabled: isEnabled,
          isPressed: configuration.isPressed
        )
      )
  }
}

public extension ButtonStyle where Self == JdsBorderedButtonStyle {
  static var JdsBordered: Self { .init() }

  static func JdsBordered(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false,
    cornerRadius: CGFloat = .cornerRadiusL
  ) -> Self {
    .init(size: size, isFullWidth: isFullWidth, cornerRadius: cornerRadius)
  }

  static func JdsBordered(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false,
    cornerRadius: CGFloat = .cornerRadiusL,
    appearance: JdsButtonAppearance
  ) -> Self {
    .init(
      size: size,
      isFullWidth: isFullWidth,
      cornerRadius: cornerRadius,
      appearance: appearance
    )
  }
}

private extension JdsButtonAppearance {
  static let borderedButton = JdsButtonAppearance(
    foreground: .dsPrimary,
    background: nil,
    border: .dsOutline,
    pressedOverlay: .dsPrimary,
    disabledForeground: .dsPrimary.opacity(0.38),
    disabledBackground: nil,
    disabledBorder: .dsPrimary.opacity(0.24)
  )
}

#if DEBUG
#Preview("Bordered Button Light") {
  JdsBorderedButtonStyleMock()
    .preferredColorScheme(.light)
}

#Preview("Bordered Button Dark") {
  JdsBorderedButtonStyleMock()
    .preferredColorScheme(.dark)
}
#endif
