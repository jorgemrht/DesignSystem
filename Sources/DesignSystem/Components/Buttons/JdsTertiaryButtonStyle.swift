import SwiftUI

public struct JdsTertiaryButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  private let size: JdsButtonSize
  private let isFullWidth: Bool
  private let appearance: JdsButtonAppearance

  public init(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false
  ) {
    self.size = size
    self.isFullWidth = isFullWidth
    self.appearance = .tertiaryButton
  }

  public init(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false,
    appearance: JdsButtonAppearance
  ) {
    self.size = size
    self.isFullWidth = isFullWidth
    self.appearance = appearance
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .modifier(
        ButtonAppearanceModifier(
          appearance: appearance,
          size: size,
          isFullWidth: isFullWidth,
          cornerRadius: .cornerRadiusM,
          isEnabled: isEnabled,
          isPressed: configuration.isPressed
        )
      )
  }
}

private extension JdsButtonAppearance {
  static let tertiaryButton = JdsButtonAppearance(
    foreground: .dsPrimary,
    pressedForeground: .dsPrimary.opacity(0.70),
    background: nil,
    pressedOverlay: .clear,
    pressedOverlayOpacity: 0,
    disabledForeground: .dsPrimary.opacity(0.38),
    disabledBackground: nil
  )
}


public extension ButtonStyle where Self == JdsTertiaryButtonStyle {
  static var JdsTertiary: Self { .init() }

  static func JdsTertiary(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false
  ) -> Self {
    .init(size: size, isFullWidth: isFullWidth)
  }

  static func JdsTertiary(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false,
    appearance: JdsButtonAppearance
  ) -> Self {
    .init(
      size: size,
      isFullWidth: isFullWidth,
      appearance: appearance
    )
  }
}

#if DEBUG
#Preview("Tertiary Button Light") {
  JdsTertiaryButtonStyleMock()
    .preferredColorScheme(.light)
}

#Preview("Tertiary Button Dark") {
  JdsTertiaryButtonStyleMock()
    .preferredColorScheme(.dark)
}
#endif
