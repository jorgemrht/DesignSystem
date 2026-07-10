import SwiftUI

public struct JdsButtonAppearance: Sendable {
  public static let disabledForeground = Color.dsOnSurface.opacity(0.38)
  public static let disabledBackground = Color.dsOnSurface.opacity(0.12)
  public static let disabledBorder = Color.dsOnSurface.opacity(0.12)

  public let foreground: Color
  public let pressedForeground: Color?
  public let background: Color?
  public let border: Color?
  public let pressedOverlay: Color
  public let pressedOverlayOpacity: Double
  public let disabledForeground: Color
  public let disabledBackground: Color?
  public let disabledBorder: Color?

  public init(
    foreground: Color,
    pressedForeground: Color? = nil,
    background: Color?,
    border: Color? = nil,
    pressedOverlay: Color,
    pressedOverlayOpacity: Double = 0.10,
    disabledForeground: Color = JdsButtonAppearance.disabledForeground,
    disabledBackground: Color? = JdsButtonAppearance.disabledBackground,
    disabledBorder: Color? = nil
  ) {
    self.foreground = foreground
    self.pressedForeground = pressedForeground
    self.background = background
    self.border = border
    self.pressedOverlay = pressedOverlay
    self.pressedOverlayOpacity = pressedOverlayOpacity
    self.disabledForeground = disabledForeground
    self.disabledBackground = disabledBackground
    self.disabledBorder = disabledBorder
  }
}
