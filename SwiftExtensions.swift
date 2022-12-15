//
//  SwiftExtensions.swift
//  GLMap
//
//  Created by Evgen Bodunov on 11/18/16.
//  Copyright © 2016 Evgen Bodunov. All rights reserved.
//

import Foundation
import GLMap
import SwiftUI

/// GLMapViewBlock receives `GLMapView` as a param
public typealias GLMapViewBlock = (GLMapView) -> Void

#if os(macOS)
    import AppKit

    /// View ready to use with SwiftUI
    public struct GLMapViewUI: NSViewRepresentable {
        private let initCallback: GLMapViewBlock?
        /// :nodoc:
        public init(initCallback: GLMapViewBlock? = nil) {
            self.initCallback = initCallback
        }

        public func makeNSView(context _: Context) -> GLMapView {
            let rv = GLMapView()
            if let initCallback = initCallback {
                initCallback(rv)
            }
            return rv
        }

        public func updateNSView(_: GLMapView, context _: Context) {}
    }
#else
    import UIKit

    /// View ready to use with SwiftUI
    @available(iOS 13.0, *)
    public struct GLMapViewUI: UIViewRepresentable {
        private let initCallback: GLMapViewBlock?
        /// :nodoc:
        public init(initCallback: GLMapViewBlock? = nil) { self.initCallback = initCallback }
        public func makeUIView(context _: Context) -> GLMapView {
            let rv = GLMapView()
            if let initCallback = initCallback {
                initCallback(rv)
            }
            return rv
        }

        public func updateUIView(_: GLMapView, context _: Context) {}
    }
#endif

public extension GLMapManager {
    #if SWIFT_PACKAGE
        /**
         Activates map manager with API key.
         It could be obtained at https://user.getyourmap.com

         @param apiKey API key
         */
        static func activate(apiKey: String) {
            activate(apiKey: apiKey, resources: Bundle.module, storage: nil)
        }
    #else
        /**
         Activates map manager with API key.
         It could be obtained at https://user.getyourmap.com

         @param apiKey API key
         */
        static func activate(apiKey: String) {
            activate(apiKey: apiKey, resources: nil, storage: nil)
        }
    #endif
}

extension GLMapPoint: Equatable {
    public static func == (lhs: GLMapPoint, rhs: GLMapPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension GLMapGeoPoint: Equatable {
    public static func == (lhs: GLMapGeoPoint, rhs: GLMapGeoPoint) -> Bool {
        return lhs.lat == rhs.lat && lhs.lon == rhs.lon
    }
}

extension GLMapBBox: Equatable {
    public static func == (lhs: GLMapBBox, rhs: GLMapBBox) -> Bool {
        return lhs.origin == rhs.origin && lhs.size == rhs.size
    }
}

public extension GLMapPointArray {
    /**
     Creates new GLMapPointArray and adds points to it
     @param lat Latitude in degrees
     @param lon Longitude in degrees
     */
    convenience init(_ points: [GLMapPoint]) {
        self.init()
        addPoints(points)
    }

    /**
     Adds points to array
     @param line Array of map points
     */
    func addPoints(_ points: [GLMapPoint]) {
        addPoints(points, count: UInt(points.count))
    }
}

public extension GLMapMarkerData {
    /**
     Sets style to the marker. Style indexes returned by `GLMapMarkerStyleCollection`, when new image is added

     @param style Index of the style.
     */
    func setStyle(_ style: UInt) {
        GLMapMarkerSetStyle(self, UInt32(style))
    }

    /**
     Sets text to the marker.

     @param text Text displayed by marker
     @param offset Offset of the text center relative to the marker center
     @param style Text style
     */
    func setText(_ text: String, offset: CGPoint, style: GLMapVectorStyle) {
        GLMapMarkerSetText(self, text, offset, style)
    }
}

public extension GLMapManager {
    /// Notification is sent when GLMapInfo.state property is changed
    static let mapListChanged = Notification.Name(kGLMapListChanhged)
}

public extension GLMapInfo {
    /// Notification is sent when GLMapInfo.state property is changed
    static let stateChanged = Notification.Name(kGLMapInfoStateChanged)
}

public extension GLMapDownloadTask {
    /// Notification is sent when GLMapInfo.downloadProgress or GLMapInfo.processedProgress property is changed
    static let downloadProgress = Notification.Name(kGLMapDownloadTaskProgress)
    /// Notification is sent when download task is started
    static let downloadTaskStarted = Notification.Name(kGLMapDownloadTaskStarted)
    /// Notification is sent when download task is finished
    static let downloadFinished = Notification.Name(kGLMapDownloadTaskFinished)
}

public extension GLMapInfoState {
    /// Compares two offline map states
    static func > (lhs: GLMapInfoState, rhs: GLMapInfoState) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }

    /// Compares two offline map states
    static func < (lhs: GLMapInfoState, rhs: GLMapInfoState) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

public extension GLMapBBox {
    /// Adds point into bounding box object
    mutating func add(point: GLMapPoint) {
        self = adding(point)
    }

    /// Adds one bounding box into another
    mutating func add(bbox: GLMapBBox) {
        self = adding(bbox.origin)
        self = adding(GLMapPoint(x: bbox.origin.x + bbox.size.x, y: bbox.origin.y + bbox.size.y))
    }
}

public extension GLMapTrackData {
    /**
     Initalizes `GLMapTrackData` with array of points
     @param points Track point array
     */
    convenience init?(points: [GLTrackPoint]) {
        self.init(points: points, count: UInt(points.count))
    }
}
