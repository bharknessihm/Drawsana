//
//  DrawingToolForShapeWithTwoPoints.swift
//  Drawsana
//
//  Created by Steve Landey on 8/9/18.
//  Copyright © 2018 Asana. All rights reserved.
//

import CoreGraphics

/**
 Base class for tools (rect, line, ellipse) that are drawn by dragging from
 one point to another
 */
public class DrawingToolForShapeWithTwoPoints: NSDrawingTool {
  public typealias ShapeType = Shape & ShapeWithTwoPoints

  public override var name: String { fatalError("Override me") }

  public var shapeInProgress: ShapeType?

  public override var isProgressive: Bool { return false }

  public override init() { super.init() }

  /// Override this method to return a shape ready to be drawn to the screen.
  public func makeShape() -> ShapeType {
    fatalError("Override me")
  }

  public override func handleTap(context: ToolOperationContext, point: CGPoint) {
  }

  public override func handleDragStart(context: ToolOperationContext, point: CGPoint) {
    shapeInProgress = makeShape()
    shapeInProgress?.a = point
    shapeInProgress?.b = point
    shapeInProgress?.apply(userSettings: context.userSettings)
  }

  public override func handleDragContinue(context: ToolOperationContext, point: CGPoint, velocity: CGPoint) {
    shapeInProgress?.b = point
  }

  public override func handleDragEnd(context: ToolOperationContext, point: CGPoint) {
    guard var shape = shapeInProgress else { return }
    shape.b = point
    context.operationStack.apply(operation: AddShapeOperation(shape: shape))
    shapeInProgress = nil
  }

  public override func handleDragCancel(context: ToolOperationContext, point: CGPoint) {
    // No such thing as a cancel for this tool. If this was recognized as a tap,
    // just end the shape normally.
    handleDragEnd(context: context, point: point)
  }

  public override func renderShapeInProgress(transientContext: CGContext) {
    shapeInProgress?.render(in: transientContext)
  }

  public override func apply(context: ToolOperationContext, userSettings: UserSettings) {
    shapeInProgress?.apply(userSettings: userSettings)
    context.toolSettings.isPersistentBufferDirty = true
  }
}
