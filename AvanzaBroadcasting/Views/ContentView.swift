//
//  ContentView.swift
//  AvanzaBroadcasting
//
//  Created by Cesar Ibarra on 1/22/22.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    func playSound() {
        soundManager.playSound(sound: "https://icecasthd.net:2199/tunein/davidrecords.pls")
        playAudioBackground()
        audioPlay.toggle()
        
        if audioPlay{
            soundManager.audioPlayer?.play()
        } else {
            soundManager.audioPlayer?.pause()
        }
    }
    
    @State var audioPlay = false
    @StateObject private var soundManager = SoundManager()
    @State private var isAnimating: Bool = false
    @State var isAboutViewShowing = false
    
    var body: some View {
        
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                // MARK: - HEADER
                ZStack{
                    Color("ColorGrey")
                        .ignoresSafeArea(.all, edges: .all)
                    Image("avanzalogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height:  50)
                        
                }
                .frame(height:  70)
                
                VStack(spacing: 10) {
                    
                    Text("\(greetingLogic())")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    BibleQuoteView()
                        
                }//: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                Spacer()
                
                // MARK: - CENTER
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Button(action: {
                        playSound()
                    }) {
                        Image(systemName: audioPlay ? "pause.circle.fill": "play.circle.fill")
                                .font(.system(size: 75))
                                .foregroundColor(Color.white)
                    }.buttonStyle(ScaleButtonStyle())
                }//: ZSTACK
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack{
                    //: 1. BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))

                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)

//                    : 2. GOOGLE ADS

                        Image(systemName: "info.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.white)

                }//: ZSTACK FOOTER
                .frame(width: 80, height: 80, alignment: .center)
                .padding()
                .onTapGesture {
                    // Action here
                    isAboutViewShowing = true
                }
                .sheet(isPresented: $isAboutViewShowing) {
                    AboutView()
                }
                
                
                
//                ZStack{
//                    //: 1. BACKGROUND (STATIC)
//                    Capsule()
//                        .fill(Color.white.opacity(0.2))
//
//                    Capsule()
//                        .fill(Color.white.opacity(0.2))
//                        .padding(8)
//
////                    : 2. GOOGLE ADS
//
//                        Text("Acerca de Nosotros")
//                            .font(.system(size: 25))
//                            .foregroundColor(.white)
//
//                }//: ZSTACK FOOTER
//                .frame(height: 80, alignment: .center)
//                .padding()
//                .onTapGesture {
//                    // Action here
//                    isAboutViewShowing = true
//                }
//                .sheet(isPresented: $isAboutViewShowing) {
//                    AboutView()
//                }
            }//: VSTACK
        }//: ZSTACK
        .onAppear(perform: {
            isAnimating = true
        })
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
