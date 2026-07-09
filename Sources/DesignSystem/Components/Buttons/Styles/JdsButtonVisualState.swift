import SwiftUI

struct JdsButtonVisualState {
  let foreground: Color
  let background: Color
  let border: Color
  let borderWidth: CGFloat
  let overlay: Color
  let shadow: JdsButtonShadow?
}

enum JdsButtonInteractionState {
  case enabled
  case enabledPressed
  case disabled
  case disabledPressed

  init(isEnabled: Bool, isPressed: Bool) {
    switch (isEnabled, isPressed) {
    case (true, true):
      self = .enabledPressed
    case (true, false):
      self = .enabled
    case (false, true):
      self = .disabledPressed
    case (false, false):
      self = .disabled
    }
  }
}

extension JdsButtonAppearance {
  func visualState(for interactionState: JdsButtonInteractionState) -> JdsButtonVisualState {
    let isDisabled = interactionState == .disabled || interactionState == .disabledPressed
    let resolvedForeground = if isDisabled {
      disabledForeground
    } else if interactionState == .enabledPressed {
      pressedForeground ?? foreground
    } else {
      foreground
    }
    let resolvedBackground = isDisabled ? disabledBackground : background
    let resolvedBorder = isDisabled ? disabledBorder : border
    let resolvedOverlay = interactionState == .enabledPressed
      ? pressedOverlay.opacity(pressedOverlayOpacity)
      : .clear

    return JdsButtonVisualState(
      foreground: resolvedForeground,
      background: resolvedBackground ?? .clear,
      border: resolvedBorder ?? .clear,
      borderWidth: resolvedBorder == nil ? 0 : 1,
      overlay: resolvedOverlay,
      shadow: nil
    )
  }
}
