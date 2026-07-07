import SwiftUI

public struct JdsBorderedButtonStyle: ButtonStyle {
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
          appearance: .bordered,
          size: size,
          isFullWidth: isFullWidth,
          isPressed: configuration.isPressed,
          pressedOverlayOpacity: 0.10
        )
      )
  }
}

public extension ButtonStyle where Self == JdsBorderedButtonStyle {
  static var JdsBordered: Self { .init() }

  static func JdsBordered(
    size: JdsButtonSize = .medium,
    isFullWidth: Bool = false
  ) -> Self {
    .init(size: size, isFullWidth: isFullWidth)
  }
}

#if DEBUG
#Preview("Bordered Button") {
  VStack(spacing: .spacingS) {
    Button("Bordered", systemImage: "square.and.pencil") {}
      .buttonStyle(.JdsBordered)

    Button("Full width bordered") {}
      .buttonStyle(.JdsBordered(isFullWidth: true))

    Button("Disabled") {}
      .buttonStyle(.JdsBordered)
      .disabled(true)
  }
  .padding(.spacingM)
}
#endif
