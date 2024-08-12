import FirebaseFirestore
import FirebaseAuth

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
                    return Reservation(
                        id: doc.documentID,
                        date: data["date"] as? String ?? "",
                        time: data["time"] as? String ?? "",
                        guests: data["guests"] as? Int ?? 1
                    )
                }
            }
        }
    }

    func addReservation(date: String, time: String, guests: Int) {
        guard let userID = Auth.auth().currentUser?.uid else {
            print("User not logged in")
            return
        }

        let db = Firestore.firestore()
        let newReservation = [
            "date": date,
            "time": time,
            "guests": guests,
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
}

