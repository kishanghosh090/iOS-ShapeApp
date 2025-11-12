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
        ZStack{
            Image("sunshine")
                .resizable()
                .ignoresSafeArea()
            VStack(alignment: .center, spacing: 80){
                HStack{
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 1, y: 3)
                    Text("Slot mechine")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                        .shadow(radius: 1, y: 3)
                    Image("fire")
                        .resizable()
                        .scaledToFit()
                        .shadow(color: .orange, radius: 1, y: 3)
                    
                }.frame(width: .infinity, height: 50, alignment: .center)
                
                VStack(spacing: 15){
                    HStack(spacing: 25){
                        Hexagonal()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 100,height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: .center)
                                    .shadow(color: .gray, radius: 4, x: 4, y: 5)
                            )
                        Hexagonal()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 100,height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: .center)
                                    .shadow(color: .gray, radius: 4, x: 4, y: 5)
                            )
                    }
                    Hexagonal()
                        .fill(Color.white.opacity(0.5))
                        .frame(width: 100,height: 120, alignment: .center)
                        .overlay(
                            Image(symbols[numbers[2]])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 70, alignment: .center)
                                .shadow(color: .gray, radius: 4, x: 4, y: 5)
                        )
                    HStack(spacing: 25){
                        Hexagonal()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 100,height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[0]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: .center)
                                    .shadow(color: .gray, radius: 4, x: 4, y: 5)
                            )
                        Hexagonal()
                            .fill(Color.white.opacity(0.5))
                            .frame(width: 100,height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[1]])
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 70, alignment: .center)
                                    .shadow(color: .gray, radius: 4, x: 4, y: 5)
                            )
                    }
                    Button {
                        self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                        self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                        self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                        counter+=1
                        if counter > 5 {
                            self.showingAlert = .failure
                            counter = 0
                            return
                        }
                        self.showingAlert = .success
                    } label: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("color").opacity(0.9))
                            .frame(width: 150, height: 50)
                            .overlay(
                                Text("spin")
                                    .foregroundStyle(Color.white)
                                    .fontWeight(.black)
                            )
                            .foregroundStyle(.black)
                            .shadow(color: .gray, radius: 1, y: 4)
                            
                    }

                }
            }
            
        }.alert(item: $showingAlert) { aleart -> Alert in
            switch aleart {
            case .success :
                return Alert(title: Text("Yahh! you woon"), message: Text("Bron with the charm"), dismissButton: .cancel())
            case .failure :
                return Alert(title: Text("oops! you do't woon"), message: Text("better luck next time"), dismissButton: .cancel())
            }
            
        }
    }
}


#Preview {
    ContentView()
}
