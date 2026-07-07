import CoreGraphics
import SwiftUI

public enum JdsButtonSize: Sendable {
  case small
  case medium
  case large

  var minHeight: CGFloat {
    switch self {
    case .small: 44
    case .medium: 48
    case .large: 56
    }
  }

  var horizontalPadding: CGFloat {
    switch self {
    case .small: .spacingS
    case .medium: .spacingM
    case .large: .spacingL
    }
  }

  var labelFont: Font {
    switch self {
    case .small: .callout
    case .medium, .large: .body
    }
  }
}

struct ButtonShadow: Sendable {
  let color: Color
  let radius: CGFloat
  let y: CGFloat

  static let floating = ButtonShadow(
    color: .dsScrim.opacity(0.22),
    radius: 10,
    y: 4
  )
}

struct ButtonAppearance: Sendable {
  let foreground: Color
  let container: Color?
  let border: Color?
  let pressedOverlay: Color
  let disabledForeground: Color
  let disabledContainer: Color?
  let disabledBorder: Color?
  let shadow: ButtonShadow?

  init(
    foreground: Color,
    container: Color?,
    border: Color? = nil,
    pressedOverlay: Color,
    disabledForeground: Color = .dsOnSurface.opacity(0.38),
    disabledContainer: Color? = .dsOnSurface.opacity(0.12),
    disabledBorder: Color? = nil,
    shadow: ButtonShadow? = nil
  ) {
    self.foreground = foreground
    self.container = container
    self.border = border
    self.pressedOverlay = pressedOverlay
    self.disabledForeground = disabledForeground
    self.disabledContainer = disabledContainer
    self.disabledBorder = disabledBorder
    self.shadow = shadow
  }

  static let prominent = ButtonAppearance(
    foreground: .dsOnPrimary,
    container: .dsPrimary,
    pressedOverlay: .dsOnPrimary
  )

  static let standard = ButtonAppearance(
    foreground: .dsOnSecondaryContainer,
    container: .dsSecondaryContainer,
    pressedOverlay: .dsOnSecondaryContainer
  )

  static let bordered = ButtonAppearance(
    foreground: .dsPrimary,
    container: nil,
    border: .dsOutline,
    pressedOverlay: .dsPrimary,
    disabledContainer: nil,
    disabledBorder: .dsOnSurface.opacity(0.12)
  )

  static let plain = ButtonAppearance(
    foreground: .dsPrimary,
    container: nil,
    pressedOverlay: .dsPrimary,
    disabledContainer: nil
  )
}

struct ButtonAppearanceModifier: ViewModifier {
  @Environment(\.isEnabled) private var isEnabled

  let appearance: ButtonAppearance
  let size: JdsButtonSize
  let isFullWidth: Bool
  let isPressed: Bool
  let pressedOverlayOpacity: Double

  func body(content: Content) -> some View {
    let foreground = isEnabled ? appearance.foreground : appearance.disabledForeground
    let container = isEnabled ? appearance.container : appearance.disabledContainer
    let border = isEnabled ? appearance.border : appearance.disabledBorder
    let shadow = isEnabled ? appearance.shadow : nil

    content
      .font(size.labelFont)
      .multilineTextAlignment(.center)
      .foregroundStyle(foreground)
      .padding(.horizontal, size.horizontalPadding)
      .frame(maxWidth: isFullWidth ? .infinity : nil)
      .frame(minHeight: size.minHeight)
      .background {
        if let container {
          Capsule().fill(container)
        }
      }
      .overlay {
        Capsule()
          .fill(appearance.pressedOverlay.opacity(isEnabled && isPressed ? pressedOverlayOpacity : 0))
      }
      .overlay {
        if let border {
          Capsule().stroke(border, lineWidth: 1)
        }
      }
      .clipShape(Capsule())
      .contentShape(Capsule())
      .shadow(
        color: shadow?.color ?? .clear,
        radius: shadow?.radius ?? 0,
        x: 0,
        y: shadow?.y ?? 0
      )
  }
}

extension View {
  @ViewBuilder
  func buttonGlassEffect(
    tint: Color?,
    isInteractive: Bool = true,
    in shape: some Shape
  ) -> some View {
    #if os(visionOS)
    self
    #else
    glassEffect(.regular.tint(tint).interactive(isInteractive), in: shape)
    #endif
  }
}
