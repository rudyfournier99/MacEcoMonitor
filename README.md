# Mac Infrastructure Monitor (SwiftUI)

Une petite application macOS native développée en **SwiftUI**. Ce projet me permet de lier ma sensibilité pour le **Design UI/UX** et l'écosystème Apple avec les concepts systèmes et réseaux.

L'application propose une interface épurée pour surveiller l'état matériel de la machine locale (Hôte) et sa connectivité avec la passerelle réseau.

## Côté Design (UI/UX) :
* Respect des *Human Interface Guidelines* d'Apple.
* Utilisation des *SF Symbols* natifs pour les icônes de statut.
* Interface sombre/claire automatique (Dark Mode natif).

## Côté Système & Réseau (SISR / CIEL) :
* Gestion des états d'affichage dynamique via les propriétés `@State` de Swift.
* Simulation de requêtes de diagnostics réseau (Ping) vers une adresse IP locale de test (`192.168.1.1`).
* Logique d'interrogation des composants matériels (Batterie).

## Comment le lancer :
1. Ouvrez le projet dans **Xcode** sur un Mac.
2. Cliquez sur le bouton *Play* (ou `Cmd + R`) pour lancer l'application dans le simulateur ou directement sur votre Mac.

## Évolutions prévues :
* [ ] Remplacer le code de simulation par un vrai appel système `Process()` pour exécuter la commande `/sbin/ping`.
* [ ] Ajouter une alerte visuelle de type *Notification Mac* si l'infrastructure réseau ne répond plus.
