import SwiftUI

public struct JdsSecondaryButtonStyle: ButtonStyle {
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
    self.appearance = .secondaryButton
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
  static let secondaryButton = JdsButtonAppearance(
    foreground: .dsOnSecondaryContainer,
    background: .dsSecondaryContainer,
    pressedOverlay: .dsOnSecondaryContainer,
    disabledForeground: .dsOnSecondaryContainer.opacity(0.55),
    disabledBackground: .dsSecondaryContainer.opacity(0.38)
  )
}


public extension ButtonStyle where Self == JdsSecondaryButtonStyle {
  static var JdsSecondary: Self { .init() }

  static func JdsSecondary(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false,
    cornerRadius: CGFloat = .cornerRadiusL
  ) -> Self {
    .init(size: size, isFullWidth: isFullWidth, cornerRadius: cornerRadius)
  }

  static func JdsSecondary(
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
#Preview("Secondary Button Light") {
  JdsSecondaryButtonStyleMock()
    .preferredColorScheme(.light)
}

#Preview("Secondary Button Dark") {
  JdsSecondaryButtonStyleMock()
    .preferredColorScheme(.dark)
}
#endif
