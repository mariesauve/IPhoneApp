import SwiftUI
import UIKit

struct ECommView: View {
    @State var currentTab: Tab = .Home

    init() {
        UITabBar.appearance().isHidden = true
    }

    @Namespace var animation

    var body: some View {
        TabView(selection: $currentTab) {
            ImageSliderView()
  
                .tag(Tab.Home)
            ImageView()
            
                .tag(Tab.Search)
            ImageViewMore2()
            
                .tag(Tab.Notification)
            ImageViewMore()
            
                .tag(Tab.Cart)
            ImageSliderView()
        
                .tag(Tab.Profile)
        }
        .overlay(
            HStack(spacing: 0) {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    TabButton(tab: tab)
                }
            }
            .padding(.vertical)
            .padding(.bottom, getSafeArea().bottom == 0 ? 5 : (getSafeArea().bottom - 15))
                           
                .background(Color("kSecondary")),
            // custom colour that changes ^^ with light and dark themes -.background(Color("kSecondary"))
            alignment: .bottom
        )
        .ignoresSafeArea(.all, edges: .bottom)
    }

    func TabButton(tab: Tab) -> some View {
        GeometryReader { proxy in
            Button(action: {
                withAnimation(.spring()) {
                    currentTab = tab
                }
            }) {
                VStack(spacing: 0) {
                    Image(systemName: currentTab == tab ? tab.rawValue + ".fill" : tab.rawValue)
                        .resizable()
                        .foregroundColor(.white)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 35, height: 35)
                        .frame(maxWidth: .infinity)
                    ZStack {
                        if currentTab == tab {
                            MaterialEffect(style: .light)
                                .clipShape(Circle())
                                .matchedGeometryEffect(id: tab.rawValue, in: animation)
                            Text(tab.TabName)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.footnote)
                                .padding(.top, 15)
                        }
                    }
                }.contentShape(Rectangle())
                    .offset(y: currentTab == tab ? -12 : 0)
            }
        }
        .frame(height: 50)
    }
}

enum Tab: String, CaseIterable {
    case Home = "house"
    case Search = "magnifyingglass.circle"
    case Notification = "bell"
    case Cart = "bag"
    case Profile = "person"

    var TabName: String {
        switch self {
        case .Home: return "Home"
        case .Search: return "Search"
        case .Notification: return "Notify"
        case .Cart: return "Cart"
        case .Profile: return "Profile"
        }
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        guard let safeArea = screen.windows.first?.safeAreaInsets else {
            return .zero
        }
        return safeArea
    }
}

struct MaterialEffect: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // later
    }
}

#Preview {
    ECommView()
}
