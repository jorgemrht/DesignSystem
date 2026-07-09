import SwiftUI

public struct JdsPrimaryButtonStyle: ButtonStyle {
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
    self.appearance = .primaryButton
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

private extension JdsButtonAppearance {
  static let primaryButton = JdsButtonAppearance(
    foreground: .dsOnPrimary,
    background: .dsPrimary,
    pressedOverlay: .dsOnPrimary,
    disabledForeground: .dsOnPrimary.opacity(0.55),
    disabledBackground: .dsPrimary.opacity(0.38)
  )
}


public extension ButtonStyle where Self == JdsPrimaryButtonStyle {
  static var JdsPrimary: Self { .init() }

  static func JdsPrimary(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false,
    cornerRadius: CGFloat = .cornerRadiusL
  ) -> Self {
    .init(size: size, isFullWidth: isFullWidth, cornerRadius: cornerRadius)
  }

  static func JdsPrimary(
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

#if DEBUG
#Preview("Primary Button Light") {
  JdsPrimaryButtonStyleMock()
    .preferredColorScheme(.light)
}

#Preview("Primary Button Dark") {
  JdsPrimaryButtonStyleMock()
    .preferredColorScheme(.dark)
}
#endif
