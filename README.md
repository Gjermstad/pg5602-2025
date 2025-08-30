# PG5602 iOS Programmering (Høst 2025)

Dette repoet samler all kode fra forelesninger og hjemmeoppgaver i faget PG5602.  
Strukturen er organisert etter forelesning (og oppgaver), med egne mapper for hvert prosjekt.

## Struktur
```
pg5602-2025/
│
├── lectures/
│ ├── 01-state-basics/
│ │ └── StateBasics.xcodeproj
│ ├── 02-navigation/
│ └── 03-networking/
│
├── assignments/
│ └── 01-homework-navigation/
│
├── .gitignore
└── README.md
```

- **lectures/**: kodeprosjekter fra forelesninger  
- **assignments/**: hjemmeoppgaver og øvinger som ikke er direkte del av en forelesning  

> Hvert prosjekt er et eget Xcode-prosjekt i sin mappe.  
> Åpne alltid `.xcodeproj`-fila i den aktuelle mappen, ikke hele repoet i Xcode.

---

## Git-rutine

Jeg bruker **tags** for å markere start og slutt på hver forelesning/oppgave:

- `l01-start` – startkode for forelesning 1  
- `l01-end` – sluttkode for forelesning 1  
- `l02-start`, `l02-end`, osv.  
- `hw01-start`, `hw01-end` for hjemmeoppgaver

### Eksempel: forelesning 3

1. Lag prosjekt i `lectures/03-navigation/`
2. Commit og tag før timen:
   ```bash
   git add .
   git commit -m "L03: start"
   git tag l03-start
   git push && git push --tags
   ```

3. Etter timen:
```bash
git add .
git commit -m "L03: end"
git tag l03-end
git push && git push --tags
```

---

## Viktige notater om Git

- **Package.resolved**: Denne skal *alltid* være med i Git. Den låser avhengighetene dine slik at alle bygger prosjektet med samme versjoner.  
- **Pods/**: Som standard har jeg lagt den i `.gitignore` (så du installerer avhengigheter med `pod install` lokalt). Hvis du en dag jobber i et team eller leverer prosjekt der sensor ikke kjører `pod install`, kan du fjerne `Pods/` fra `.gitignore` og commite hele mappen.

Kort sagt:
- `Package.resolved` → commit ✅  
- `Pods/` → ignorér som student, men commit hvis sensor/prosjekt krever det.
