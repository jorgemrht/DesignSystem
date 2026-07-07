import SwiftUI

public extension View {
  func jdsPadding(_ spacing: CGFloat) -> some View {
    padding(spacing)
  }

  func jdsPadding(
    top: CGFloat = 0,
    leading: CGFloat = 0,
    bottom: CGFloat = 0,
    trailing: CGFloat = 0
  ) -> some View {
    padding(.jds(top: top, leading: leading, bottom: bottom, trailing: trailing))
  }

  func jdsPadding(vertical: CGFloat, horizontal: CGFloat) -> some View {
    padding(.jds(vertical: vertical, horizontal: horizontal))
  }

  func jdsPadding(top: CGFloat = 0, bottom: CGFloat = 0, horizontal: CGFloat) -> some View {
    padding(.jds(top: top, bottom: bottom, horizontal: horizontal))
  }

  func jdsPadding(leading: CGFloat = 0, trailing: CGFloat = 0, vertical: CGFloat) -> some View {
    padding(.jds(leading: leading, trailing: trailing, vertical: vertical))
  }
}

private extension EdgeInsets {
  static func jds(
    top: CGFloat = 0,
    leading: CGFloat = 0,
    bottom: CGFloat = 0,
    trailing: CGFloat = 0
  ) -> Self {
    .init(top: top, leading: leading, bottom: bottom, trailing: trailing)
  }

  static func jds(vertical: CGFloat, horizontal: CGFloat) -> Self {
    .jds(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
  }

  static func jds(top: CGFloat = 0, bottom: CGFloat = 0, horizontal: CGFloat) -> Self {
    .jds(top: top, leading: horizontal, bottom: bottom, trailing: horizontal)
  }

  static func jds(leading: CGFloat = 0, trailing: CGFloat = 0, vertical: CGFloat) -> Self {
    .jds(top: vertical, leading: leading, bottom: vertical, trailing: trailing)
  }
}

#if DEBUG
#Preview {
  VStack(spacing: .spacingM) {
    Text("Directional")
      .font(size: .headline)
      .foregroundStyle(.dsOnPrimaryContainer)
      .jdsPadding(top: .spacingXS, leading: .spacingM, bottom: .spacingXS, trailing: .spacingL)
      .background(.dsPrimaryContainer, in: .rect(cornerRadius: .spacingXS))

    Text("Axis")
      .font(size: .headline)
      .foregroundStyle(.dsOnSecondaryContainer)
      .jdsPadding(vertical: .spacingS, horizontal: .spacingL)
      .background(.dsSecondaryContainer, in: .rect(cornerRadius: .spacingXS))
  }
  .jdsPadding(vertical: .spacingL, horizontal: .spacingM)
  .background(.dsSurface)
}
#endif
