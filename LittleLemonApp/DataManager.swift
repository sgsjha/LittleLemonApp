import FirebaseFirestore
import FirebaseAuth
import FirebaseDatabase
import Firebase
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
                    let date = (data["date"] as? Timestamp)?.dateValue() ?? Date()
                    let time = (data["time"] as? Timestamp)?.dateValue() ?? Date()
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

        let db = Firestore.firestore()
        let newReservation = [
            "date": Timestamp(date: date),
            "time": Timestamp(date: time),
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
}

