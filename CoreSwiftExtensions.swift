//
//  SwiftExtensions.swift
//  GLMap
//
//  Created by Evgen Bodunov on 11/18/16.
//  Copyright © 2016 Evgen Bodunov. All rights reserved.
//

import CoreLocation
import Foundation
import GLMapCore

public extension GLMapManager {
    /**
     Activates map manager with API key.
     It can be obtained at https://user.globus.software/apps/

     @param apiKey API key
     @return `false` if resources are missing from the bundle or the storage path is not writable.
     */
    @discardableResult
    static func activate(apiKey: String, resources: Bundle? = nil, storage: String? = nil) -> Bool {
        #if SWIFT_PACKAGE
            let res = resources ?? Bundle.module
        #else
            let res = resources
        #endif
        return activate(withApiKey: apiKey, resourcesBundle: res, andStoragePath: storage)
    }
}

extension GLMapPoint: @retroactive Equatable {
    /// Returns whether two projected points have identical coordinates.
    public static func == (lhs: GLMapPoint, rhs: GLMapPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

extension GLMapGeoPoint: @retroactive Equatable {
    /// Returns whether two geographic points have identical coordinates.
    public static func == (lhs: GLMapGeoPoint, rhs: GLMapGeoPoint) -> Bool {
        return lhs.lat == rhs.lat && lhs.lon == rhs.lon
    }
}

public extension GLMapGeoPoint {
    /// Convenience initializer bridging from CoreLocation.
    init(location: CLLocation) {
        self.init(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
    }
}

extension GLMapBBox: @retroactive Equatable {
    /// Returns whether two bounding boxes have identical origins and sizes.
    public static func == (lhs: GLMapBBox, rhs: GLMapBBox) -> Bool {
        return lhs.origin == rhs.origin && lhs.size == rhs.size
    }
}

public extension GeometryBuilder {
    /**
     Adds line
     @param line Array of map points
     */
    func addLine(_ points: [GLMapPoint]) {
        addLine(points, count: UInt(points.count))
    }
}

public extension GLMapManager {
    /// Notification is sent when GLMapInfo.state property is changed
    static let mapListChanged = Notification.Name(kGLMapListChanged)
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
