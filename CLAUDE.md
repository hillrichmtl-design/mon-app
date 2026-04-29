# Mes Paiements — État du projet (avril 2026)

## Repos GitHub

| Repo | Contenu | URL |
|---|---|---|
| `hillrichmtl-design/mon-app` | App React desktop + source PWA | https://github.com/hillrichmtl-design/mon-app |
| `hillrichmtl-design/paiements-app` | PWA iPhone déployée | https://hillrichmtl-design.github.io/paiements-app |

## Fichiers clés (Mac)

| Fichier | Chemin |
|---|---|
| App React desktop | `~/claude-work/projets/mon-app/src/paiements.jsx` |
| PWA iPhone | `~/claude-work/projets/mon-app/paiements-pwa/index.html` |
| Service Worker | `~/claude-work/projets/mon-app/paiements-pwa/sw.js` (v10) |

> **Règle de sync** : tout changement de logique doit être appliqué dans `paiements.jsx` ET `paiements-pwa/index.html` simultanément.

## Liste des paiements (BILLS)

```
Hydro-Québec       246,13$  Perso      days:[1]
Energir             77,28$  Perso      days:[1]
Taxes municipales  500,00$  Perso      days:[15]
Taxes scolaires     32,46$  Perso      days:[1]
Ebox Internet       75,00$  Perso      days:[15]
Assurances vie     227,00$  Perso      days:[9]
Prêt fenêtres      102,73$  Perso      days:[1]
Telus téléphone     99,00$  Perso      days:[15]
Assurances maison  139,00$  Perso      days:[1]
Telus Alarme        45,00$  Perso      days:[1]
Assurances auto    175,00$  Perso      days:[20]
Marge de crédit    100,00$  Perso      days:[1]
Hypothèque         972,02$  Conjoints  biweekly: new Date(2026,2,27)  ← aux 2 semaines
Paiement auto      479,00$  Conjoints  days:[1]
Paiement auto      479,00$  Conjoints  days:[20]
```

## Logique métier critique

### Périodes P1/P2

```js
const payDay15 = prevBusinessDay(new Date(curY, curM, 15));
const p1End = new Date(payDay15.getTime() - 86400000); // veille du jour de paie
// P1 : 1er → p1End | P2 : payDay15 → fin du mois
```

### Paiements aux 2 semaines (hypothèque)

```js
{ id:"hypotheque", biweekly: new Date(2026,2,27), ... }
// Dans generatePayments() : ancrage 27 mars, +14 jours, ajusté au jour ouvrable précédent
```

## Push GitHub (depuis Terminal Mac)

```bash
# Pour mon-app (React + PWA source)
cd ~/claude-work/projets/mon-app && bash push.sh

# Pour paiements-app (PWA iPhone déployée)
cd ~/claude-work/projets/paiements-app
cp ~/claude-work/projets/mon-app/paiements-pwa/index.html .
cp ~/claude-work/projets/mon-app/paiements-pwa/sw.js .
git add index.html sw.js && git commit -m "..." && git push origin main
```

> **Auth GitHub** : géré via `gh auth login` (CLI) ou stocké hors repo. Aucun token en clair dans ce fichier.

## Jira / Confluence

- **Cloud ID** : `1422516c-a29d-4a3d-80b9-e438edb68651`
- **Projet** : `SCRUM` | **Confluence page** : `393217`
- **Version app** : 1.0.2 | **Guide/Confluence** : 1.0.3 | **SW** : v10

## Versions

| Composant | Version |
|---|---|
| App | v1.0.2 |
| Service Worker | mes-paiements-v10 |
| Guide Confluence | v1.0.3 |
| Dernière mise à jour | 10 avril 2026 |
