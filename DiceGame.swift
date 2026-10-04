import Foundation

// secret = random number 1-6
// guesses = 0
let secret = Int.random(in: 1...6)
var guesses = 0

print("Welcome to DiceGame!")
print("I have picked a random number between 1 and 6.")

while true {
    // Prompt: Enter your guess
    print("\nEnter your guess: ", terminator: "")
    guard let rawInput = readLine() else { continue }
    let input = rawInput.trimmingCharacters(in: .whitespacesAndNewlines)

    // Valid whole number from 1 to 6?
    // Swift uses optional binding (Int(input)) instead of try-catch for string conversion
    guard let guess = Int(input) else {
        print("Display error message: Invalid whole number!")
        continue // Re-prompt without counting as a guess
    }

    if guess < 1 || guess > 6 {
        print("Display error message: Number must be from 1 to 6!")
        continue // Re-prompt without counting as a guess
    }

    // guesses = guesses + 1
    guesses += 1

    // guess == secret?
    if guess == secret {
        print("Display: Correct! It took \(guesses) guesses")
        break
    } else if guess > secret {
        print("Display: Too high")
    } else {
        print("Display: Too low")
    }
}
