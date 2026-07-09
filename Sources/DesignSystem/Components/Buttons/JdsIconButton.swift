import SwiftUI

public struct JdsIconButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  private let prominence: JdsIconButtonProminence
  private let size: JdsIconButtonSize
  private let appearance: JdsButtonAppearance?
  private let customSize: CGFloat?
  private let customFont: Font?

  public init(
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium
  ) {
    self.prominence = prominence
    self.size = size
    self.appearance = nil
    self.customSize = nil
    self.customFont = nil
  }

  public init(
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium,
    appearance: JdsButtonAppearance,
    customSize: CGFloat? = nil,
    customFont: Font? = nil
  ) {
    self.prominence = prominence
    self.size = size
    self.appearance = appearance
    self.customSize = customSize
    self.customFont = customFont
  }

  public func makeBody(configuration: Configuration) -> some View {
    let appearance = appearance ?? prominence.appearance
    let resolvedSize = customSize ?? size.size
    let resolvedFont = customFont ?? size.iconFont
    let interactionState = JdsButtonInteractionState(
      isEnabled: isEnabled,
      isPressed: configuration.isPressed
    )
    let visualState = appearance.visualState(for: interactionState)

    configuration.label
      .font(resolvedFont)
      .foregroundStyle(visualState.foreground)
      .frame(width: resolvedSize, height: resolvedSize)
      .background {
        Circle().fill(visualState.background)
      }
      .overlay {
        Circle().fill(visualState.overlay)
        Circle().stroke(visualState.border, lineWidth: visualState.borderWidth)
      }
      .clipShape(Circle())
      .contentShape(Circle())
  }
}

public extension ButtonStyle where Self == JdsIconButtonStyle {
  static var JdsIcon: Self { .init() }

  static func JdsIcon(
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium
  ) -> Self {
    .init(prominence: prominence, size: size)
  }

  static func JdsIcon(
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium,
    appearance: JdsButtonAppearance,
    customSize: CGFloat? = nil,
    customFont: Font? = nil
  ) -> Self {
    .init(
      prominence: prominence,
      size: size,
      appearance: appearance,
      customSize: customSize,
      customFont: customFont
    )
  }
}

public struct JdsIconButton: View {
  private let title: String
  private let systemImage: String
  private let prominence: JdsIconButtonProminence
  private let size: JdsIconButtonSize
  private let appearance: JdsButtonAppearance?
  private let customSize: CGFloat?
  private let customFont: Font?
  private let isEnabled: Bool
  private let action: () -> Void

  public init(
    _ title: String,
    systemImage: String,
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium,
    isEnabled: Bool = true,
    action: @escaping () -> Void
  ) {
    self.title = title
    self.systemImage = systemImage
    self.prominence = prominence
    self.size = size
    self.appearance = nil
    self.customSize = nil
    self.customFont = nil
    self.isEnabled = isEnabled
    self.action = action
  }

  public init(
    _ title: String,
    systemImage: String,
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium,
    appearance: JdsButtonAppearance,
    customSize: CGFloat? = nil,
    customFont: Font? = nil,
    isEnabled: Bool = true,
    action: @escaping () -> Void
  ) {
    self.title = title
    self.systemImage = systemImage
    self.prominence = prominence
    self.size = size
    self.appearance = appearance
    self.customSize = customSize
    self.customFont = customFont
    self.isEnabled = isEnabled
    self.action = action
  }

  public var body: some View {
    Button(title, systemImage: systemImage, action: action)
      .labelStyle(.iconOnly)
      .buttonStyle(buttonStyle)
      .disabled(!isEnabled)
  }

  private var buttonStyle: JdsIconButtonStyle {
    if let appearance {
      .init(
        prominence: prominence,
        size: size,
        appearance: appearance,
        customSize: customSize,
        customFont: customFont
      )
    } else {
      .init(prominence: prominence, size: size)
    }
  }
}

#if DEBUG
#Preview("Icon Button Light") {
  JdsIconButtonMock()
    .preferredColorScheme(.light)
}

#Preview("Icon Button Dark") {
  JdsIconButtonMock()
    .preferredColorScheme(.dark)
}
#endif
