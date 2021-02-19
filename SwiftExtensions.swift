//
//  SwiftExtensions.swift
//  GLMap
//
//  Created by Evgen Bodunov on 11/18/16.
//  Copyright © 2016 Evgen Bodunov. All rights reserved.
//

import Foundation
import GLMap

#if (arch(x86_64) || arch(arm64))

import SwiftUI

#if os(macOS)
import AppKit
public struct GLMapViewUI: NSViewRepresentable {
    public init() {}
    public func makeNSView(context: Context) -> GLMapView { return GLMapView() }
    public func updateNSView(_ nsView: GLMapView, context: Context) {}
}
#else
import UIKit
/// View ready to use with SwiftUI
@available(iOS 13.0, *)
public struct GLMapViewUI: UIViewRepresentable {
    /// :nodoc:
    public init() {}
    public func makeUIView(context: Context) -> GLMapView { return GLMapView() }
    public func updateUIView(_ uiView: GLMapView, context: Context) {}
}
#endif

#endif

extension GLMapManager {
    #if SWIFT_PACKAGE
    public static func activate(apiKey: String) {
        activate(apiKey: apiKey, resources: Bundle.module, storage: nil)
    }
    #else
    public static func activate(apiKey: String) {
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

extension GLMapPointArray {
    /**
     Creates new GLMapPointArray and adds points to it
     @param lat Latitude in degrees
     @param lon Longitude in degrees
     */
    public convenience init(_ points: Array<GLMapPoint>) {
        self.init()
        addPoints(points)
    }

    /**
     Adds points to array
     @param line Array of map points
     */
    public func addPoints(_ points: Array<GLMapPoint>) {
        addPoints(points, count: UInt(points.count))
    }
}

extension GLMapMarkerData {
    /**
     Sets style to the marker. Style indexes returned by `GLMapMarkerStyleCollection`, when new image is added

     @param style Index of the style.
     */
    public func setStyle(_ style: UInt) {
        GLMapMarkerSetStyle(self, UInt32(style))
    }

    /**
     Sets text to the marker.

     @param text Text displayed by marker
     @param offset Offset of the text center relative to the marker center
     @param style Text style
     */
    public func setText(_ text: String, offset: CGPoint, style: GLMapVectorStyle) {
        GLMapMarkerSetText(self, text, offset, style)
    }
}

extension GLMapManager {
    /// Notification is sent when GLMapInfo.state property is changed
    public static let mapListChanged = Notification.Name(kGLMapListChanhged)
}

extension GLMapInfo {
    /// Notification is sent when GLMapInfo.state property is changed
    public static let stateChanged = Notification.Name(kGLMapInfoStateChanged)
}

extension GLMapDownloadTask {
    /// Notification is sent when GLMapInfo.downloadProgress or GLMapInfo.processedProgress property is changed
    public static let downloadProgress = Notification.Name("kGLMapDownloadTaskProgress")
    /// Notification is sent when map is downloaded
    public static let downloadFinished = Notification.Name("kGLMapDownloadTaskFinished")
}

extension GLMapInfoState {
    /// Compares two offline map states
    public static func > (lhs: GLMapInfoState, rhs: GLMapInfoState) -> Bool {
        return lhs.rawValue > rhs.rawValue
    }

    /// Compares two offline map states
    public static func < (lhs: GLMapInfoState, rhs: GLMapInfoState) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}

extension GLMapBBox {
    /// Adds point into bounding box object
    public mutating func add(point: GLMapPoint) {
        self = self.adding(point)
    }

    /// Adds one bounding box into another
    public mutating func add(bbox: GLMapBBox) {
        self = self.adding(bbox.origin)
        self = self.adding(GLMapPoint(x:bbox.origin.x + bbox.size.x, y:bbox.origin.y + bbox.size.y))
    }
}

extension GLMapTrackData {
    /**
     Initalizes `GLMapTrackData` with array of points
     @param points Track point array
     */
    public convenience init?(points: Array<GLTrackPoint>) {
        self.init(points: points, count: UInt(points.count))
    }
}
