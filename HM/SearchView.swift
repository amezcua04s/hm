//
//  SearchView.swift
//  DigitalH&M
//
//  Created by Facultad de Contaduría y Administración on 01/07/25.
//

import SwiftUI

// MARK: — Modelo y datos de ejemplo para la búsqueda


// Ejemplos por categoría
private let samplePrendaHombre = PrendaItem(
    imageName: "playera",
    title: "Playera Loose Fit",
    subtitle: "Hombre · Verano",
    price: 399.00,
    description: "Playera Loose Fit con bordado especial en la espalda.",
    size: "M",
    color: "Beige"
)
private let samplePrendaMujer = PrendaItem(
    imageName: "blusa",
    title: "Blusa Floral",
    subtitle: "Mujer · Verano",
    price: 499.00,
    description: "Blusa ligera con estampado floral.",
    size: "S",
    color: "Rosa"
)
private let samplePrendaBebe = PrendaItem(
    imageName: "body_bebe",
    title: "Body Bebé",
    subtitle: "Bebé · Algodón",
    price: 199.00,
    description: "Body de algodón suave para bebés.",
    size: "6M",
    color: "Blanco"
)
private let samplePrendaUnisex = PrendaItem(
    imageName: "sudadera",
    title: "Sudadera Oversize",
    subtitle: "Unisex · Invierno",
    price: 799.00,
    description: "Sudadera oversize con capucha y bolsillos.",
    size: "L",
    color: "Gris"
)

// Diccionario para mapear categorías
private let itemsByCategory: [String: [PrendaItem]] = [
    "Hombre": Array(repeating: samplePrendaHombre, count: 10),
    "Mujer": Array(repeating: samplePrendaMujer, count: 8),
    "Bebé": Array(repeating: samplePrendaBebe, count: 6),
    "Unisex": Array(repeating: samplePrendaUnisex, count: 5),
]

struct SearchView: View {
    @State private var selectedCategory: String? = nil
    private let categories = ["Hombre", "Mujer", "Bebé", "Unisex"]

    var body: some View {
        NavigationStack {
            ZStack {
                Color.white.ignoresSafeArea()

                VStack {
                    if let category = selectedCategory {
                        // Resultados filtrados
                        HStack {
                            Button("Cancelar") {
                                selectedCategory = nil
                            }
                            .font(.headline).bold()
                            .foregroundColor(Color(hex: "800020") ?? .black)

                            Spacer()

                            Text(category)
                                .font(.title2).bold()
                                .foregroundColor(Color(hex: "800020") ?? .black)

                            Spacer()
                        }
                        .padding()

                        // Grid de resultados de la categoría
                        ScrollView {
                            LazyVGrid(
                                columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
                                spacing: 16
                            ) {
                                ForEach(itemsByCategory[category] ?? [], id: \ .self) { prenda in
                                    NavigationLink(value: prenda) {
                                        ItemCardHorizontal(item: prenda)
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                    } else {
                        // Pantalla de selección de categoría
                        VStack(spacing: 24) {
                            Text("Selecciona una categoría")
                                .font(.title2).bold()
                                .foregroundColor(Color(hex: "800020") ?? .black)

                            ForEach(categories, id: \.self) { cat in
                                Button(cat) {
                                    selectedCategory = cat
                                }
                                .font(.headline).bold()
                                .foregroundColor(Color(hex: "800020") ?? .black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(Color(hex: "800020") ?? .black, lineWidth: 2)
                                )
                                .shadow(color: (Color(hex: "800020") ?? .black).opacity(0.1), radius: 4, x: 0, y: 2)
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 64)
                        Spacer()
                    }
                }
            }
            .navigationDestination(for: PrendaItem.self) { prenda in
                DetailsView(
                    prenda: prenda,
                    recomendaciones: (itemsByCategory[selectedCategory ?? ""] ?? []).filter { $0.id != prenda.id }
                )
            }
        }
    }
}

// MARK: - Preview

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
