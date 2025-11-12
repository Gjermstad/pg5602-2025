Her er en oversikt over de viktigste URL-egenskapene i Swift og hva de gjør:

1. url.absoluteString

Type: String

Hva den gjør: Returnerer hele URL-en som en streng, inkludert protokoll, host, path, query osv.

Eksempel:

let url = URL(string: "https://example.com/path/to/page?query=123")!
print(url.absoluteString)
// Output: "https://example.com/path/to/page?query=123"

2. url.scheme

Type: String?

Hva den gjør: Returnerer protokollen (f.eks. "https", "http", "ftp").

Eksempel:

print(url.scheme) // Output: Optional("https")

3. url.host

Type: String?

Hva den gjør: Returnerer domenenavnet eller IP-adressen.

Eksempel:

print(url.host) // Output: Optional("example.com")

4. url.path

Type: String

Hva den gjør: Returnerer path-en etter hosten, uten query.

Eksempel:

print(url.path) // Output: "/path/to/page"

5. url.query

Type: String?

Hva den gjør: Returnerer query-delen etter ? som en streng.

Eksempel:

print(url.query) // Output: Optional("query=123")

6. url.port

Type: Int?

Hva den gjør: Returnerer portnummeret hvis det er spesifisert.

Eksempel:

let url2 = URL(string: "https://example.com:8080")!
print(url2.port) // Output: Optional(8080)

7. url.user og url.password

Type: String?

Hva de gjør: Returnerer brukernavn og passord fra URL-en hvis det er satt.

Eksempel:

let url3 = URL(string: "https://user:pass@example.com")!
print(url3.user)     // Output: Optional("user")
print(url3.password) // Output: Optional("pass")

Oppsummering

absoluteString = hele URL-en som en streng

scheme = protokoll

host = domenenavn

path = stien etter hosten

query = query-parameterne

port = portnummer

user og password = valgfri autentisering
