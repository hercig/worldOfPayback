//
//  TransactionsView.swift
//  WorldOfPAYBACK
//
//  Created by Filip Hercig on 12.10.23.
//

import SwiftUI
import Lottie

struct TransactionsView: View {

    // MARK: ViewModel

    @StateObject var viewModel: ViewModel

    // MARK: View

    var body: some View {

        switch viewModel.loadingState {
        case .loading:
            LottieView(name: Assets.Animations.loading.rawValue, loopMode: .loop)
                .frame(height: 400)

        case .success:
            NavigationStack {
                contentView
            }

        case .failed(let error):
            ErrorView(errorMessage: error) {
                viewModel.handleTryAgainButtonTap()
            }

        case .empty:
            Text("No transactions!")
        }
    }
}

// MARK: - Views

private extension TransactionsView {

    var contentView: some View {
        VStack {
            ZStack(alignment: .top) {

                transactionsListView

                Rectangle()
                    .fill(Assets.Colors.primary.swiftUIColor)
                    .frame(height: 180)
                    .ignoresSafeArea()

                VStack(alignment: .leading) {
                    Text(LocalizedStringKey(Assets.Localizable.transactions.rawValue))
                        .textCase(.uppercase)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)

                    totalPointsView
                }
                .offset(y: 20)
                .padding()
            }
        }
        .background(Assets.Colors.background.swiftUIColor)
        .sheet(isPresented: $viewModel.isFiltersViewPresented) {
            FiltersView(categoryFilters: $viewModel.categoryFilters)
        }
    }

    var transactionsListView: some View {
        List {
            Rectangle()
                .fill(Color.clear)
                .frame(height: 30)
                .listRowBackground(Color.clear)

            ForEach(viewModel.transactions, id: \.alias.reference) { transaction in
                TransactionCell(transactionModel: transaction)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                    .background(
                        NavigationLink("", destination: TransactionDetailsView(transaction: transaction))
                            .opacity(0)
                    )
            }
        }
        .listStyle(.plain)
        .padding(.top, 150)
        .scrollIndicators(.hidden)
    }

    var totalPointsView: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Total")
                    .font(.callout)
                Text("\(viewModel.transactionsSum) PBP")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(Assets.Colors.primary.swiftUIColor)
            }

            Spacer()

            filterButton
        }
        .padding()
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(radius: 10)
    }

    var filterButton: some View {
        Button {
            viewModel.isFiltersViewPresented.toggle()
        } label: {
            ZStack {
                Rectangle()
                    .fill(Assets.Colors.primary.swiftUIColor)
                    .clipShape(.circle)
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.white)
            }
        }
        .frame(width: 44, height: 44)
    }
}

// MARK: - Preview

struct TransactionsView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionsView(viewModel: .init())
    }
}
