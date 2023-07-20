//
//  SwiftExtensions.swift
//  GLMap
//
//  Created by Evgen Bodunov on 11/18/16.
//  Copyright © 2016 Evgen Bodunov. All rights reserved.
//

import Foundation
import GLMapCore

public extension GLMapManager {
    /**
     Activates map manager with API key.
     It could be obtained at https://user.getyourmap.com

     @param apiKey API key
     */
    static func activate(apiKey: String, resources: Bundle? = nil, storage: String? = nil) {
        #if SWIFT_PACKAGE
            let res = resources ?? Bundle.module
        #else
            let res = resources
        #endif
        activate(withApiKey: apiKey, resourcesBundle: res, andStoragePath: storage)
    }
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
    /// Returns true if bounding box is empty
    var isEmpty: Bool {
        return size.x < 0 || size.y < 0
    }

    /// Adds point into bounding box object
    mutating func add(point: GLMapPoint) {
        self = adding(point)
    }

    /// Adds one bounding box into another
    mutating func add(bbox: GLMapBBox) {
        if !bbox.isEmpty {
            self = adding(bbox.origin)
            self = adding(GLMapPoint(x: bbox.origin.x + bbox.size.x, y: bbox.origin.y + bbox.size.y))
        }
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
