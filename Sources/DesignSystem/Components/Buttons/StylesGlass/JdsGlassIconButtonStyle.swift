import SwiftUI

public struct JdsGlassIconButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled
  @ScaledMetric(relativeTo: .body) private var dynamicTypeScale: CGFloat = 1

  private let prominence: JdsIconButtonProminence
  private let size: JdsIconButtonSize
  private let appearance: JdsButtonAppearance?

  public init(
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium
  ) {
    self.prominence = prominence
    self.size = size
    self.appearance = nil
  }

  public init(
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium,
    appearance: JdsButtonAppearance
  ) {
    self.prominence = prominence
    self.size = size
    self.appearance = appearance
  }

  public func makeBody(configuration: Configuration) -> some View {
    let appearance = appearance ?? prominence.appearance
    let visualState = appearance.visualState(for: isEnabled ? .enabled : .disabled)
    let resolvedSize = size.size(scaledBy: dynamicTypeScale)
    let shape = Circle()
    let glassTint = isEnabled ? appearance.background : appearance.disabledBackground
    let glass = Glass.regular
      .tint(glassTint)
      .interactive(isEnabled)

    configuration.label
      .font(size.iconFont)
      .foregroundStyle(visualState.foreground)
      .frame(width: resolvedSize, height: resolvedSize)
      .contentShape(shape)
      .glassEffect(glass, in: shape)
  }
}

public extension ButtonStyle where Self == JdsGlassIconButtonStyle {
  static var JdsGlassIcon: Self { .init() }

  static func JdsGlassIcon(
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium
  ) -> Self {
    .init(
      prominence: prominence,
      size: size
    )
  }

  static func JdsGlassIcon(
    prominence: JdsIconButtonProminence = .plain,
    size: JdsIconButtonSize = .medium,
    appearance: JdsButtonAppearance
  ) -> Self {
    .init(
      prominence: prominence,
      size: size,
      appearance: appearance
    )
  }
}
