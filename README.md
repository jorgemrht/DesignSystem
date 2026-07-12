# DesignSystem

Swift Package with shared design tokens for Apple platform apps.

## Color Tokens

The color token system and app palette use Material 3 color roles from
https://m3.material.io/styles/color/roles.

The canonical token names are Material 3 role names: `primary`, `onPrimary`,
`primaryContainer`, `surface`, `surfaceContainerHigh`, `outline`, `error`,
`scrim`, `primaryFixed`, and the rest of the M3 `ColorScheme` roles. Apps should
use Swift accessors such as `Color.dsPrimary`, `Color.dsOnPrimary`,
`Color.dsSurface`, `Color.dsSurfaceContainerHigh`, or `Color.dsError` instead of
raw hex values or hue names like blue/gray/red.

Every token is a named color asset with light and dark appearances. SwiftUI
loads the color from the package bundle, so iOS resolves the correct color for
the current appearance.

The source of truth is `Sources/DesignSystem/Resources/Colors.xcassets`.

Color changes must be made in the asset catalog while keeping the public token
names stable. Apps can use the library directly through Swift Package Manager.
External tools can update the same named colors, but the package itself has no
dependency on those tools.

## Typography Scale

Text that uses `font(size:weight:)` and text inside JDesignSystem components can
be scaled from a common environment value. The standard scale preserves the
system semantic font sizes:

```swift
ContentView()
  .jdsTypographyScale(.standard)
```

Three predefined scales are available for common settings interfaces:

```swift
.jdsTypographyScale(.small)
.jdsTypographyScale(.standard)
.jdsTypographyScale(.large)
```

Apps that offer a slider or another continuous control can provide a custom
positive factor. Invalid, non-finite, and non-positive factors resolve to the
standard scale:

```swift
ContentView()
  .jdsTypographyScale(.custom(1.25))
```

The scale multiplies semantic text styles instead of replacing them with fixed
point sizes, preserving the system typographic hierarchy and accessibility
behavior. Preference storage and the settings interface remain the
responsibility of the consuming app.
