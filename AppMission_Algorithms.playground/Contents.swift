
import Foundation

func LogDumpGetUnique() -> String {
    // Input log string
    let log_dump = "name=John Trust, username=john3, email=john3@gmail.com, id=434453; name=Hannah Smith, username=hsmith, email=hsm@test.com, id=23312; name=Hannah Smith, username=hsmith, id=3223423, email=hsm@test.com; name=Robert M, username=rm44, id=222342, email=rm@me.com; name=Robert M, username=rm4411, id=5535, email=rm@me.com; name=Susan Vee, username=sv55, id=443432, email=susanv123@me.com; name=Robert Nick, username=rnick33, id=23432, email=rnick@gmail.com; name=Robert Nick II, username=rnickTemp34, id=23432, email=rnick@gmail.com; name=Susan Vee, username=sv55, id=443432, email=susanv123@me.com;"
    
    // __define-ocg__ - Process log items
    let items = log_dump.components(separatedBy: "; ")
    var varOcg = Set<String>() // Track seen usernames
    var varFiltersCg = [String]() // Store unique items
    
    for item in items {
        // Split item into individual properties
        let properties = item.components(separatedBy: ", ")
        var username = ""
        var filteredProperties = [String]()
        
        // Process each property
        for prop in properties {
            if prop.starts(with: "username=") {
                username = prop
            }
            if !prop.starts(with: "id=") {
                filteredProperties.append(prop)
            }
        }
        
        // Only add if username hasn't been seen before
        if !varOcg.contains(username) {
            varOcg.insert(username)
            varFiltersCg.append(filteredProperties.joined(separator: ", "))
        }
    }
    
    // Return filtered items joined with semicolons
    if !varFiltersCg.isEmpty {
        return varFiltersCg.joined(separator: "; ") + ";"
    }
    return ""
}

print(LogDumpGetUnique())
