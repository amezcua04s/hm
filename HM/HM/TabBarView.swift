import SwiftUI

enum TabItem: Int, CaseIterable {
    case home = 0, search, map, cart, profile

    var iconName: String {
        switch self {
        case .home:    return "house"
        case .search:  return "magnifyingglass"
        case .map:     return "map"
        case .cart:    return "bag"
        case .profile: return "person"
        }
    }
}

struct TabBarView: View {
    @State private var selectedTab: TabItem = .home   

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // MARK: — Contenido
                Group {
                    switch selectedTab {
                    case .home:    HomeView()
                    case .search:  SearchView()
                    case .map:     MapView()
                    case .cart:    CartView()
                    case .profile: ProfileView()
                    }
                }
                .edgesIgnoringSafeArea(.all)

                // MARK: — Tab Bar custom
                VStack {
                    Spacer()
                    HStack {
                        ForEach(TabItem.allCases, id: \.self) { tab in
                            Spacer()
                            Button {
                                withAnimation { selectedTab = tab }
                            } label: {
                                Image(systemName: tab.iconName)
                                    .font(.system(size: 22, weight: .regular))
                                    .foregroundColor(selectedTab == tab ? .black : .gray)
                                    .frame(width: 44, height: 44)
                            }
                            Spacer()
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 12)
                    .background(
                        Color.white
                            .clipShape(Capsule())
                            .shadow(color: Color.black.opacity(0.1), radius: 8, x: 0, y: 4)
                    )
                    .padding(.horizontal, 24)
                    // aquí usamos el bottom inset que toma GeometryReader
                    .padding(.bottom,
                             (geometry.safeAreaInsets.bottom > 0
                                ? geometry.safeAreaInsets.bottom
                                : 16)
                    )
                }
            }
        }
    }
}
