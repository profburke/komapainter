// Copyright (c) 2021 BlueDino Software (http://bluedino.net)
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
// 1. Redistributions of source code must retain the above copyright notice, this
//    list of conditions and the following disclaimer.
// 2. Redistributions in binary form must reproduce the above copyright notice,
//    this list of conditions and the following disclaimer in the documentation and/or
//    other materials provided with the distribution.
// 3. Neither the name of the copyright holder nor the names of its contributors may be
//    used to endorse or promote products derived from this software without specific prior
//    written permission.
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
// MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL
// THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
// OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR
// TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
// SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import ArgumentParser
import CoreGraphics
import Foundation
import func Darwin.fputs
import var Darwin.stderr

struct KomapainterOptions: ParsableArguments {
    @Option(name: .shortAndLong)
    var name: String

    @Option(name: [.customLong("output"), .short])
    var outputFileName: String

    @Flag(name: .shortAndLong)
    var promoted = false

    @Option(name: .shortAndLong)
    var size = 200
}
let options = KomapainterOptions.parseOrExit()

guard let colorspace = CGColorSpace(name: CGColorSpace.sRGB) else {
    fputs("Couldn't create color space.", stderr);
    exit(1)
}

guard let ctx = CGContext(data: nil, width: options.size, height: options.size,
                          bitsPerComponent: 8, bytesPerRow: 0,
                          space: colorspace,
                          bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
    fputs("Couldn't create core graphics context.", stderr)
    exit(1)
}

let rect = CGRect(x: 0, y: 0, width: options.size, height: options.size)
let painter = KomaPainter(name: options.name, isPromoted: options.promoted)
painter.draw(on: ctx, in: rect)

guard let image = ctx.makeImage() else {
    fputs("Problem creating PNG image from graphics context.", stderr)
    exit(1)
}

let url = URL(fileURLWithPath: options.outputFileName)
if case .failure(let err) = painter.png(from: image, to: url) {
    fputs("Error writing file: \(err)", stderr)
    exit(1)
}



