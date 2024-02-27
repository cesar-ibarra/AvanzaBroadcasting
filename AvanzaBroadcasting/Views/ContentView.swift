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
        //streaming url
        soundManager.playSound(sound: "YOUR_URL")
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
    
    @State private var imageBackground : ImageBackground?
    
    var body: some View {
        
        ZStack {
//            let imageBackground = imageBackground
            VStack {
                // MARK: - HEADER
                ZStack{
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
            }//: VSTACK
        }//: ZSTACK
        .background(
            Image((imageBackground != nil) ? imageBackground?.name as! String : "image-0")
                    .ignoresSafeArea(.all, edges: .all)
                    .colorMultiply(.gray)
                    
        )
        
        .onAppear(perform: {
            isAnimating = true
            let imagesBackground = Bundle.main.decode([ImageBackground].self, from: "image.json")
                imageBackground = imagesBackground.randomElement()
        })
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
