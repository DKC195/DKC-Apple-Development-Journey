//
//  ContentView.swift
//  ViewsAndModifiers
//
//  Created by Dhiraj KC on 2025-05-08.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let columns: Int
    let rows: Int
    
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) {row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.blue)
            .padding(.bottom, 40)
    }
}

extension View {
    func larger () -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    var body: some View {
        Text("Test")
            .larger()
        
        VStack {
            GridStack(columns: 4, rows: 4) {row, col in
                    Image(systemName: "\(row*4+col).circle")
                    Text("R\(row) C\(col)")
            }
        }
    }
}

#Preview {
    ContentView()
}
