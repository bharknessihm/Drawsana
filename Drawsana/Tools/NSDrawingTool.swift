//
//  NSDrawingTool.swift
//  Drawsana
//
//  Created by Barry Harkness on 7/1/19.
//  Copyright © 2019 Asana. All rights reserved.
//

import UIKit

public class NSDrawingTool: NSObject, DrawingTool {
    
    public override init() { super.init() }
    
    public var isProgressive: Bool { return false }

    public var name: String { fatalError("Override me") }
    
    public func handleTap(context: ToolOperationContext, point: CGPoint) {
    }
    
    public func handleDragStart(context: ToolOperationContext, point: CGPoint) {
    }
    
    public func handleDragContinue(context: ToolOperationContext, point: CGPoint, velocity: CGPoint) {
    }
    
    public func handleDragEnd(context: ToolOperationContext, point: CGPoint) {
    }
    
    public func handleDragCancel(context: ToolOperationContext, point: CGPoint) {
    }
    
    public func activate(shapeUpdater: DrawsanaViewShapeUpdating, context: ToolOperationContext, shape: Shape?) { }
    public func deactivate(context: ToolOperationContext) { }
    public func apply(context: ToolOperationContext, userSettings: UserSettings) { }
    public func renderShapeInProgress(transientContext: CGContext) { }
    

}
