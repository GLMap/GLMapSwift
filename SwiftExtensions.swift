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

extension GLMapVectorObject {
    /**
     Adds line to vector object
     
     @param line Array of map points
     */
    public func addLine(_ line:Array<GLMapPoint>) -> Void {
        __addLine(line, pointCount:line.count)
    }
    /**
     Adds geo line to vector object
     
     @param line Array of geo points
     */
    public func addGeoLine(_ geoLine:Array<GLMapGeoPoint>) -> Void {
        __addGeoLine(geoLine, pointCount:geoLine.count)
    }

    /**
     Adds line to polygon as outer ring
     
     @param line Array of map points
     */
    public func addPolygonOuterRing(_ polygonOuterRing:Array<GLMapPoint>) -> Void {
        __addPolygonOuterRing(polygonOuterRing, pointCount:polygonOuterRing.count)
    }
    
    /**
     Adds line to polygon as inner ring
     
     @param line Array of map points
     */
    public func addPolygonInnerRing(_ polygonInnerRing:Array<GLMapPoint>) -> Void {
        __addPolygonInnerRing(polygonInnerRing, pointCount:polygonInnerRing.count)
    }

    /**
     Adds geo line to polygon as outer ring
     
     @param line Array of geo points
     */
    public func addGeoPolygonOuterRing(_ geoPolygonOuterRing:Array<GLMapGeoPoint>) -> Void {
        __addGeoPolygonOuterRing(geoPolygonOuterRing, pointCount:geoPolygonOuterRing.count)
    }
    
    /**
     Adds geo line to polygon as inner ring
     
     @param line Array of map points
     */
    public func addGeoPolygonInnerRing(_ geoPolygonInnerRing:Array<GLMapGeoPoint>) -> Void {
        __addGeoPolygonInnerRing(geoPolygonInnerRing, pointCount:geoPolygonInnerRing.count)
    }
}

extension GLMapMarkerData {
    /**
     Sets location to the marker.
     
     @param location New location value
     */
    public func setLocation(_ location:GLMapPoint) {
        GLMapMarkerSetLocation(self, location)
    }

    /**
     Sets style to the marker. Style indexes returned by `GLMapMarkerStyleCollection`, when new image is added
     
     @param style Index of the style.
     */
    public func setStyle(_ style:UInt) {
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
    public static let stateChanged = Notification.Name("kGLMapInfoStateChanged");
    
    /// Notification is sent when GLMapInfo.downloadProgress or GLMapInfo.processedProgress property is changed
    public static let downloadProgress = Notification.Name("kGLMapInfoDownloadProgress");
    
    /// Notification is sent when map is downloaded
    public static let downloadFinished = Notification.Name("kGLMapInfoDownloadFinished");
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
    public static func empty() -> GLMapBBox {
        return GLMapBBoxEmpty();
    }
    
    /// Adds point into bounding box object
    public mutating func addPoint(_ point:GLMapPoint) {
        self = GLMapBBoxAddPoint(self, point);
    }
    
    /// Returns the center of the bounding box
    public var center: GLMapPoint {
        return GLMapBBoxCenter(self)
    }
}
