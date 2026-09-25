// Map-only conveniences. Core APIs are re-exported for source compatibility.
import GLMap
import GLMapCore
#if SWIFT_PACKAGE
    @_exported import GLMapCoreSwift
#endif

public extension GLMapMarkerData {
    /**
     Sets style to the marker. Style indexes returned by `GLMapMarkerStyleCollection`, when new image is added

     @param style Index of the style.
     */
    func setStyle(_ style: UInt32) {
        GLMapMarkerSetStyle(self, style)
    }

    /**
     Sets text to the marker.

     @param text Text displayed by marker
     @param offset Offset of the text center relative to the marker center
     @param style Text style
     */
    func setText(_ text: String, alignment: GLMapTextAlignment = .undefined, offset: CGPoint = .zero, style: GLMapVectorStyle) {
        GLMapMarkerSetText(self, alignment, text, offset, style)
    }
}

#if swift(>=5.5)
    @MainActor
    public extension GLMapView {
        /// Async/await wrapper around `animate(_:withCompletion:)`.
        /// - Returns: `true` when the animation finished normally, `false` when it was canceled.
        @discardableResult
        func animate(_ animations: (GLMapAnimation) -> Void) async -> Bool {
            await withCheckedContinuation { continuation in
                _ = animate(animations, withCompletion: { finished in
                    continuation.resume(returning: finished)
                })
            }
        }
    }
#endif
