import Foundation

public func manhattanDistance(firstNode: Node, secondNode: Node) -> Int {
    return abs(firstNode.row - secondNode.row) +
    abs(firstNode.column - secondNode.column)
}



/// Rounds a given float to a specified number of decimal places.
/// - Parameters:
///   - number: The float value to round.
///   - places: The number of decimal places to round to.
/// - Returns: A float rounded to the specified number of decimal places.
public func roundToDecimal(_ number: Float, places: Int) -> Float {
    let divisor = pow(10.0, Float(places))
    return (number * divisor).rounded() / divisor
}

/// Converts an angle from radians to degrees.
/// - Parameter radians: The angle in radians.
/// - Returns: The equivalent angle in degrees.
public func radiansToDegrees(_ radians: Float) -> Float {
    return radians * (180.0 / Float.pi)
}

#warning ("possible remove of function")
/// Normalizes an angle to the range of -π to π.
/// - Parameter angle: The angle in radians to normalize.
/// - Returns: The normalized angle within the range of -π to π.
public func normalizeAngleToPi(_ angle: Float) -> Float {
    var normalizedAngle = angle.truncatingRemainder(dividingBy: 2 * Float.pi)
    if normalizedAngle > Float.pi {
        normalizedAngle -= 2 * Float.pi
    } else if normalizedAngle < -Float.pi {
        normalizedAngle += 2 * Float.pi
    }
    return normalizedAngle
}

/// Calculates the bearing (or angle) from a starting point to an ending point.
/// - Parameters:
///   - start: The starting point as a `Point` object.
///   - end: The ending point as a `Point` object.
/// - Returns: The bearing in radians, ranging from -π to π.
public func calculateBearing(from start: Point, to end: Point) -> Float {
    let deltaX = end.x - start.x
    let deltaY = end.y - start.y
    return atan2(deltaY, deltaX)
}

/// Computes the Euclidean distance between two points.
/// - Parameters:
///   - start: The starting point as a `Point` object.
///   - end: The ending point as a `Point` object.
/// - Returns: The Euclidean distance as a float.
public func euclideanDistance(from start: Point, to end: Point) -> Float {
    let deltaX = end.x - start.x
    let deltaY = end.y - start.y
    return hypot(deltaX, deltaY)
}


/// Finds the closest point on a path to a given current location.
/// - Parameters:
///   - path: An array of `Point` objects representing the path.
///   - currentLocation: The current location as a `Point`.
/// - Returns: The point on the path that is closest to the current location, or `nil` if the path is empty.
public func findClosestPathPoint(path: [Point], from currentLocation: Point) -> Point? {
    guard !path.isEmpty else { return nil }
    
//    var filteredPath = path.filter { $0 != currentLocation }
//    filteredPath.removeFirst(5)
//    return filteredPath.min(by: { euclideanDistance(from: $0, to: currentLocation) < euclideanDistance(from: $1, to: currentLocation) })
    return path.min(by: { euclideanDistance(from: $0, to: currentLocation) < euclideanDistance(from: $1, to: currentLocation) })
}


/// Verifica se esiste una linea di vista tra due punti senza ostacoli.
/// - Parameters:
///   - start: Il punto di partenza.
///   - end: Il punto di arrivo.
///   - obstacles: Un array di ostacoli (conformi al protocollo `Obstacle`).
/// - Returns: `true` se la linea tra `start` ed `end` non interseca nessun ostacolo, altrimenti `false`.
@available(iOS 13.0, *)
func isLineOfSight(start: Point, end: Point, obstacles: [Obstacle]) -> Bool {
    let steps: Int = 100 // Numero di campionamenti tra i due punti
    let dx = (end.x - start.x) / Float(steps)
    let dy = (end.y - start.y) / Float(steps)
    
    for i in 0...steps {
        let x = start.x + dx * Float(i)
        let y = start.y + dy * Float(i)
        let currentPoint = Point(x: x, y: y)
        
        // Verifica se il punto corrente è all'interno di un ostacolo
        if obstacles.contains(where: { $0.contains(point: currentPoint, safeArea: true) }) {
            return false
        }
    }
    return true
}


