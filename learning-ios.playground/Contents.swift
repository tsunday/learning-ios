var state: Int = 0
state = 1

let constant: String = "Learning"
// constant = "Testing" // unable to change constants

var title = "\(constant) iOS development"

var numbers = [1, 2, 3, 4, 5]
let mappyMap = [
    "a": "alpha",
    "b": "beta"
]

//mappyMap["a"] = "beta"
var hack = mappyMap["a"]
hack = "delta"
mappyMap["a"]
print("Uh, Swift is really safe")

var placeholder: String? = ""

if let text = placeholder {
    print(text)
}

func printPlaceholder(placeholder text: String) {
    if text.isEmpty{
        print(text)
    }
}

printPlaceholder(placeholder: "")
printPlaceholder(placeholder: "words")


func higherOrderFunction(multiplier: Int) -> ((Double) -> Double) {
    func multiply(value: Double) -> Double{
        return value * Double(multiplier)
    }
    return multiply
}

let fourMultiplier = higherOrderFunction(multiplier: 4)
//fourMultiplier(value: 1.23) // strange behavior
fourMultiplier(1.23)

protocol Communicator {
    var layer: String {get}
    func sendMessage()
}

class NetworkCommunicator: Communicator {
    var layer = "ipv4"
    func sendMessage() {
        self.layer = "ipv6" // not mutating function but it works - have to read more
        print("just joking!")
    }
}

let netcom = NetworkCommunicator()
netcom.sendMessage()

protocol ErrorHandlingCommunicator {
    func sendSafeMessage(address: String)
}

enum NetworkError: Error {
    case packetLost
    case disconnected
}

extension NetworkCommunicator: ErrorHandlingCommunicator {
    func sendSafeMessage(address: String) {
        do {
            if address == "local" {
                throw NetworkError.packetLost
            }
            else {
                throw NetworkError.disconnected
            }
        } catch NetworkError.packetLost {
            print("packet lost")
        } catch NetworkError.disconnected {
            print("disconnected")
        } catch {
            print(error)
        }
    }
}

let safeNetCom = NetworkCommunicator()
safeNetCom.sendSafeMessage(address: "local")
safeNetCom.sendSafeMessage(address: "public")


func noIdea<Something>(_ input: Something, reps: Int) -> [Something] {
    var output: [Something] = []
    for _ in 0..<reps {
        output.append(input)
    }
    return output
}

noIdea("input", reps: 3)

var potential: String? = "test"

// Accessing optional values with !
print(potential!)

var implicitPotential: String! = "test"
print(potential!)

assert(potential != nil, "optional value is missing")
precondition(implicitPotential != nil)


