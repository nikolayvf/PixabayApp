//
//  AudioPlayer.swift
//  PixabayApp
//
//  Created by Nikolay Filipov
//

import AVKit

class AudioPlayer {
    private var audioPlayer: AVAudioPlayer?

    func playAudio(withFileName fileName: String, fileType: String) {
        guard let soundPath = Bundle.main.path(forResource: fileName, ofType: fileType) else {
            print("Audio file not found")
            return
        }

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: soundPath))
            audioPlayer?.play()
        } catch {
            print("Error playing audio: \(error.localizedDescription)")
        }
    }

    func stopAudio() {
        audioPlayer?.stop()
    }

    func setLooping(_ looping: Bool) {
        audioPlayer?.numberOfLoops = looping ? -1 : 0
    }
}
