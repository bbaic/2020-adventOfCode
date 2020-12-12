
let url4 = Bundle.main.url(forResource: "inputDay4", withExtension: nil)!
let data4 = try! String(contentsOf: url4).split(separator: "\n", omittingEmptySubsequences: false)

// part 1
func countUniqueAnswers(in groupAnswers: [String.SubSequence]) -> Int {
    var uniques = Set<String>()
    for row in groupAnswers {
    
        for character in row {
            uniques.insert(String(character))
        }
    }
    return uniques.count
}

// part2
func countUnanimousAnswers(in groupAnswers: [String.SubSequence]) -> Int {
    let charsSeen = groupAnswers.reduce([], +)
    let keys = Set(charsSeen)
    var count = 0
    for key in keys {
        if charsSeen.filter({ $0 == key }).count == groupAnswers.count {
            count += 1
        }
    }
    
    return count
}

var groupAnswers = [String.SubSequence]()
var countPerGroup = [Int]()
var unanimousPerGroup = [Int]()
for personAnswers in data4 {
    
    if personAnswers == "" {
        countPerGroup.append(countUniqueAnswers(in: groupAnswers))
        unanimousPerGroup.append(countUnanimousAnswers(in: groupAnswers))
        groupAnswers.removeAll()
    } else {
        groupAnswers.append(personAnswers)
    }
}

print(countPerGroup)
print(countPerGroup.reduce(0, +))

print(unanimousPerGroup)
print(unanimousPerGroup.reduce(0, +))
