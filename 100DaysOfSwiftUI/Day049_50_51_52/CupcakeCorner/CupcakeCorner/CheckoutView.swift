//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Dhiraj KC on 2025-06-16.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false
    @State private var alertTitle = ""
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task {
                        await placeOrder()
                        saveOrderToUserDefaults(order: order)
                    }
                }
                    .padding()
            }
        }
        .navigationTitle("Check Out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(alertTitle, isPresented: $showingConfirmation) {
            Button("OK") { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode order.")
            return
        }

        let url = URL(string: "https://reqres.in/api/cupcakes")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            // Optional: log the response
            print(String(decoding: data, as: UTF8.self))

            confirmationMessage = "Your order for \(order.quantity) x \(Order.types[order.type].lowercased()) cupcakes has been placed. Thank you!"
            alertTitle = "Thank you!"
            showingConfirmation = true
        } catch {
            print("Checkout failed: \(error.localizedDescription)")
            confirmationMessage = "Your order could not be placed.\n \(error.localizedDescription)"
            alertTitle = "Sorry"
            showingConfirmation = true
        }
    }
    
    func saveOrderToUserDefaults(order: Order) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(order) {
            UserDefaults.standard.set(encoded, forKey: "SavedOrder")
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
