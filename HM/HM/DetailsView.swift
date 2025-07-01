//
//  DetailsView.swift
//  DigitalH&M
//
//  Created by Facultad de Contaduría y Administración on 30/06/25.
//

import SwiftUI

// MARK: - Modelo PrendaItem


// Datos de ejemplo
let samplePrendas: [PrendaItem] = [
    PrendaItem(
        imageName: "playera",
        title: "PLAYERA LOOSE FIT CON DISEÑO",
        subtitle: "Hombre · Verano",
        price: 49.99,
        description: "Playera loose fit con diseño de flor en la espalda.",
        size: "M",
        color: "Beige"
    ),
    PrendaItem(
        imageName: "pantalon",
        title: "Pantalones Denim",
        subtitle: "Unisex · Casual",
        price: 59.99,
        description: "Pantalones denim de corte ajustado con lavado oscuro.",
        size: "32",
        color: "Azul"
    ),
    PrendaItem(
        imageName: "sudadera",
        title: "Sudadera Oversize",
        subtitle: "Mujer · Invierno",
        price: 49.99,
        description: "Sudadera oversize con capucha y bolsillos frontales.",
        size: "L",
        color: "Gris"
    )
]

// MARK: - Sección header y tarjeta horizontal

struct SectionHeader: View {
    let title: String
    var body: some View {
        HStack {
            Text(title)
                .font(.title2)
                .bold()
                .foregroundColor(Color(hex: "800020") ?? .black)
            Spacer()
        }
        .padding(.horizontal)
    }
}

struct ItemCardHorizontal: View {
    let item: PrendaItem
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(item.imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 180)
                .clipped()
                .cornerRadius(12)
            
            Text(item.title)
                .font(.subheadline)
                .lineLimit(1)
                .foregroundColor(Color(hex: "800020") ?? .black)
            Text("Talla: \(item.size)")
                .font(.caption)
                .foregroundColor(Color(hex: "800020")?.opacity(0.8) ?? .gray)
            Text("Color: \(item.color)")
                .font(.caption)
                .foregroundColor(Color(hex: "800020")?.opacity(0.8) ?? .gray)
            
            Text("$\(String(format: "%.2f", item.price))")
                .font(.subheadline)
                .foregroundColor(Color(hex: "800020") ?? .black)
        }
        .frame(width: 140)
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - View de detalle

struct DetailsView: View {
    let prenda: PrendaItem
    let recomendaciones: [PrendaItem]
    
    var body: some View {
        ZStack {
            // Fondo plano blanco
            Color.white
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 16) {
                    // Barra de navegación con búsqueda y bag
                    HStack {
                        Button(action: {}) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(Color(hex: "800020") ?? .black)
                        }
                        Spacer()
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("Buscar...", text: .constant(""))
                                .foregroundColor(Color(hex: "800020") ?? .black)
                        }
                        .padding(8)
                        .background(
                            Color.white
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
                        )
                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "bag")
                                .foregroundColor(.red)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                    
                    // Imagen principal
                    Image(prenda.imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(12)
                        .padding(.horizontal)
                    
                    // Título y subtitle
                    Text(prenda.title)
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(hex: "800020") ?? .black)
                    Text(prenda.subtitle)
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "800020")?.opacity(0.8) ?? .gray)

                    // Talla y Color
                    HStack(spacing: 16) {
                        Text("Talla: \(prenda.size)")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "800020") ?? .black)
                        Text("Color: \(prenda.color)")
                            .font(.subheadline)
                            .foregroundColor(Color(hex: "800020") ?? .black)
                    }
                    .padding(.horizontal)
                    
                    // Precio y botón añadir al bag
                    HStack {
                        Text("$\(String(format: "%.2f", prenda.price))")
                            .font(.title3)
                            .bold()
                            .foregroundColor(Color(hex: "800020") ?? .black)
                        Spacer()
                        Button(action: {}) {
                            Text("Agregar al bag")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color(hex: "800020") ?? .black)
                                .cornerRadius(8)
                        }
                    }
                    .padding(.horizontal)
                    
                    // Descripción
                    Text(prenda.description)
                        .font(.body)
                        .foregroundColor(Color(hex: "800020")?.opacity(0.9) ?? .gray)
                        .padding(.horizontal)
                    
                    // Recomendaciones
                    SectionHeader(title: "Otros similares")
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(recomendaciones) { item in
                                ItemCardHorizontal(item: item)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    Spacer(minLength: 32)
                }
            }
        }
    }
}

// MARK: - Preview

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(
            prenda: samplePrendas[0],
            recomendaciones: Array(samplePrendas.dropFirst())
        )
    }
}
