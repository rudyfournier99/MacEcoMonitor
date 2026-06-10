import SwiftUI
import Foundation

struct ContentView: View {
    // Variables pour stocker l'état (parfait pour l'UI)
    @State private var niveauBatterie: Int = 100
    @State private var estEnCharge: Bool = false
    @State private var statutServeur: String = "Non vérifié"
    @State private var serveurColor: Color = .gray
    
    // IP de la box internet ou du serveur local à tester
    let ipPasserelle = "192.168.1.1"

    var body: some View {
        VStack(spacing: 20) {
            // --- SECTION HEADER (Style Apple Épuré) ---
            Text("🎛️ Mac Infrastructure Monitor")
                .font(.headline)
                .padding(.top)

            Divider()

            // --- SECTION BATTERIE (Clin d'œil Système) ---
            HStack {
                Image(systemName: estEnCharge ? "battery.100.bolt" : "battery.75")
                    .font(.title)
                    .foregroundColor(niveauBatterie < 20 ? .red : .green)
                
                VStack(alignment: .leading) {
                    Text("Statut de l'Hôte local :")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text("Batterie : \(niveauBatterie)% \(estEnCharge ? "(En charge)" : "")")
                        .font(.body)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // --- SECTION RÉSEAU (BTS SIO / CIEL) ---
            HStack {
                Image(systemName: "network")
                    .font(.title)
                    .foregroundColor(serveurColor)
                
                VStack(alignment: .leading) {
                    Text("Passerelle réseau (\(ipPasserelle)) :")
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Text(statutServeur)
                        .font(.body)
                        .foregroundColor(serveurColor)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            Divider()

            // --- BOUTON D'ACTION ---
            Button(action: {
                verifierInfrastructure()
            }) {
                Text("Actualiser le statut")
                    .padding(.horizontal, 10)
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
        }
        .frame(width: 320, height: 250)
        .onAppear {
            // Se lance au démarrage de l'app
            verifierInfrastructure()
        }
    }

    // Fonction "Système & Réseau"
    func verifierInfrastructure() {
        // 1. Récupération des infos de la batterie (Via l'API Apple)
        // Note : simulation simple pour l'exercice
        self.niveauBatterie = Int(getRandomBatteryLevel())
        self.estEnCharge = true
        
        // 2. Simulation d'un Ping Réseau vers la passerelle
        // TODO: Implémenter un vrai Process() de ping plus tard
        let pingReussi = Bool.random() // Simule une réponse réseau
        
        if pingReussi {
            self.statutServeur = "🟢 Connecté à l'infrastructure"
            self.serveurColor = .green
        } else {
            self.statutServeur = "🔴 Passerelle injoignable"
            self.serveurColor = .red
        }
    }
    
    // Petite fonction de calcul brute pour simuler la batterie
    func getRandomBatteryLevel() -> Double {
        return Double.random(in: 15...99).rounded()
    }
}

// Pour voir le rendu dans Xcode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
