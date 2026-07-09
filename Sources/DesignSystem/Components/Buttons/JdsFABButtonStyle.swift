import SwiftUI

public struct JdsFABButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  private let variant: JdsFABButtonVariant
  private let size: JdsFABButtonSize
  private let shadow: JdsButtonShadow?
  private let appearance: JdsButtonAppearance?

  public init(
    variant: JdsFABButtonVariant = .primary,
    size: JdsFABButtonSize = .medium,
    shadow: JdsButtonShadow? = .floating
  ) {
    self.variant = variant
    self.size = size
    self.shadow = shadow
    self.appearance = nil
  }

  public init(
    variant: JdsFABButtonVariant = .primary,
    size: JdsFABButtonSize = .medium,
    shadow: JdsButtonShadow? = .floating,
    appearance: JdsButtonAppearance
  ) {
    self.variant = variant
    self.size = size
    self.shadow = shadow
    self.appearance = appearance
  }

  public func makeBody(configuration: Configuration) -> some View {
    let appearance = appearance ?? variant.appearance
    let interactionState = JdsButtonInteractionState(
      isEnabled: isEnabled,
      isPressed: configuration.isPressed
    )
    let visualState = appearance.visualState(for: interactionState)
    let resolvedShadow = isEnabled ? shadow : nil

    configuration.label
      .labelStyle(.iconOnly)
      .font(.system(size: size.iconFont))
      .foregroundStyle(visualState.foreground)
      .frame(width: size.size, height: size.size)
      .background {
        Circle().fill(visualState.background)
      }
      .overlay {
        Circle().fill(visualState.overlay)
      }
      .clipShape(Circle())
      .contentShape(Circle())
      .shadow(
        color: resolvedShadow?.color ?? .clear,
        radius: resolvedShadow?.radius ?? 0,
        x: resolvedShadow?.x ?? 0,
        y: resolvedShadow?.y ?? 0
      )
  }
}

public extension ButtonStyle where Self == JdsFABButtonStyle {
  static var JdsFAB: Self { .init() }

  static func JdsFAB(
    variant: JdsFABButtonVariant = .primary,
    size: JdsFABButtonSize = .medium,
    shadow: JdsButtonShadow? = .floating
  ) -> Self {
    .init(variant: variant, size: size, shadow: shadow)
  }

  static func JdsFAB(
    variant: JdsFABButtonVariant = .primary,
    size: JdsFABButtonSize = .medium,
    shadow: JdsButtonShadow? = .floating,
    appearance: JdsButtonAppearance
  ) -> Self {
    .init(
      variant: variant,
      size: size,
      shadow: shadow,
      appearance: appearance
    )
  }
}

#if DEBUG
#Preview("FAB Button Light") {
  JdsFABButtonStyleMock()
    .preferredColorScheme(.light)
}

#Preview("FAB Button Dark") {
  JdsFABButtonStyleMock()
    .preferredColorScheme(.dark)
}
#endif
