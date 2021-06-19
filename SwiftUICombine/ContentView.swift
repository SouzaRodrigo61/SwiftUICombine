//
//  ContentView.swift
//  SwiftUICombine
//
//  Created by Rodrigo Santos on 18/06/21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @State private var showCertificates: Bool = false
    @State private var contentOffset = CGFloat(0)
    
    var content: some View {
        VStack {
            ProfileRow()
                .onTapGesture {
                    showCertificates.toggle()
                }
            
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
            .blurBackground()
            .padding(.top, 20)
        }
        .foregroundColor(Color.white)
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .sheet(isPresented: $showCertificates, content: {
                CertificatesView()
        })
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
        .accentColor(colorScheme == .dark ? .white : Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.light)
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
