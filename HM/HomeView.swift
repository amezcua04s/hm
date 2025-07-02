//
//  HomeView.swift
//  DigitalH&M
//
//  Created by Facultad de Contaduría y Administración on 01/07/25.
//

import SwiftUI

// MARK: — Modelos

struct Offer: Identifiable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
}

struct PrendaItem: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let title: String
    let subtitle: String
    let price: Double
    let description: String
    let size: String
    let color: String
}

// MARK: — Ejemplos únicos

private let sampleOffer = Offer(
    imageName: "oferta1",
    title: "Regreso a clases",
    subtitle: "¡Hasta -70%!"
)

private let samplePrenda = PrendaItem(
    imageName: "playera",
    title: "Playera Loose Fit",
    subtitle: "Hombre · Verano",
    price: 399.00,
    description: "Playera Loose Fit con bordado especial en la espalda.",
    size: "M",
    color: "Beige"
)
private let samplePantalon = PrendaItem(
    imageName: "pantalon",
    title: "Pantalones Denim",
    subtitle: "Unisex · Casual",
    price: 59.99,
    description: "Pantalones denim de corte ajustado con lavado oscuro.",
    size: "32",
    color: "Azul"
)

// MARK: — HomeView

struct HomeView: View {
    @State private var currentOfferIndex = 0
    @State private var currentFeaturedIndex = 0
    @State private var currentRecentIndex = 0

    private let offers = Array(repeating: sampleOffer, count: 5)
    private let featuredPrendas = Array(repeating: samplePrenda, count: 5)
    private let recentlyViewedPrendas = Array(repeating: samplePrenda, count: 3)

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white
                    .ignoresSafeArea()

                ScrollView {
                    VStack(spacing: 32) {
                        // —— Carrusel principal de ofertas
                        OfferCarouselView(offers: offers, currentIndex: $currentOfferIndex)
                            .frame(height: 300)

                        // —— Carrusel de prendas destacadas
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Prendas destacadas")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color(hex: "800020") ?? .black)
                                .padding(.horizontal)

                            PrendaCarouselView(prendas: featuredPrendas, currentIndex: $currentFeaturedIndex)
                                .frame(height: 260)
                        }

                        // —— Carrusel "Vistos recientemente"
                        VStack(alignment: .leading, spacing: 16) {
                            Text("Vistos recientemente")
                                .font(.title2)
                                .bold()
                                .foregroundColor(Color(hex: "800020") ?? .black)
                                .padding(.horizontal)

                            PrendaCarouselView(prendas: recentlyViewedPrendas, currentIndex: $currentRecentIndex)
                                .frame(height: 260)
                        }

                        Spacer(minLength: 32)
                    }
                    .padding(.top)
                }
            }
            .navigationTitle("Inicio")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(for: PrendaItem.self) { prenda in
                DetailsView(
                    prenda: prenda,
                    recomendaciones: featuredPrendas.filter { $0.id != prenda.id }
                )
            }
        }
    }
}

// MARK: — Subviews

struct OfferCarouselView: View {
    let offers: [Offer]
    @Binding var currentIndex: Int

    var body: some View {
        GeometryReader { geo in
            TabView(selection: $currentIndex) {
                ForEach(Array(offers.enumerated()), id: \.1.id) { idx, offer in
                    VStack(spacing: 12) {
                        Image(offer.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: geo.size.width * 0.8,
                                   height: geo.size.height * 0.6)
                            .clipped()
                            .cornerRadius(12)

                        Text(offer.title)
                            .font(.headline)
                            .bold()
                            .foregroundColor(Color(hex: "800020") ?? .black)

                        Text(offer.subtitle)
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(Color(hex: "800020") ?? .black)
                    }
                    .frame(width: geo.size.width * 0.8,
                           height: geo.size.height * 0.8)
                    .background(Color.white)
                    .cornerRadius(16)
                    .shadow(color: (Color(hex: "800020") ?? .black).opacity(0.1),
                            radius: 5, x: 0, y: 4)
                    .rotationEffect(.degrees(90))
                    .tag(idx)
                }
            }
            .frame(width: geo.size.width,
                   height: geo.size.height)
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .rotationEffect(.degrees(-90))
        }
    }
}

struct PrendaCarouselView: View {
    let prendas: [PrendaItem]
    @Binding var currentIndex: Int

    var body: some View {
        TabView(selection: $currentIndex) {
            ForEach(Array(prendas.enumerated()), id: \.1.id) { idx, prenda in
                NavigationLink(value: prenda) {
                    VStack(alignment: .leading, spacing: 8) {
                        Image(prenda.imageName)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 200)
                            .clipped()
                            .cornerRadius(12)

                        Text(prenda.title)
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(Color(hex: "800020") ?? .black)

                        Text(String(format: "$%.2f", prenda.price))
                            .font(.subheadline)
                            .bold()
                            .foregroundColor(Color(hex: "800020") ?? .black)
                    }
                    .background(Color.white)
                    .cornerRadius(12)
                    .shadow(color: (Color(hex: "800020") ?? .black).opacity(0.1),
                            radius: 4, x: 0, y: 2)
                    .padding(.vertical)
                }
                .tag(idx)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

// MARK: — Preview

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
