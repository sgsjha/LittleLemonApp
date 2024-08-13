import FirebaseFirestore
import FirebaseAuth
import Foundation

class DataManager: ObservableObject {
    @Published var reservations: [Reservation] = []

    init() {
        fetchReservations()
    }

    func fetchReservations() {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("User not logged in")
            return
        }

        let db = Firestore.firestore()
        let ref = db.collection("Reservations").whereField("userID", isEqualTo: userID)
        
        ref.getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching reservations: \(error.localizedDescription)")
            } else if let snapshot = snapshot {
                self.reservations = snapshot.documents.map { doc in
                    let data = doc.data()
                    let dateString = data["date"] as? String ?? ""
                    let timeString = data["time"] as? String ?? ""
                    
                    let date = self.dateFormatter.date(from: dateString) ?? Date()
                    let time = self.timeFormatter.date(from: timeString) ?? Date()
                    
                    return Reservation(
                        id: doc.documentID,
                        date: date,
                        time: time,
                        guests: data["guests"] as? Int ?? 1,
                        name: data["name"] as? String ?? ""
                    )
                }
            }
        }
    }

    func addReservation(date: Date, time: Date, guests: Int, name: String) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("User not logged in")
            return
        }

        let dateString = dateFormatter.string(from: date)
        let timeString = timeFormatter.string(from: time)
        
        let db = Firestore.firestore()
        let newReservation = [
            "date": dateString,
            "time": timeString,
            "guests": guests,
            "name": name,
            "userID": userID
        ] as [String : Any]

        db.collection("Reservations").addDocument(data: newReservation) { error in
            if let error = error {
                print("Error adding reservation: \(error.localizedDescription)")
            } else {
                self.fetchReservations() // Refresh the list after adding
            }
        }
    }

    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
    
    private var timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
}

