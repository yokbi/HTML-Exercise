# Yapılacaklar — HTML-Exercise

Denetimde dosyalar okunarak çıkarıldı. Öncelik: 🔴 kritik · 🟡 orta · 🟢 düşük

Bu bir kurs alıştırması olduğu için "kritik" madde yoktur; en yüksek öncelik
alıştırmanın **yarım kalmış** kısmıdır.

---

## H1 🟡 Geçersiz HTML — çift `</head>` ve kaçak `<nav>`

**Nerede:** `blog.html` satır ~44-47, `booking.html` satır ~43-46

**Mevcut hâli:**
```html
        <link rel="stylesheet" href="css/styles.css">
        </head><nav>

        </nav>
    </head>
```

**Olması gereken:**
```html
        <link rel="stylesheet" href="css/styles.css">
    </head>
```

`</head>` bir kez kapanmalı; boş `<nav>` blogu tamamen silinmeli (gerçek `<nav>`
zaten `<body>` içinde duruyor). İki dosyada da aynı düzeltme.

**Doğrulama:** https://validator.w3.org/nu/ adresine dosyayı yükleyin veya
`npx html-validate blog.html booking.html` çalıştırın.

---

## H2 🟡 `index.html` ve `location.html` boş (0 bayt)

**Nerede:** Depo kökü. Her iki dosya da sıfır bayt.

**Neden sorun:** Menüdeki `Home` ve `Location` bağlantıları bomboş sayfaya gider.
Depoyu ilk açan kişi sitenin bozuk olduğunu sanır.

**Yapılacak — `index.html` (ana sayfa):**
`blog.html`'i şablon olarak kopyalayın, `<main>` içeriğini değiştirin:
- `<h1>Little Lemon</h1>` ve restoranın kısa tanıtımı
- Öne çıkan yemekler için 2-3 `<article>`
- Rezervasyon sayfasına yönlendiren bir bağlantı

**Yapılacak — `location.html` (konum):**
- Adres, çalışma saatleri (`<address>` ve `<table>` etiketleriyle)
- Harita için `<iframe>` veya statik görsel
- Telefon: `<a href="tel:+90...">`

**Yapılacak — `signup.html` (iskelet, 8 satır):**
Menüde bağlantısı yok, ama dosya duruyor. Ya kayıt formu yazılsın
(`email`, `password`, `required`, `pattern`) ve menüye eklensin, ya da dosya silinsin.

---

## H3 🟢 Navigasyon menüleri senkron değil

**Nerede:** `blog.html` (4 madde) vs `booking.html` (3 madde)

`booking.html` menüsünde "Booking" maddesi eksik. Statik HTML'de menü her sayfada
tekrar yazıldığı için bu tür kaymalar kaçınılmaz.

**Yapılacak:** Her iki dosyada aynı 4 (H2 sonrası 5) maddeli menü olsun. Aynı
menüyü bir daha yazmak zorunda kalmamak için ileride `include` mekanizmalı bir
statik site üreticisine (Eleventy, Astro) geçilebilir — ama bu kurs kapsamının
dışında, alıştırma için elle senkron tutmak yeterli.

---

## H4 🟢 Küçük HTML hataları (hepsi tek satırlık düzeltme)

| # | Nerede | Sorun | Düzeltme |
|---|---|---|---|
| a | `blog.html`, `booking.html` | `<meta name="google">` — `content` yok, geçersiz | Etiketi silin veya `content="nositelinkssearchbox"` ekleyin |
| b | `blog.html`, `booking.html` | `<meta http-equiv="refresh" content="100000">` sayfayı ~28 saatte bir yeniler | Silin (erişilebilirlik açısından da önerilmez) |
| c | `blog.html`, `booking.html` | `<meta http-equiv="default-style">` — `content` yok | Silin |
| d | `blog.html` | `<img ... height="64" weight="64">` — `weight` diye nitelik yok | `width="64"` yapın |
| e | `blog.html` | Radyolar `name="light"` / `name="dark"` — ayrı grup, **ikisi birden seçilebiliyor** | İkisine de `name="theme"` verin, `value` farklı kalsın |
| f | `booking.html` | `<html>` etiketinde `lang` yok (`blog.html`'de var) | `<html lang="en-US">` |
| g | `blog.html` | `<meta name="revised" content="Friday, March 18th, 2023...">` tarih eski | Güncelleyin veya silin |

---

## H5 🟢 Rezervasyon formunun hedefi yok

**Nerede:** `booking.html` → `<form method="POST">`

`action` niteliği olmadığı için form kendi sayfasına POST eder ve görünürde
hiçbir şey olmaz. Backend olmadığından bu beklenen durum.

**Yapılacak (seçenekli):**
- **A:** Alıştırma olarak bırakılacaksa `action="#"` ve bir açıklama yorumu ekleyin.
- **B:** Formspree / Netlify Forms gibi ücretsiz bir servise `action` verin.
- **C:** Küçük bir JavaScript ile `submit` olayını yakalayıp "Rezervasyonunuz
  alındı" mesajı gösterin (kursun JS modülüne uygun alıştırma).

---

## H6 🟢 CSS'te kullanılmayan kurallar

`css/styles.css` içinde tanımlı ama hiçbir HTML dosyasında kullanılmayanlar:

- `.center-text` — hiçbir elemanda yok
- `#copyright` — `id="copyright"` hiçbir yerde yok (footer'daki `<p>` düz `<p>`)
- `h2 > span` — hiçbir `h2` içinde `span` yok

**Yapılacak:** Ya HTML'de kullanın (`<p id="copyright">`, fiyat için
`<h2>Menü <span>20₺</span></h2>`), ya da CSS'ten kaldırın.

---

## H7 🟢 `logo.png` için `alt` metni yetersiz

`alt="Logo"` ekran okuyucuya bilgi vermiyor. `alt="Little Lemon restoran logosu"`
daha doğru. `blog.html`'deki buton içindeki görsel de `alt="Submit"` — buton bir
`alert` açıyor, "Submit" yanıltıcı.

---

## H8 🟢 `metadataCheatSheet.txt` kod değil, ders notu

Depo kökünde duruyor ve ilk bakışta projeye ait bir yapılandırma dosyası gibi
görünüyor. `docs/` altına taşınabilir veya `.md` uzantısıyla okunur hâle getirilebilir.

---

## Öncelik sırası önerisi

1. **H1** — geçersiz HTML (2 dosyada 4 satır silme, 5 dakika)
2. **H4** — küçük etiket hataları (aynı turda halledilir)
3. **H2** — `index.html` + `location.html` yazımı (asıl yarım kalan iş)
4. **H3** — menüleri senkronla (H2'den sonra, tek seferde)
5. **H5, H6, H7, H8** — cila
