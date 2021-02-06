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

import CoreGraphics
import Foundation

let painter = KomaPainter(name: "竜")

guard let colorspace = CGColorSpace(name: CGColorSpace.sRGB) else { exit(1) }
guard let ctx = CGContext(data: nil, width: 200, height: 200,
                          bitsPerComponent: 8, bytesPerRow: 0,
                          space: colorspace,
                          bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
    print("couldn't make colorspace")
    exit(1)
}

let rect = CGRect(x: 0, y: 0, width: 200, height: 200)

painter.draw(on: ctx, in: rect)

guard let image = ctx.makeImage() else {
    print("image issue")
    exit(1)
}

let url = URL(fileURLWithPath: "image2.png")
guard let destination = CGImageDestinationCreateWithURL(url as CFURL,
                                                        kUTTypePNG, 1, nil) else {
    print("oops")
    exit(1)
}

CGImageDestinationAddImage(destination, image, nil)
CGImageDestinationFinalize(destination)
