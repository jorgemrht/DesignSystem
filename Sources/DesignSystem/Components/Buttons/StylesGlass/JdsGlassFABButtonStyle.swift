import SwiftUI

public struct JdsGlassFABButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  @ScaledMetric(relativeTo: .body) private var dynamicTypeScale: CGFloat = 1

  private let variant: JdsFABButtonVariant
  private let size: JdsFABButtonSize
  private let appearance: JdsButtonAppearance?

  public init(
    variant: JdsFABButtonVariant = .primary,
    size: JdsFABButtonSize = .medium
  ) {
    self.variant = variant
    self.size = size
    self.appearance = nil
  }

  public init(
    variant: JdsFABButtonVariant = .primary,
    size: JdsFABButtonSize = .medium,
    appearance: JdsButtonAppearance
  ) {
    self.variant = variant
    self.size = size
    self.appearance = appearance
  }

  public func makeBody(configuration: Configuration) -> some View {
    let appearance = appearance ?? variant.appearance
    let visualState = appearance.visualState(for: isEnabled ? .enabled : .disabled)
    let resolvedSize = size.size(scaledBy: dynamicTypeScale)
    let shape = Circle()
    let glassTint = isEnabled ? appearance.background : appearance.disabledBackground
    let glass = Glass.regular
      .tint(glassTint)
      .interactive(isEnabled)

    configuration.label
      .labelStyle(.iconOnly)
      .font(size.iconFont(scaledBy: dynamicTypeScale))
      .foregroundStyle(visualState.foreground)
      .frame(width: resolvedSize, height: resolvedSize)
      .contentShape(shape)
      .glassEffect(glass, in: shape)
  }
}

public extension ButtonStyle where Self == JdsGlassFABButtonStyle {
  static var JdsGlassFAB: Self { .init() }

  static func JdsGlassFAB(
    variant: JdsFABButtonVariant = .primary,
    size: JdsFABButtonSize = .medium
  ) -> Self {
    .init(
      variant: variant,
      size: size
    )
  }

  static func JdsGlassFAB(
    variant: JdsFABButtonVariant = .primary,
    size: JdsFABButtonSize = .medium,
    appearance: JdsButtonAppearance
  ) -> Self {
    .init(
      variant: variant,
      size: size,
      appearance: appearance
    )
  }
}
