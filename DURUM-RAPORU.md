# Durum Raporu — HTML-Exercise

**Denetim tarihi:** 2026-09-07 · **Depo:** https://github.com/yokbi/HTML-Exercise
**Varsayılan dal:** `master` (dikkat: `main` değil)

---

## 1. Özet

| | |
|---|---|
| Tür | Kurs alıştırması — Coursera/Meta Front-End Developer, "Little Lemon" projesi |
| Teknoloji | Düz HTML5 + CSS. JavaScript yok (iki satırlık inline `onclick`/`oninput` hariç) |
| Derleme | Yok. Bağımlılık yok. `npm install` gerekmez. |
| Toplam kod | 5 HTML dosyası (2'si dolu, 2'si **0 bayt**, 1'i iskelet) + 58 satır CSS |
| Durum | **Yarım.** Yazılmış sayfalar çalışıyor; ana sayfa ve konum sayfası hiç yazılmamış. |
| Test / CI | Yok (bu ölçekte gerekmiyor) |

**Bir cümleyle:** İki tamamlanmış alıştırma sayfası (blog + rezervasyon formu) ve
üç boş/iskelet sayfa. Ders kapsamındaki metadata ve form konuları işlenmiş.

---

## 2. Dosya dosya ölçüm

`wc -c` ile ölçülmüştür:

```
blog.html      3985 bayt   97 satır   ✅
booking.html   3691 bayt   86 satır   ✅
signup.html     113 bayt    8 satır   ⚠️ boş iskelet
index.html        0 bayt    0 satır   ⛔ BOŞ
location.html     0 bayt    0 satır   ⛔ BOŞ
css/styles.css 1052 bayt   58 satır   ✅
```

---

## 3. Dal envanteri

| Dal | Durum |
|---|---|
| `master` | Varsayılan dal, tüm iş burada (2 commit: `first commit`, `#some bugfix`) |
| `claude/repo-audit-docs-e1dail` | Bu dokümantasyon dalı |

**Başka dalda saklı iş yoktur.**

> Not: Bu depo `master` kullanıyor, diğer depolarınızın çoğu `main`.
> Klonlarken/PR açarken karıştırmayın.

---

## 4. Bulgular

### 🟡 B1 — Menüdeki iki bağlantı boş sayfaya gidiyor
`blog.html` ve `booking.html` içindeki `<nav>`, `index.html` ve `location.html`'e
bağlantı veriyor. Her ikisi de **0 bayt**. Tarayıcı bomboş beyaz sayfa gösterir.
Alıştırmanın tamamlanmamış kısmı. → `YAPILACAKLAR.md` H2

### 🟡 B2 — Geçersiz HTML: çift `</head>` ve kaçak `<nav>`
Her iki dolu sayfada da (`blog.html` ~44-47, `booking.html` ~43-46):

```html
        <link rel="stylesheet" href="css/styles.css">
        </head><nav>

        </nav>
    </head>
```

`</head>` iki kez kapanıyor ve arada boş bir `<nav>` var. Tarayıcılar hata
düzeltmesiyle bunu yutuyor (sayfa görünüyor), ama HTML geçersiz ve W3C
doğrulayıcısı hata verir. → H1

### 🟢 B3 — `booking.html` navigasyonu eksik
`blog.html`'de menü 4 madde (Home/Location/Blog/Booking), `booking.html`'de
3 madde — "Booking" maddesi yok. Menüler senkron değil. → H3

### 🟢 B4 — `meta http-equiv="refresh" content="100000"`
Her iki sayfada da var. Sayfayı ~28 saatte bir yeniler; ders alıştırması olarak
konulmuş ama gerçek bir sitede istenmeyen davranıştır (erişilebilirlik açısından
da önerilmez). → H4

### 🟢 B5 — `<meta name="google">` içeriksiz
`content` niteliği yok; geçersiz. Muhtemelen `<meta name="google" content="nositelinkssearchbox">`
yazılmak istenmiş. → H4

### 🟢 B6 — `<img ... weight="64">` yazım hatası
`blog.html` içinde `height="64" weight="64"` — doğrusu `width`. `weight` diye bir
HTML niteliği yok, yok sayılıyor. → H4

### 🟢 B7 — Rezervasyon formunun `action`'ı yok
`booking.html` → `<form method="POST">` ama `action` yok; form kendi sayfasına
gönderir ve hiçbir şey olmaz. Backend olmadığı için bu beklenen durum, ama
alıştırma tamamlanacaksa bir hedef gerekir. → H5

### 🟢 B8 — Radyo düğmeleri aynı grupta değil
`blog.html`: `<input type="radio" name="light">` ve `<input type="radio" name="dark">`
farklı `name` değerleri taşıyor, bu yüzden **ikisi de aynı anda seçilebiliyor**.
Radyo davranışı `name` üzerinden gruplanır. → H4

---

## 5. Yarınki test için (Intel Mac)

```bash
git clone -b master https://github.com/yokbi/HTML-Exercise
cd HTML-Exercise
./run-mac-intel.sh
```

Betik `python3 -m http.server 8080` başlatır ve tarayıcıda `blog.html`'i açar.
macOS'ta sistem Python'u yeterlidir, kurulum gerekmez.

**Beklenen:** Blog sayfası açılır — logo, menü, iki makale, checkbox/radyo,
haber bölümleri. `Booking` bağlantısı rezervasyon formuna gider.
**Beklenen (hata değil):** `Home` ve `Location` bağlantıları beyaz sayfa açar (B1).

---

Yapılacak işler: [`YAPILACAKLAR.md`](YAPILACAKLAR.md)
