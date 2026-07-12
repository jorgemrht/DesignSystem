import SwiftUI

public extension View {
  func jdsTypographyScale(_ scale: JdsTypographyScale) -> some View {
    environment(\.jdsTypographyScale, scale)
  }
}
