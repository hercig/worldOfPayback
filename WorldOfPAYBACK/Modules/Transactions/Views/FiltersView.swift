//
//  FiltersView.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 17.10.23.
//

import SwiftUI

struct FiltersView: View {

    // MARK: Init properties

    @Binding var categoryFilters: [CategoryFilter]

    // MARK: View

    var body: some View {
        
        ZStack(alignment: .top) {
            VStack {
                headerView
                listView
            }
        }
        .background(Assets.Colors.background.swiftUIColor)
    }
}

// MARK: - Views

extension FiltersView {

    var headerView: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .fill(Assets.Colors.primary.swiftUIColor)
                .frame(height: 150)
                .shadow(radius: 8)
                .ignoresSafeArea()

            VStack(alignment: .leading) {
                Text("Filters")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("Select categories which you would like to filter")
            }
            .foregroundStyle(.white)
            .padding()
        }
    }

    var listView: some View {
        List {
            ForEach($categoryFilters, id: \.id) { $category in
                Toggle("Category \(category.categoryNumber)", isOn: $category.isActive)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
            }
            disclaimerView
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
        }
        .listStyle(.plain)
    }

    var disclaimerView: some View {
        HStack {
            Spacer()
            Text("If no category is selected, all categories will be shown.")
                .font(.caption)
                .fontWeight(.light)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

// MARK: - Preview

struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
        FiltersView(
            categoryFilters: .constant([
                .init(categoryNumber: 1),
                .init(categoryNumber: 2, isActive: true)
            ])
        )
    }
}
