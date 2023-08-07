import SwiftUI
import UniformTypeIdentifiers
import Alamofire


struct ChatView: View {
    private enum Field: Int, CaseIterable {
        case currentInput
    }
//    @ObservedObject var viewModel = ViewModel()
    @FocusState private var focusedField: Field?
    @State var messageText: String = ""
    @State var chatMessages: [Message] = Message.messages
    @State private var chatHistory: [Data] = []
    var body: some View {
        NavigationStack{
            VStack{

                HStack{
                    
                    Label{
                        Text("KazLawAI")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                    }icon:{
                        Image("LawyerIcon")
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth:50, alignment:.trailing)
                    }
                    Spacer()
                }
//                .padding(.leading, 10)
                ScrollView{
                    ForEach(chatMessages, id: \.id) { message in
                                            messageView(message: message)
                    }
                }
                
                HStack{
                    TextField("", text: $messageText, prompt: Text("Введите сообщение...").foregroundColor(.white),axis: .vertical)
                        .focused($focusedField, equals: .currentInput).textSelection(.enabled)
                        .accentColor(.teal)
                        .foregroundColor(.white)
                    Button{
                        sendMessage()
                    } label: {
                        Text("Отправить")
                            .foregroundColor(.teal)
                    }
                }
                .padding()
               
                .background(RoundedRectangle(cornerRadius: 30.0).fill(Color(red: 47/255, green: 47/255, blue: 54/255)))
                
//                .padding()
//                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 10, y: 10)
//                .shadow(color: Color.white.opacity(0.7), radius: 10, x: -5, y: -5)
        

            }
        
            .padding()
            .onAppear{
                loadChatHistory()
            }
            .onTapGesture {
                focusedField = nil
            }
            .onDisappear{
                saveChatHistory()
            }
            .background(Color(red: 21/255, green: 20/255, blue: 25/255))
//            .background(Color(red: 241/255, green: 239/255, blue: 231/255))
            .navigationBarTitleDisplayMode(.inline)

        }
    }
    
    func loadChatHistory() {
        let chatHistoryKey = "ChatHistoryKey"
        if let data = UserDefaults.standard.value(forKey: chatHistoryKey) as? [Data] {
            chatHistory = data
            chatMessages = chatHistory.compactMap { data in
                try? JSONDecoder().decode(Message.self, from: data)
            }
        }
    }
    
    func saveChatHistory() {
        let chatHistoryKey = "ChatHistoryKey"
        chatHistory = chatMessages.compactMap { message in
            try? JSONEncoder().encode(message)
        }
        UserDefaults.standard.setValue(chatHistory, forKey: chatHistoryKey)
    }
    
    func sendMessage() {
            // Trim the message text to remove leading and trailing white spaces
            let trimmedMessageText = messageText.trimmingCharacters(in: .whitespacesAndNewlines)

            // Check if the message is empty after trimming
            guard !trimmedMessageText.isEmpty else {
                return
            }
        let userMessage = Message(id: UUID(), content: messageText, createdAt: Date(), role: .user)
                chatMessages.append(userMessage)
            
            let requestPayload: [String: String] = [
                "request": messageText
            ]
        let headers: HTTPHeaders = [
                   "Content-Type" : "application/json"
               ]
            
            AF.request("https://fastapi-production-0c7a.up.railway.app/Chat", method: .post, parameters: requestPayload, encoder: JSONParameterEncoder.default, headers: headers)
                .validate()
                .responseDecodable(of: Response.self) { resp in
                    switch resp.result {
                    case .success(let chatResponse):
                        // Assuming the backend returns the phone number, booking text, and WhatsApp link
                        // in the same order they are sent, extract each response from the list.
                        let responseMessage = Message(id: UUID(), content: chatResponse.response, createdAt: Date(), role: .assistant)
                        chatMessages.append(responseMessage)
                        print(chatResponse.response)
                    case .failure(let error):
                        print(error)
                    }
                }
            
            messageText = ""
        }
//        .background()

    func messageView(message: Message) -> some View{
        HStack{
            if message.role == .user { Spacer() }
            
            Text(message.content)
//                .foregroundColor(message.role == .user ? .white : .black)
                .foregroundColor(.white)
                .padding()
                .background(message.role == .user ? .teal : Color(red: 47/255, green: 47/255, blue: 54/255))
                .cornerRadius(16)

            if message.role == .assistant { Spacer() }
        }
    }
}
struct Message: Codable,  Identifiable, Equatable {
    let id: UUID
    let content: String
    let createdAt: Date
    let role: SenderRole
}
enum SenderRole: String, Codable {
    case system
    case user
    case assistant
}


struct Response: Decodable {
    let response: String
}

extension Message {
    static let messages: [Message] = [Message(id:UUID(), content:  "Добро пожаловать в KazLawAI! Если у Вас возникли вопросы касательно законодательства Республики Казахстан, я с радостью отвечу Вам.", createdAt: Date(), role: .assistant), Message(id:UUID(), content:  "Имейте в виду, что я не предоставляю юридическую консультацию, а лишь информацию общего характера.", createdAt: Date(), role: .assistant), Message(id:UUID(), content:  "В случаях с серьезными правовыми вопросами, рекомендуется обратиться к профессиональному юристу.", createdAt: Date(), role: .assistant)]
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View{
        ChatView()
    }
}

