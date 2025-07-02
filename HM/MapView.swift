//
//  MapView.swift
//  DigitalH&M
//
//  Created by Facultad de Contaduría y Administración on 02/07/25.
//

import SwiftUI
import MapKit

// MARK: - Modelos

/// Punto de tienda
typealias Coordinate = CLLocationCoordinate2D

struct Store: Identifiable, Equatable, Hashable {
    let id = UUID()
    let coordinate: Coordinate

    static func == (lhs: Store, rhs: Store) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

/// Representa una ciudad con varias ubicaciones de tiendas
struct City: Identifiable, Equatable, Hashable {
    let id = UUID()
    let name: String
    let coordinate: Coordinate
    let stores: [Store]

    static func == (lhs: City, rhs: City) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Datos de ejemplo de ciudades

private let cities: [City] = [
    City(
        name: "CDMX",
        coordinate: Coordinate(latitude: 19.432608, longitude: -99.133209),
        stores: [
            Store(coordinate: Coordinate(latitude: 19.432608, longitude: -99.133209)),
            Store(coordinate: Coordinate(latitude: 19.435, longitude: -99.140)),
            Store(coordinate: Coordinate(latitude: 19.428, longitude: -99.125))
        ]
    ),
    City(
        name: "Monterrey",
        coordinate: Coordinate(latitude: 25.686614, longitude: -100.316113),
        stores: [
            Store(coordinate: Coordinate(latitude: 25.686614, longitude: -100.316113)),
            Store(coordinate: Coordinate(latitude: 25.690, longitude: -100.320)),
            Store(coordinate: Coordinate(latitude: 25.683, longitude: -100.310))
        ]
    ),
    City(
        name: "Yucatán",
        coordinate: Coordinate(latitude: 20.967370, longitude: -89.592586),
        stores: [
            Store(coordinate: Coordinate(latitude: 20.967370, longitude: -89.592586)),
            Store(coordinate: Coordinate(latitude: 20.970, longitude: -89.600)),
            Store(coordinate: Coordinate(latitude: 20.960, longitude: -89.580))
        ]
    ),
    City(
        name: "Veracruz",
        coordinate: Coordinate(latitude: 19.173773, longitude: -96.134224),
        stores: [
            Store(coordinate: Coordinate(latitude: 19.173773, longitude: -96.134224)),
            Store(coordinate: Coordinate(latitude: 19.180, longitude: -96.140)),
            Store(coordinate: Coordinate(latitude: 19.168, longitude: -96.130))
        ]
    ),
    City(
        name: "Sinaloa",
        coordinate: Coordinate(latitude: 24.809059, longitude: -107.394012),
        stores: [
            Store(coordinate: Coordinate(latitude: 24.809059, longitude: -107.394012)),
            Store(coordinate: Coordinate(latitude: 24.815, longitude: -107.400)),
            Store(coordinate: Coordinate(latitude: 24.805, longitude: -107.385))
        ]
    )
]

// MARK: - MapView

struct MapView: View {
    @State private var selectedCity: City = cities.first!
    @State private var region: MKCoordinateRegion

    init() {
        // Inicializa la región centrada en la primera ciudad
        let center = cities.first!.coordinate
        _region = State(initialValue: MKCoordinateRegion(
            center: center,
            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
        ))
    }

    var body: some View {
        VStack(spacing: 0) {
            // Selector de ciudades
            Picker("Ciudad", selection: $selectedCity) {
                ForEach(cities) { city in
                    Text(city.name).tag(city)
                }
            }
            .pickerStyle(.segmented)
            .padding()
            .onChange(of: selectedCity) { newCity in
                // Actualiza la región al cambiar ciudad
                withAnimation {
                    region.center = newCity.coordinate
                }
            }

            // Mapa con marcadores de tiendas
            Map(
                coordinateRegion: $region,
                annotationItems: selectedCity.stores
            ) { store in
                MapMarker(
                    coordinate: store.coordinate,
                    tint: Color(hex: "800020") ?? .red
                )
            }
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

// MARK: - Preview

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
