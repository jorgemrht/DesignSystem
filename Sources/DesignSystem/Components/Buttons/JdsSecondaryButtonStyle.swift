import SwiftUI

public struct JdsSecondaryButtonStyle: ButtonStyle {
  private let size: JdsButtonSize
  private let isFullWidth: Bool

  public init(size: JdsButtonSize = .medium, isFullWidth: Bool = false) {
    self.size = size
    self.isFullWidth = isFullWidth
  }

  public func makeBody(configuration: Configuration) -> some View {
    configuration.label
      .modifier(
        ButtonAppearanceModifier(
          appearance: .standard,
          size: size,
          isFullWidth: isFullWidth,
          isPressed: configuration.isPressed,
          pressedOverlayOpacity: 0.10
        )
      )
  }
}

#if DEBUG
#Preview("Secondary Button") {
  VStack(spacing: .spacingS) {
    Button("Secondary", systemImage: "sparkles") {}
      .buttonStyle(.JdsSecondary)

    Button("Full width secondary") {}
      .buttonStyle(.JdsSecondary(isFullWidth: true))

    Button("Disabled") {}
      .buttonStyle(.JdsSecondary)
      .disabled(true)
  }
  .padding(.spacingM)
}
#endif

public extension ButtonStyle where Self == JdsSecondaryButtonStyle {
  static var JdsSecondary: Self { .init() }

  static func JdsSecondary(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false
  ) -> Self {
    .init(size: size, isFullWidth: isFullWidth)
  }
}
