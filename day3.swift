let url3 = Bundle.main.url(forResource: "inputDay3", withExtension: nil)!
let data3 = try! String(contentsOf: url3).split(separator: "\n")

func getNumberOfTrees(deltaX: Int, deltaY: Int) -> Int {
    var numTrees = 0
    var column = 0
    
    for (yIdx, row) in data3.enumerated() {
        if yIdx % deltaY != 0 {
            continue
        }
        numTrees += row[column % row.count] == "#" ? 1 : 0
        column += deltaX
    }
    return numTrees
}

var day3answers = [Int]()
day3answers.append(getNumberOfTrees(deltaX: 1, deltaY: 1))
day3answers.append(getNumberOfTrees(deltaX: 3, deltaY: 1))
day3answers.append(getNumberOfTrees(deltaX: 5, deltaY: 1))
day3answers.append(getNumberOfTrees(deltaX: 7, deltaY: 1))
day3answers.append(getNumberOfTrees(deltaX: 1, deltaY: 2))

print(day3answers.reduce(1, *))
