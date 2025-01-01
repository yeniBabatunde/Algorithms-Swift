import UIKit

var greeting = "Hello, playground"

func findProcesses(_ start_item: String,_ end_item: String,_ tasks: Array<String>) -> Array<String> {
    
  var transformations: [String: [(String, String)]] = [:]
  let startItem = start_item
  let endItem = end_item
  
  for task in tasks {
    let parts = task.split(separator: ":")
    guard parts.count == 3 else { continue }
    let processName = String(parts[0])
    let fromItem = String(parts[1])
    let toItem = String(parts[2])
    
    if transformations[fromItem] == nil {
      transformations[fromItem] = []
    }
    transformations[fromItem]?.append((processName, toItem))
  }
  
  if startItem == endItem {
    return []
  }
  
  var queue: [(String, [String])] = [(startItem, [])]
  var visited: Set<String> = [startItem]
  
  while !queue.isEmpty {
    let (currentItem, path) = queue.removeFirst()
    
    if currentItem == endItem {
      return path
    }
    
    if let nextSteps = transformations[currentItem] {
      for (process, toItem) in nextSteps {
        if !visited.contains(toItem) {
          visited.insert(toItem)
          queue.append((toItem, path + [process]))
        }
      }
    }
  }
    return []
}
