import SwiftUI

public extension View {
  func JdsListBackgroundColor(_ color: Color) -> some View {
    scrollContentBackground(.hidden)
      .background(color)
  }
}

#if DEBUG
#Preview {
  Form {
    Section {
      Text("Primary surface")
        .foregroundStyle(.dsOnSurface)

      Text("Secondary surface")
        .foregroundStyle(.dsOnSurfaceVariant)
    }
  }
  .JdsListBackgroundColor(.dsSurface)
}
#endif
