// https://developer.apple.com/design/human-interface-guidelines/typography
#if canImport(UIKit)
import UIKit
#elseif canImport(AppKit)
import AppKit
#endif

/// Design System: Tipografía según la HIG de Apple
public struct DSFont {
  private init() {}

  #if canImport(UIKit)
  /// Large Title — 34 pt
  /// - Dynamic Type: .largeTitle
  public static var largeTitle: UIFont {
    .preferredFont(forTextStyle: .largeTitle)
  }

  /// Title1 — 28 pt
  /// - Dynamic Type: .title1
  public static var title1: UIFont {
    .preferredFont(forTextStyle: .title1)
  }

  /// Title2 — 22 pt
  /// - Dynamic Type: .title2
  public static var title2: UIFont {
    .preferredFont(forTextStyle: .title2)
  }

  /// Title3 — 20 pt
  /// - Dynamic Type: .title3
  public static var title3: UIFont {
    .preferredFont(forTextStyle: .title3)
  }

  /// Headline — 17 pt
  /// - Dynamic Type: .headline
  public static var headline: UIFont {
    .preferredFont(forTextStyle: .headline)
  }

  /// Body — 17 pt
  /// - Dynamic Type: .body
  public static var body: UIFont {
    .preferredFont(forTextStyle: .body)
  }

  /// Callout — 16 pt
  /// - Dynamic Type: .callout
  public static var callout: UIFont {
    .preferredFont(forTextStyle: .callout)
  }

  /// Subheadline — 15 pt
  /// - Dynamic Type: .subheadline
  public static var subheadline: UIFont {
    .preferredFont(forTextStyle: .subheadline)
  }

  /// Footnote — 13 pt
  /// - Dynamic Type: .footnote
  public static var footnote: UIFont {
    .preferredFont(forTextStyle: .footnote)
  }

  /// Caption1 — 12 pt
  /// - Dynamic Type: .caption1
  public static var caption1: UIFont {
    .preferredFont(forTextStyle: .caption1)
  }

  /// Caption2 — 11 pt
  /// - Dynamic Type: .caption2
  public static var caption2: UIFont {
    .preferredFont(forTextStyle: .caption2)
  }
  #else
    /// Large Title — 34 pt
    /// - Dynamic Type: .largeTitle
    public static var largeTitle: NSFont {
        NSFont.preferredFont(forTextStyle: .largeTitle)
    }

    /// Title1 — 28 pt
    /// - Dynamic Type: .title1
    public static var title1: NSFont {
        NSFont.preferredFont(forTextStyle: .title1)
    }

    /// Title2 — 22 pt
    /// - Dynamic Type: .title2
    public static var title2: NSFont {
        NSFont.preferredFont(forTextStyle: .title2)
    }

    /// Title3 — 20 pt
    /// - Dynamic Type: .title3
    public static var title3: NSFont {
        NSFont.preferredFont(forTextStyle: .title3)
    }

    /// Headline — 17 pt (semibold)
    /// - Dynamic Type: .headline
    public static var headline: NSFont {
        NSFont.preferredFont(forTextStyle: .headline)
    }

    /// Body — 17 pt
    /// - Dynamic Type: .body
    public static var body: NSFont {
        NSFont.preferredFont(forTextStyle: .body)
    }

    /// Callout — 16 pt
    /// - Dynamic Type: .callout
    public static var callout: NSFont {
        NSFont.preferredFont(forTextStyle: .callout)
    }

    /// Subheadline — 15 pt
    /// - Dynamic Type: .subheadline
    public static var subheadline: NSFont {
        NSFont.preferredFont(forTextStyle: .subheadline)
    }

    /// Footnote — 13 pt
    /// - Dynamic Type: .footnote
    public static var footnote: NSFont {
        NSFont.preferredFont(forTextStyle: .footnote)
    }

    /// Caption1 — 12 pt
    /// - Dynamic Type: .caption1
    public static var caption1: NSFont {
        NSFont.preferredFont(forTextStyle: .caption1)
    }

    /// Caption2 — 11 pt
    /// - Dynamic Type: .caption2
    public static var caption2: NSFont {
        NSFont.preferredFont(forTextStyle: .caption2)
    }
  #endif
}
