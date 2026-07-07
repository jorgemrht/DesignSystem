import SwiftUI

public struct JdsSegmentedControl<Option, SelectionValue, Label>: View
where Option: Identifiable, SelectionValue: Hashable, Label: View {
  private let title: LocalizedStringKey
  private let options: [Option]
  @Binding private var selection: SelectionValue
  private let value: (Option) -> SelectionValue
  private let label: (Option) -> Label

  public init(
    _ title: LocalizedStringKey,
    options: [Option],
    selection: Binding<SelectionValue>,
    value: @escaping (Option) -> SelectionValue,
    @ViewBuilder label: @escaping (Option) -> Label
  ) {
    self.title = title
    self.options = options
    self._selection = selection
    self.value = value
    self.label = label
  }

  public var body: some View {
    Picker(title, selection: $selection) {
      ForEach(options) { option in
        label(option)
          .tag(value(option))
      }
    }
    .pickerStyle(.segmented)
    .tint(.dsPrimary)
  }
}

#if DEBUG
private enum PreviewSegment: String, CaseIterable, Identifiable {
  case day = "Day"
  case week = "Week"
  case month = "Month"

  var id: Self { self }
}

#Preview("Segmented Control") {
  @Previewable @State var selection = PreviewSegment.day

  JdsSegmentedControl(
    "Range",
    options: PreviewSegment.allCases,
    selection: $selection,
    value: { $0 }
  ) { segment in
    Text(segment.rawValue)
  }
  .padding(.spacingM)
}
#endif
