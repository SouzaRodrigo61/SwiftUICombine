//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by Rodrigo Santos on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var contentOffset = CGFloat(0)
    
    var content: some View {
        VStack {
            NavigationLink(destination: FAQView()) {
                MenuRow()
            }
            
            divider
            
            NavigationLink(destination: PackagesView()) {
                MenuRow(title: "SwiftUI Packages", leftIcon: "square.stack.3d.up.fill")
            }
            
            divider
            
            Link(destination: URL(string: "https://www.youtube.com/channel/UCTIhfOopxukTIRkbXJ3kN-g")!, label: {
                MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
            })
        }

        .padding(16)
        .background(Color("Background 1"))
        .background(VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark))
        .overlay(RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)), lineWidth: 1).blendMode(.overlay))
        .mask(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .padding(.top, 20)
    }
    
    var divider: some View {
        Divider().background(Color.white).blendMode(.overlay)
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                TrackableScrollView(offsetChanged: { offsetPoint in
                    contentOffset = offsetPoint.y
                }) {
                    content
                        .foregroundColor(Color.white)
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                    
                    Text("Version 1.00")
                        .foregroundColor(Color.white.opacity(0.7))
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 10)
                        .font(.footnote)
                }
                
                VisualEffectBlur(blurStyle: .systemMaterial)
                    .opacity(contentOffset < -16 ? 1 : 0)
                    .animation(.easeIn)
                    .ignoresSafeArea()
                    .frame(height: 0)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(AccountBackground())
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
