//
//  ContentView.swift
//  shapeApp
//
//  Created by kishan rana ghosh on 11/11/25.
//

import SwiftUI

struct Hexagonal: Shape {
    func path(in rect: CGRect) -> Path {
        return Path{ path in
//            let p1 = CGPoint(x: 0, y: 20)
//            let p2 = CGPoint(x: 0, y: rect.height - 20)
//            let p3 = CGPoint(x: rect.width / 2, y: rect.height)
//            let p4 = CGPoint(x: rect.width, y: rect.height - 20)
//            let p5 = CGPoint(x: rect.width, y: 20)
//            let p6 = CGPoint(x: rect.width/2, y: 0)
//            path .move(to: p6)
//            
//            path.addArc(tangent1End: p1, tangent2End: p2, radius: 15)
//            path.addArc(tangent1End: p2, tangent2End: p3, radius: 15)
//            path.addArc(tangent1End: p3, tangent2End: p4, radius: 15)
//            path.addArc(tangent1End: p5, tangent2End: p6, radius: 15)
//            path.addArc(tangent1End: p6, tangent2End: p1, radius: 15)
            let p1 = CGPoint(x: 0, y: 20)
            let p2 = CGPoint(x: 0, y: rect.height - 20)
            let p3 = CGPoint(x: rect.width/2, y: rect.height)
            let p4 = CGPoint(x: rect.width, y: rect.height - 20)
            let p5 = CGPoint(x: rect.width, y: 20)
            let p6 = CGPoint(x: rect.width/2, y: 0)
                      
            path .move(to: p6)
                      
                      
            path.addArc(tangent1End: p1, tangent2End: p2, radius: 15)
            path.addArc(tangent1End: p2, tangent2End: p3, radius: 15)
            path.addArc(tangent1End: p3, tangent2End: p4, radius: 15)
            path.addArc(tangent1End: p4, tangent2End: p5, radius: 15)
            path.addArc(tangent1End: p5, tangent2End: p6, radius: 15)
            path.addArc(tangent1End: p6, tangent2End: p1, radius: 15)
        }
    }
}

// enum
enum choice: Int, Identifiable {
    
    var id: Int {
        rawValue
    }
    case success, failure
    
}

// main struct

struct ContentView: View {
    @State public var symbols = ["eating", "happy", "love"]
    @State public var numbers = [0, 1, 2]
    @State public var counter = 0
    @State private var showingAlert: choice?
    var body: some View{
        Text("Hello from chai code")
            .padding()
    }
}

#Preview {
    ContentView()
}
