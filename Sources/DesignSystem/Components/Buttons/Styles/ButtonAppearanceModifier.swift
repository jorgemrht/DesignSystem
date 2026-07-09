import SwiftUI

struct ButtonAppearanceModifier: ViewModifier {
  let appearance: JdsButtonAppearance
  let size: JdsButtonSize
  let isFullWidth: Bool
  let cornerRadius: CGFloat
  let isEnabled: Bool
  let isPressed: Bool

  func body(content: Content) -> some View {
    let shape = RoundedRectangle(cornerRadius: cornerRadius)
    let interactionState = JdsButtonInteractionState(isEnabled: isEnabled, isPressed: isPressed)
    let visualState = appearance.visualState(for: interactionState)

    content
      .font(size.labelFont)
      .multilineTextAlignment(.center)
      .foregroundStyle(visualState.foreground)
      .padding(.horizontal, size.horizontalPadding)
      .frame(maxWidth: isFullWidth ? .infinity : nil)
      .frame(minHeight: size.minHeight)
      .background {
        shape.fill(visualState.background)
      }
      .overlay {
        shape.fill(visualState.overlay)
        shape.stroke(visualState.border, lineWidth: visualState.borderWidth)
      }
      .clipShape(shape)
      .contentShape(shape)
      .shadow(
        color: visualState.shadow?.color ?? .clear,
        radius: visualState.shadow?.radius ?? 0,
        x: visualState.shadow?.x ?? 0,
        y: visualState.shadow?.y ?? 0
      )
  }
}
