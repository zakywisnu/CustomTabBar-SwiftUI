//
//  ContentView.swift
//  CustomTabBar
//
//  Created by Ahmad Zaky on 16/07/21.
//

import SwiftUI

struct ContentView: View {
    @State var showPopUp = false
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                switch viewRouter.currentPage {
                case .home:
                    Text("Home")
                case .liked:
                    Text("Liked")
                case .records:
                    Text("Records")
                case .user:
                    Text("User")
                }
                Spacer()
                ZStack {
                    if showPopUp {
                        PlusMenu(size: geometry.size.width / 7)
                            .offset(y: -geometry.size.height/6)
                            .transition(.scale)
                    }
                    HStack{
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .home, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "homekit", tabName: "Home")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .liked, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "heart", tabName: "Liked")
                        ZStack{
                            Circle()
                                .foregroundColor(.white)
                                .frame(width: geometry.size.width/7, height: geometry.size.height/7)
                                .shadow(radius: 4)
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: geometry.size.width/7-6, height: geometry.size.height/7-6)
                                .foregroundColor(Color.purple.opacity(0.8))
                                .rotationEffect(Angle(degrees: showPopUp ? 135 : 0))
                        }
                        .offset(y: -geometry.size.height/8/2)
                        .onTapGesture{
                            withAnimation{
                                showPopUp.toggle()
                            }
                        }
                        
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .records, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "waveform", tabName: "Record")
                        TabBarIcon(viewRouter: viewRouter, assignedPage: .user, width: geometry.size.width/5, height: geometry.size.height/28, systemIconName: "person.crop.circle", tabName: "Profile")
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height/8)
                    .background(Color.gray.opacity(0.5))
                }
                
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}

struct TabBarIcon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let width, height: CGFloat
    let systemIconName, tabName: String
    var body: some View {
        VStack{
            Image(systemName: systemIconName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .padding(.top, 10)
            Text(tabName)
                .font(.footnote)
            Spacer()
        }
        .foregroundColor(viewRouter.currentPage == assignedPage ? .blue : .gray)
        .padding(.horizontal, -4)
        .onTapGesture {
            viewRouter.currentPage = assignedPage
        }
    }
}

struct PlusMenu: View {
    let size: CGFloat
    var body: some View {
        HStack(spacing: 50) {
            ZStack {
                Circle()
                    .foregroundColor(.purple.opacity(0.8))
                    .frame(width: size , height: size)
                Image(systemName: "record.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: size, height: size)
                    .foregroundColor(.white)
            }
            ZStack {
                Circle()
                    .foregroundColor(.purple.opacity(0.8))
                    .frame(width: size , height: size)
                Image(systemName: "folder")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    .frame(width: size, height: size)
                    .foregroundColor(.white)
            }
        }
    }
}
