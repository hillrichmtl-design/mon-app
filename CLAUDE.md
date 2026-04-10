# Contexte projet — Mes Paiements

Fichier de référence pour Claude (Cowork). À lire au début de chaque session.

## Structure du projet

| Fichier | Rôle |
|---|---|
| `src/paiements.jsx` | App React desktop (projet Mac) |
| `push.sh` | Script de push GitHub — à exécuter après chaque session |

## Fichiers liés (hors ce repo)

| Artefact | Chemin dans la session VM |
|---|---|
| App PWA iPhone | `outputs/paiements-pwa/index.html` |
| Service Worker | `outputs/paiements-pwa/sw.js` |
| App HTML standalone | `outputs/paiements.html` |
| PRD | `outputs/PRD-paiements.md` |
| Epic / User Stories | `outputs/EPIC-mes-paiements.md` |
| User Guide | `outputs/guide-mes-paiements.md` |

## GitHub

- **Repo React** : `https://github.com/hillrichmtl-design/mon-app.git`
- **Branch** : `main`
- **Push** : Richard exécute `bash ~/mon-app/push.sh` depuis son Terminal Mac après chaque session

> ⚠️ Claude ne peut pas pousser directement vers GitHub depuis la VM (restriction réseau).
> Après toute modification de code, rappeler à Richard d'exécuter `push.sh`.

## Jira / Confluence

- **Cloud ID** : `1422516c-a29d-4a3d-80b9-e438edb68651`
- **Projet** : `SCRUM`
- **Stories clés** : SCRUM-12 (périodes P1/P2), SCRUM-16 (Service Worker)
- **Confluence page** : `393217` (Guide d'utilisation)

## Règles de synchronisation (IMPORTANT)

Après **tout** changement de code dans l'un des fichiers, appliquer les corrections
dans les **trois fichiers** simultanément :
1. `paiements-pwa/index.html`
2. `paiements.html`
3. `src/paiements.jsx` (ce repo)

Puis synchroniser les artefacts (PRD, Epic, User Guide, Jira, Confluence)
via le skill `anthropic-skills:paiements-sync`.

## Logique métier critique — Périodes de paie

```js
// CORRECT — à utiliser dans les trois fichiers
const payDay15 = prevBusinessDay(new Date(curY, curM, 15));
const p1End = new Date(payDay15.getTime() - 86400000); // veille du jour de paie
// P1 : du 1er à p1End (inclus)
// P2 : de payDay15 à fin du mois
```

**Ne jamais** utiliser `prevBD(15)` directement comme borne de fin de P1 —
c'est le bug v1.0 qui incluait les paiements du 15 dans P1.

## Versions actuelles

| Composant | Version |
|---|---|
| App | v1.0.2 |
| Service Worker | mes-paiements-v9 |
| User Guide / Confluence | v1.0.2 |
| Dernière mise à jour | 22 mars 2026 |
