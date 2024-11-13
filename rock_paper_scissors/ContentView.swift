import SwiftUI

struct ContentView: View {
    
    @State var playerChoice = "paper"
    @State var cpuChoice = "paper"
    @State var playerScore = 0
    @State var computerScore = 0
    @State var result = ""
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Spacer()
                    VStack{
                        Image(playerChoice)
                            .resizable()
                            .frame(width: 150, height: 200)
                        Spacer().frame(height: 10)
                        Text(playerChoice)
                        Text("Player Choice")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    Spacer()
                    VStack{
                        Image(cpuChoice)
                            .resizable()
                            .frame(width: 150, height: 200)
                        Spacer().frame(height: 10)
                        Text(cpuChoice)
                        Text("Computer Choice")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    Spacer()
                }
                .padding(10)
                
                VStack {
                    Text("Last Game result: " + result)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding()
                }
                
              
                HStack {
                    VStack {
                        Text("Player Score")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(String(playerScore))
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                    
                    VStack {
                        Text("Computer Score")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text(String(computerScore))
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding(.horizontal, 50)
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        changePlayerChoice(choice: "rock")
                    }) {
                        Text("Rock")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color.red)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .padding(5)
                    }
                    
                    Spacer()
                    Button(action: {
                        changePlayerChoice(choice: "paper")
                    }) {
                        Text("Paper")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color.blue)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .padding(5)
                    }
                    
                    Spacer()
                    Button(action: {
                        changePlayerChoice(choice: "scissor")
                    }) {
                        Text("Scissors")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color.green)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .padding(5)
                    }
                    Spacer()
                }
                .padding(.vertical, 20)
                
                
                HStack {
                    Spacer()
                    Button(action: {
                        play()
                    }) {
                        Text("Play")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color.green)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .padding(5)
                    }
                    
                    Spacer()
                    Button(action: {
                        resetGame()
                    }) {
                        Text("Reset")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding()
                            .frame(width: 100, height: 50)
                            .background(Color.orange)
                            .cornerRadius(12)
                            .foregroundColor(.white)
                            .shadow(radius: 5)
                            .padding(5)
                    }
                    Spacer()
                }
                .padding(.top, 30)
            }
        }
        .padding()
    }
    
    func changePlayerChoice(choice: String){
        playerChoice = choice
    }
    
    func play() {
        let choices = ["rock", "paper", "scissor"]
        cpuChoice = choices.randomElement()!
        
        if playerChoice == cpuChoice {
            result = "It's a tie!"
        } else if (playerChoice == "rock" && cpuChoice == "scissor") ||
                  (playerChoice == "scissor" && cpuChoice == "paper") ||
                  (playerChoice == "paper" && cpuChoice == "rock") {
            playerScore += 1
            result = "Player wins!"
        } else {
            computerScore += 1
            result = "Computer wins!"
        }
    }
    
    // Reset game function
    func resetGame() {
        playerChoice = "paper"
        cpuChoice = "paper"
        playerScore = 0
        computerScore = 0
        result = ""
    }
}

#Preview {
    ContentView()
}
