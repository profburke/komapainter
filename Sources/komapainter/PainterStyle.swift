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

public struct PainterStyle {
    let borderColor: CGColor
    let borderWidth: CGFloat
    let fillColor: CGColor
    let nameColor: CGColor
    let promotedColor: CGColor
    
    public init(borderColor: CGColor, borderWidth: CGFloat, fillColor: CGColor,
                nameColor: CGColor, promotedColor: CGColor) {
        self.borderColor = borderColor
        self.borderWidth = borderWidth
        self.fillColor = fillColor
        set.nameColor = nameColor
        set.promotedColor = promotedColor
    }
    
    public static var defaultStyle =
    PainterStyle(borderColor: CGColor(red: 0, green: 0, blue: 0, alpha: 1),
                 borderWidth: 3,
                 fillColor: CGColor(red: 1, green: 0.8, blue: 0.1, alpha: 1),
                 nameColor: CGColor(red: 0, green: 0, blue: 0, alpha: 1),
                 promotedColor: CGColor(red: 1, green: 0, blue: 0, alpha: 1))
}
