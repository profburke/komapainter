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
import CoreText
import Foundation

public struct KomaPainter {
    let isPromoted: Bool
    let name: String
    let style: PainterStyle

    public init(name: String, isPromoted: Bool = false, style: PainterStyle = .defaultStyle) {
        self.name = name
        self.isPromoted = isPromoted
        self.style = style
    }

    public func draw(on context: CGContext, in bounds: CGRect) {
        configure(context)
        let size = bounds.size

        context.translateBy(x: 0, y: bounds.size.height)
        context.scaleBy(x: 1.0, y: -1.0)
        
        context.beginPath()
        context.move(to: scale(CGPoint(x: 0.2, y: 0.2), to: size))
        context.addLine(to: scale(CGPoint(x: 0.5, y: 0.1), to: size))
        context.addLine(to: scale(CGPoint(x: 0.8, y: 0.2), to: size))
        context.addLine(to: scale(CGPoint(x: 0.9, y: 0.9), to: size))
        context.addLine(to: scale(CGPoint(x: 0.1, y: 0.9), to: size))
        context.closePath()

        context.drawPath(using: .fillStroke)
        draw(name, on: context, in: bounds)
    }

    private func configure(_ context: CGContext) {
        context.setLineWidth(style.borderWidth)
        context.setStrokeColor(style.borderColor)
        context.setFillColor(style.fillColor)
    }

    private func scale(_ point: CGPoint, to size: CGSize) -> CGPoint {
        return CGPoint(x: point.x * size.width, y: point.y * size.height)
    }

    private func draw(_ name: String, on context: CGContext, in bounds: CGRect) {
        context.textMatrix = .identity
        context.translateBy(x: 0, y: bounds.size.height)
        context.scaleBy(x: 1.0, y: -1.0)

        context.translateBy(x: 0.3 * bounds.size.width, y: -0.32 * bounds.size.height)

        if name.count == 1 {
            let font = CTFontCreateWithName(("Helvetica" as CFString), 80, nil)
            draw(character: name, on: context, in: bounds, with: font)
        } else {
            draw(string: name, on: context, in: bounds)
        }
    }

    private func draw(character: String, on context: CGContext, in bounds: CGRect,
                      with font: CTFont) {
        let path = CGMutablePath()
        path.addRect(bounds)

        let fontKey = NSAttributedString.Key("NSFont")
        let textColorKey = NSAttributedString.Key("NSColor")

        var attributes: [NSAttributedString.Key: Any] = [fontKey: font]
        if isPromoted {
            attributes[textColorKey] = style.promotedColor
        } else {
            attributes[textColorKey] = style.nameColor
        }
        
        let astr = NSAttributedString(string: character, attributes: attributes)

        let framesetter = CTFramesetterCreateWithAttributedString(astr)
        let frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 1), path, nil)

        CTFrameDraw(frame, context)
    }

    private func draw(string: String, on context: CGContext, in bounds: CGRect) {
        let font = CTFontCreateWithName(("Helvetica" as CFString), 96/2, nil)
        context.translateBy(x: 0.07 * bounds.size.width, y: 0.05 * bounds.size.height)
        draw(character: String(name.first!), on: context, in: bounds, with: font)
        
        context.translateBy(x: 0, y: -0.28 * bounds.size.height)
        draw(character: String(name.last!), on: context, in: bounds, with: font)
    }
}
