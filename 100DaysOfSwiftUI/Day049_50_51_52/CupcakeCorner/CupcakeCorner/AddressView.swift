//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Dhiraj KC on 2025-06-16.
//

import SwiftUI

struct AddressView: View {
    @Bindable var order: Order
    
    var body: some View {
        Form {
            Section {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetAddress)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            .onAppear() {
                if let loadedOrder = loadOrderFromUserDefaults() {
                        order.name = loadedOrder.name
                        order.streetAddress = loadedOrder.streetAddress
                        order.city = loadedOrder.city
                        order.zip = loadedOrder.zip
                    }
            }
            
            Section {
                NavigationLink("Check Out") {
                    CheckoutView(order: order)
                }
            }
            .disabled(order.hasValidAddress == false)
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func loadOrderFromUserDefaults() -> Order? {
        if let savedOrder = UserDefaults.standard.data(forKey: "SavedOrder") {
            let decoder = JSONDecoder()
            if let decodedOrder = try? decoder.decode(Order.self, from: savedOrder) {
                return decodedOrder
            }
        }
        return nil
    }
}

#Preview {
    AddressView(order: Order())
}
