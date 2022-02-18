//
//  AboutView.swift
//  AvanzaBroadcasting
//
//  Created by Cesar Ibarra on 2/16/22.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
            ZStack {
                Color("ColorGrey")
                    .ignoresSafeArea(.all, edges: .all)
                VStack {
                    Spacer()
                    Image("avanzalogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height:  80)
                    
                    Button(action: {
                        //Action
                        let websiteLink = "https://avanzaradio.wixsite.com/avanza"
                        let url: NSURL = URL(string: websiteLink)! as NSURL
                        
                        UIApplication.shared.open(url as URL)
                    }) {
                        Text("Visita Nuestra Web")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 250, height: 50, alignment: .center)
                            .background(Color("ColorBlue"))
                            .cornerRadius(15)
                            
                    }.buttonStyle(ScaleButtonStyle())
                    Spacer()
                    Text("Coded With ❤️ by Cesar Ibarra")
                        .foregroundColor(Color.white)
                    
                }
                
            }

    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
