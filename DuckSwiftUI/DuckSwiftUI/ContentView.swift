//
//  ContentView.swift
//  DuckSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 17/07/21.
//MARK:- The App Wizard
//MARK:- Instagram : theappwizard2408


import SwiftUI

struct ContentView: View {
    var body: some View {
        DuckView()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

































struct DuckView: View {
    let screen = UIScreen.main.bounds
           
            @State var isAnimated = false
            @State var duckAnimate = false
           
            @State  var login = ""
            @State  var password = ""
            
           var body: some View {
               return ZStack {
               
                RadialGradient(gradient: Gradient(colors: [.blue, .black , .black]), center: .center, startRadius: 0, endRadius: 900)
                    .edgesIgnoringSafeArea(.all)
                
                    //first Wave
                      getWavePath(interval: screen.width, amplitude: 160, base:  100 + screen.height/2.1)
                        .foregroundColor(Color.blue.opacity(0.4))
                        .offset(x: isAnimated ? -1*screen.width : 0)
                        .animation(
                            Animation.linear(duration: 4)
                                .repeatForever(autoreverses: false)
                        )
                
                
                        VStack{
                        //Duck Stack
                            Spacer()
                                .frame(width: 100, height: 200, alignment: .center)
                            Image("duck")
                            .resizable()
                            .frame(width: 250, height: 250,alignment: .bottom)
                                .rotationEffect(.degrees(duckAnimate ? 15 : -15))
                            .offset(x: 0, y: 40)
                            .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
                                .onAppear() {
                                        self.duckAnimate.toggle()
                                        }
                            
                    
                }
                
                   //Second Wave
                    getWavePath(interval: screen.width*1.2, amplitude: 130, base: 120 + screen.height/2)
                        .foregroundColor(Color.blue.opacity(0.5))
                        .offset(x: isAnimated ? -1*screen.width*1.2 : 0)
                        .animation(
                            Animation.linear(duration: 5)
                                .repeatForever(autoreverses: false)
                        )
                
                
                    //Third Wave
                    getWavePath(interval: screen.width*1.5, amplitude: 100, base: 140 + screen.height/2)
                        .foregroundColor(Color.blue.opacity(0.7))
                        .offset(x: isAnimated ? -1*screen.width*1.5 : 0)
                        .animation(
                            Animation.linear(duration: 3)
                                .repeatForever(autoreverses: false)
                        )
                
                VStack{
                     Text("D U C K")
                        .font(.system(size: 70))
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .frame(width: 400, height: 200, alignment: .center)

                    VStack{
                        HStack {
                          Image(systemName: "person").foregroundColor(.white)
                            .padding()
                          Text(login)
                            .frame(width: 280, height: 50, alignment: .center)
                        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                      
                        
                        Spacer()
                            .frame(width: 0, height: 20, alignment: .center)
                        
                        HStack {
                          Image(systemName: "key").foregroundColor(.white)
                            .padding()
                          Text(password)
                            .frame(width: 280, height: 50, alignment: .center)
                        }.overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
                        
                        Spacer()
                            .frame(width: 0, height: 30, alignment: .center)
                        
                        
                    }
                    
                    
                    VStack {
                        Spacer()
                            .frame(width: 100, height: 360, alignment: .center)
                        
                        ZStack {
                           Circle()
                                .foregroundColor(.clear).opacity(0.8)
                                .frame(width: 80, height: 80, alignment: .center)
                            
                            
                            Image(systemName: "chevron.forward")
                                .resizable()
                                .frame(width: 20, height: 30, alignment: .center)
                                .foregroundColor(.white)
                            
                        }.overlay(Circle().stroke(Color.white, lineWidth: 2))
                        Spacer()
                            .frame(width: 0, height: 15, alignment: .center)
                        
                        
                    }
                }
                }.onAppear() {
                    self.isAnimated = true
                }
                
                
            }
        
        //Wave Function Produces Sine Wave
            func getWavePath(interval: CGFloat, amplitude: CGFloat = 100, base: CGFloat = UIScreen.main.bounds.height/2) -> Path {
                Path {
                    path in
                    path.move(to: CGPoint(x: 0, y: base))
                    path.addCurve(
                        to: CGPoint(x: 1*interval , y: base),
                        control1: CGPoint(x: interval * (0.35), y: amplitude + base ),
                        control2: CGPoint(x: interval * (0.65), y: -amplitude + base)
                    )
                    path.addCurve(
                        to: CGPoint(x: 2*interval , y: base),
                        control1: CGPoint(x: interval * (1.35), y: amplitude + base ),
                        control2: CGPoint(x: interval * (1.65), y: -amplitude + base)
                    )
                    path.addLine(to: CGPoint(x: 2*interval, y: screen.height))
                    path.addLine(to: CGPoint(x: 0, y: screen.height))
                    
                }
        }
}
