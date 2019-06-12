//
//  SwiftExtensions.swift
//  GLMap
//
//  Created by Evgen Bodunov on 11/18/16.
//  Copyright © 2016 Evgen Bodunov. All rights reserved.
//

import Foundation
import GLMap

extension GLMapPoint: Equatable {
    public static func == (lhs: GLMapPoint, rhs: GLMapPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    /**
     Creates new GLMapPoint using latitude and longitude (WGS84)
     @param lat Latitude in degrees
     @param lon Longitude in degrees
     */
    public init(lat: Double, lon: Double) {
        self = GLMapPointMakeFromGeoCoordinates(lat, lon)
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

extension GLMapInfo {
    /// Notification is sent when GLMapInfo.state property is changed
    public static let stateChanged = Notification.Name("kGLMapInfoStateChanged")
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
    /// Returns empty bounding box object
    public static var empty: GLMapBBox {
        return GLMapBBoxEmpty
    }

    /// Adds point into bounding box object
    public mutating func addPoint(_ point: GLMapPoint) {
        self = GLMapBBoxAddPoint(self, point)
    }

    /// Returns the center of the bounding box
    public var center: GLMapPoint {
        return GLMapBBoxCenter(self)
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

extension GLMapColor {
    /// Equals to GLMapColor(red:0, green:0, blue:0, alpha:0);
    public static var empty: GLMapColor {
        return GLMapColorEmpty
    }

    /// Returns red color component
    public var red: UInt8 {
        return GLMapColorGetRed(self)
    }

    /// Returns green color component
    public var green: UInt8 {
        return GLMapColorGetGreen(self)
    }

    /// Returns blue color component
    public var blue: UInt8 {
        return GLMapColorGetBlue(self)
    }

    /// Returns alpha color component
    public var alpha: UInt8 {
        return GLMapColorGetAlpha(self)
    }
}
