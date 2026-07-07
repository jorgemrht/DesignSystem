import SwiftUI

public extension Color {
  static let dsPrimary = Color("dsPrimary", bundle: .module)
  static let dsOnPrimary = Color("dsOnPrimary", bundle: .module)
  static let dsPrimaryContainer = Color("dsPrimaryContainer", bundle: .module)
  static let dsOnPrimaryContainer = Color("dsOnPrimaryContainer", bundle: .module)
  static let dsInversePrimary = Color("dsInversePrimary", bundle: .module)
  static let dsSecondary = Color("dsSecondary", bundle: .module)
  static let dsOnSecondary = Color("dsOnSecondary", bundle: .module)
  static let dsSecondaryContainer = Color("dsSecondaryContainer", bundle: .module)
  static let dsOnSecondaryContainer = Color("dsOnSecondaryContainer", bundle: .module)
  static let dsTertiary = Color("dsTertiary", bundle: .module)
  static let dsOnTertiary = Color("dsOnTertiary", bundle: .module)
  static let dsTertiaryContainer = Color("dsTertiaryContainer", bundle: .module)
  static let dsOnTertiaryContainer = Color("dsOnTertiaryContainer", bundle: .module)
  static let dsBackground = Color("dsBackground", bundle: .module)
  static let dsOnBackground = Color("dsOnBackground", bundle: .module)
  static let dsSurface = Color("dsSurface", bundle: .module)
  static let dsOnSurface = Color("dsOnSurface", bundle: .module)
  static let dsSurfaceVariant = Color("dsSurfaceVariant", bundle: .module)
  static let dsOnSurfaceVariant = Color("dsOnSurfaceVariant", bundle: .module)
  static let dsSurfaceTint = Color("dsSurfaceTint", bundle: .module)
  static let dsInverseSurface = Color("dsInverseSurface", bundle: .module)
  static let dsInverseOnSurface = Color("dsInverseOnSurface", bundle: .module)
  static let dsError = Color("dsError", bundle: .module)
  static let dsOnError = Color("dsOnError", bundle: .module)
  static let dsErrorContainer = Color("dsErrorContainer", bundle: .module)
  static let dsOnErrorContainer = Color("dsOnErrorContainer", bundle: .module)
  static let dsOutline = Color("dsOutline", bundle: .module)
  static let dsOutlineVariant = Color("dsOutlineVariant", bundle: .module)
  static let dsScrim = Color("dsScrim", bundle: .module)
  static let dsSurfaceBright = Color("dsSurfaceBright", bundle: .module)
  static let dsSurfaceDim = Color("dsSurfaceDim", bundle: .module)
  static let dsSurfaceContainer = Color("dsSurfaceContainer", bundle: .module)
  static let dsSurfaceContainerHigh = Color("dsSurfaceContainerHigh", bundle: .module)
  static let dsSurfaceContainerHighest = Color("dsSurfaceContainerHighest", bundle: .module)
  static let dsSurfaceContainerLow = Color("dsSurfaceContainerLow", bundle: .module)
  static let dsSurfaceContainerLowest = Color("dsSurfaceContainerLowest", bundle: .module)
  static let dsPrimaryFixed = Color("dsPrimaryFixed", bundle: .module)
  static let dsPrimaryFixedDim = Color("dsPrimaryFixedDim", bundle: .module)
  static let dsOnPrimaryFixed = Color("dsOnPrimaryFixed", bundle: .module)
  static let dsOnPrimaryFixedVariant = Color("dsOnPrimaryFixedVariant", bundle: .module)
  static let dsSecondaryFixed = Color("dsSecondaryFixed", bundle: .module)
  static let dsSecondaryFixedDim = Color("dsSecondaryFixedDim", bundle: .module)
  static let dsOnSecondaryFixed = Color("dsOnSecondaryFixed", bundle: .module)
  static let dsOnSecondaryFixedVariant = Color("dsOnSecondaryFixedVariant", bundle: .module)
  static let dsTertiaryFixed = Color("dsTertiaryFixed", bundle: .module)
  static let dsTertiaryFixedDim = Color("dsTertiaryFixedDim", bundle: .module)
  static let dsOnTertiaryFixed = Color("dsOnTertiaryFixed", bundle: .module)
  static let dsOnTertiaryFixedVariant = Color("dsOnTertiaryFixedVariant", bundle: .module)

  static let dsLabel = dsOnSurface
  static let dsSecondaryLabel = dsOnSurfaceVariant
  static let dsSystemBackground = dsBackground
  static let dsGroupedBackground = dsSurfaceContainerLow
  static let dsSeparator = dsOutlineVariant
  static let dsTint = dsPrimary
}

public extension ShapeStyle where Self == Color {
  static var dsPrimary: Self { Self("dsPrimary", bundle: .module) }
  static var dsOnPrimary: Self { Self("dsOnPrimary", bundle: .module) }
  static var dsPrimaryContainer: Self { Self("dsPrimaryContainer", bundle: .module) }
  static var dsOnPrimaryContainer: Self { Self("dsOnPrimaryContainer", bundle: .module) }
  static var dsInversePrimary: Self { Self("dsInversePrimary", bundle: .module) }
  static var dsSecondary: Self { Self("dsSecondary", bundle: .module) }
  static var dsOnSecondary: Self { Self("dsOnSecondary", bundle: .module) }
  static var dsSecondaryContainer: Self { Self("dsSecondaryContainer", bundle: .module) }
  static var dsOnSecondaryContainer: Self { Self("dsOnSecondaryContainer", bundle: .module) }
  static var dsTertiary: Self { Self("dsTertiary", bundle: .module) }
  static var dsOnTertiary: Self { Self("dsOnTertiary", bundle: .module) }
  static var dsTertiaryContainer: Self { Self("dsTertiaryContainer", bundle: .module) }
  static var dsOnTertiaryContainer: Self { Self("dsOnTertiaryContainer", bundle: .module) }
  static var dsBackground: Self { Self("dsBackground", bundle: .module) }
  static var dsOnBackground: Self { Self("dsOnBackground", bundle: .module) }
  static var dsSurface: Self { Self("dsSurface", bundle: .module) }
  static var dsOnSurface: Self { Self("dsOnSurface", bundle: .module) }
  static var dsSurfaceVariant: Self { Self("dsSurfaceVariant", bundle: .module) }
  static var dsOnSurfaceVariant: Self { Self("dsOnSurfaceVariant", bundle: .module) }
  static var dsSurfaceTint: Self { Self("dsSurfaceTint", bundle: .module) }
  static var dsInverseSurface: Self { Self("dsInverseSurface", bundle: .module) }
  static var dsInverseOnSurface: Self { Self("dsInverseOnSurface", bundle: .module) }
  static var dsError: Self { Self("dsError", bundle: .module) }
  static var dsOnError: Self { Self("dsOnError", bundle: .module) }
  static var dsErrorContainer: Self { Self("dsErrorContainer", bundle: .module) }
  static var dsOnErrorContainer: Self { Self("dsOnErrorContainer", bundle: .module) }
  static var dsOutline: Self { Self("dsOutline", bundle: .module) }
  static var dsOutlineVariant: Self { Self("dsOutlineVariant", bundle: .module) }
  static var dsScrim: Self { Self("dsScrim", bundle: .module) }
  static var dsSurfaceBright: Self { Self("dsSurfaceBright", bundle: .module) }
  static var dsSurfaceDim: Self { Self("dsSurfaceDim", bundle: .module) }
  static var dsSurfaceContainer: Self { Self("dsSurfaceContainer", bundle: .module) }
  static var dsSurfaceContainerHigh: Self { Self("dsSurfaceContainerHigh", bundle: .module) }
  static var dsSurfaceContainerHighest: Self { Self("dsSurfaceContainerHighest", bundle: .module) }
  static var dsSurfaceContainerLow: Self { Self("dsSurfaceContainerLow", bundle: .module) }
  static var dsSurfaceContainerLowest: Self { Self("dsSurfaceContainerLowest", bundle: .module) }
  static var dsPrimaryFixed: Self { Self("dsPrimaryFixed", bundle: .module) }
  static var dsPrimaryFixedDim: Self { Self("dsPrimaryFixedDim", bundle: .module) }
  static var dsOnPrimaryFixed: Self { Self("dsOnPrimaryFixed", bundle: .module) }
  static var dsOnPrimaryFixedVariant: Self { Self("dsOnPrimaryFixedVariant", bundle: .module) }
  static var dsSecondaryFixed: Self { Self("dsSecondaryFixed", bundle: .module) }
  static var dsSecondaryFixedDim: Self { Self("dsSecondaryFixedDim", bundle: .module) }
  static var dsOnSecondaryFixed: Self { Self("dsOnSecondaryFixed", bundle: .module) }
  static var dsOnSecondaryFixedVariant: Self { Self("dsOnSecondaryFixedVariant", bundle: .module) }
  static var dsTertiaryFixed: Self { Self("dsTertiaryFixed", bundle: .module) }
  static var dsTertiaryFixedDim: Self { Self("dsTertiaryFixedDim", bundle: .module) }
  static var dsOnTertiaryFixed: Self { Self("dsOnTertiaryFixed", bundle: .module) }
  static var dsOnTertiaryFixedVariant: Self { Self("dsOnTertiaryFixedVariant", bundle: .module) }

  static var dsLabel: Self { .dsOnSurface }
  static var dsSecondaryLabel: Self { .dsOnSurfaceVariant }
  static var dsSystemBackground: Self { .dsBackground }
  static var dsGroupedBackground: Self { .dsSurfaceContainerLow }
  static var dsSeparator: Self { .dsOutlineVariant }
  static var dsTint: Self { .dsPrimary }
}
