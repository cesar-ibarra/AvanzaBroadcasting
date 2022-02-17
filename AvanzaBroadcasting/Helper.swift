//
//  Helper.swift
//  AvanzaBroadcasting
//
//  Created by Cesar Ibarra on 2/13/22.
//

import Foundation
import AVFoundation
import SwiftUI

class SoundManager : ObservableObject {
    var audioPlayer: AVPlayer?

    func playSound(sound: String){
        if let url = URL(string: sound) {
            self.audioPlayer = AVPlayer(url: url)
        }
    }
}

func playAudioBackground() {
    do {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playAndRecord, mode: AVAudioSession.Mode.spokenAudio, options: [.defaultToSpeaker, .allowAirPlay, .allowBluetoothA2DP])
        try AVAudioSession.sharedInstance().setActive(true)
//            setupCommandCenter()
    } catch {
        print(error)
    }
}


func greetingLogic() -> String {
  let hour = Calendar.current.component(.hour, from: Date())
  
  let NEW_DAY = 0
  let NOON = 12
  let SUNSET = 18
  let MIDNIGHT = 24
  
  var greetingText = "Hello" // Default greeting text
  switch hour {
  case NEW_DAY..<NOON:
      greetingText = "Buenos Dias"
  case NOON..<SUNSET:
      greetingText = "Buenas Tardes"
  case SUNSET..<MIDNIGHT:
      greetingText = "Buenas Noches"
  default:
      _ = "Hola"
  }
  
  return greetingText
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
    }
}
