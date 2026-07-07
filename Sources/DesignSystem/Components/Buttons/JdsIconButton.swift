import SwiftUI

public enum JdsIconButtonProminence: Sendable {
  case plain
  case bordered
  case borderedProminent

  var appearance: ButtonAppearance {
    switch self {
    case .plain:
      ButtonAppearance(
        foreground: .dsOnSurfaceVariant,
        container: nil,
        pressedOverlay: .dsOnSurfaceVariant,
        disabledContainer: nil
      )
    case .bordered:
      .bordered
    case .borderedProminent:
      .prominent
    }
  }
}

public struct JdsIconButtonStyle: ButtonStyle {
  @Environment(\.isEnabled) private var isEnabled

  private let prominence: JdsIconButtonProminence
  private let size: CGFloat

  public init(prominence: JdsIconButtonProminence = .plain, size: CGFloat = 44) {
    self.prominence = prominence
    self.size = max(size, 44)
  }

  public func makeBody(configuration: Configuration) -> some View {
    let appearance = prominence.appearance
    let foreground = isEnabled ? appearance.foreground : appearance.disabledForeground
    let container = isEnabled ? appearance.container : appearance.disabledContainer
    let border = isEnabled ? appearance.border : appearance.disabledBorder

    configuration.label
      .font(.title3)
      .foregroundStyle(foreground)
      .frame(width: size, height: size)
      .background {
        if let container {
          Circle().fill(container)
        }
      }
      .overlay {
        Circle()
          .fill(appearance.pressedOverlay.opacity(isEnabled && configuration.isPressed ? 0.10 : 0))
      }
      .overlay {
        if let border {
          Circle().stroke(border, lineWidth: 1)
        }
      }
      .clipShape(Circle())
      .contentShape(Circle())
  }
}

public extension ButtonStyle where Self == JdsIconButtonStyle {
  static var JdsIcon: Self { .init() }

  static func JdsIcon(
    prominence: JdsIconButtonProminence = .plain,
    size: CGFloat = 44
  ) -> Self {
    .init(prominence: prominence, size: size)
  }
}

public struct JdsIconButton: View {
  private let title: LocalizedStringKey
  private let systemImage: String
  private let prominence: JdsIconButtonProminence
  private let size: CGFloat
  private let action: () -> Void

  public init(
    _ title: LocalizedStringKey,
    systemImage: String,
    prominence: JdsIconButtonProminence = .plain,
    size: CGFloat = 44,
    action: @escaping () -> Void
  ) {
    self.title = title
    self.systemImage = systemImage
    self.prominence = prominence
    self.size = size
    self.action = action
  }

  public var body: some View {
    Button(title, systemImage: systemImage, action: action)
      .labelStyle(.iconOnly)
      .buttonStyle(.JdsIcon(prominence: prominence, size: size))
  }
}

#if DEBUG
#Preview("Icon Button") {
  HStack(spacing: .spacingS) {
    JdsIconButton("Search", systemImage: "magnifyingglass") {}
    JdsIconButton("More", systemImage: "ellipsis", prominence: .bordered) {}
    JdsIconButton("Confirm", systemImage: "checkmark", prominence: .borderedProminent) {}
    JdsIconButton("Disabled", systemImage: "xmark", prominence: .borderedProminent) {}
      .disabled(true)
  }
  .padding(.spacingM)
}
#endif
