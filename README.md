# HTML-Exercise — "Little Lemon" (Meta Front-End Developer kursu alıştırmaları)

Coursera / Meta **Introduction to HTML and CSS** dersinin kurgusal restoran
projesi **Little Lemon** için yazılmış HTML + CSS alıştırma sayfaları.

> Bu bir **kurs alıştırması** deposudur — bitmiş bir web sitesi değildir.
> Sayfaların bir kısmı bilinçli olarak boş bırakılmıştır (bkz. aşağıdaki tablo).

---

## Ne var, ne yok

| Dosya | Durum | İçerik |
|---|---|---|
| `blog.html` | ✅ dolu (97 satır) | Metadata alıştırması, semantik yapı (`header`/`nav`/`main`/`article`/`section`/`footer`), form elemanları (checkbox, radio), iç içe `section` |
| `booking.html` | ✅ dolu (86 satır) | Rezervasyon formu: `date`, `range` + `output`, `datalist` ile otomatik tamamlama, `required` doğrulaması |
| `index.html` | ⛔ **BOŞ (0 bayt)** | Ana sayfa — yazılmamış |
| `location.html` | ⛔ **BOŞ (0 bayt)** | Konum sayfası — yazılmamış |
| `signup.html` | ⚠️ iskelet (8 satır) | Yalnızca boş `<html><head><body>` — içerik yok |
| `css/styles.css` | ✅ dolu (58 satır) | Tüm sayfaların ortak stili |
| `logo.png` | ✅ | Sayfalarda kullanılan logo |
| `metadataCheatSheet.txt` | ✅ | Kursun `<meta>` etiketi ders notu (kod değil, referans) |
| `.hintrc` | ✅ | VS Code webhint eklentisi ayarı |

`blog.html` ve `booking.html` içindeki `<nav>` menüsü `index.html` ve
`location.html`'e bağlantı verir — **bu iki dosya boş olduğu için menüye tıklamak
bomboş bir sayfa açar.** Bu bir hata değil, alıştırmanın yarım kalmış kısmıdır.
Ayrıntı: [`YAPILACAKLAR.md`](YAPILACAKLAR.md).

---

## Çalıştırma

Statik HTML'dir; **derleme yok, bağımlılık yok, sunucu bile şart değil.**

### En hızlısı — tarayıcıda aç

```bash
open blog.html          # macOS
```

### Yerel sunucu ile (önerilen)

Bazı tarayıcı davranışları (göreli yollar, `file://` kısıtları) yerel sunucuda
daha doğru çalışır:

```bash
./run-mac-intel.sh       # Intel Mac
./run-mac-apple-silicon.sh
run-windows.bat          # Windows
```

Betik `python3 -m http.server 8080` çalıştırır ve tarayıcıyı açar.
Elle yapmak isterseniz:

```bash
python3 -m http.server 8080
# sonra: http://localhost:8080/blog.html
```

Betik **boş olmayan** bir sayfayla (`blog.html`) açılır; `index.html` boş olduğu
için `http://localhost:8080/` adresi beyaz ekran gösterir.

---

## Öğrenilen/gösterilen konular

- `<meta>` etiketleri: SEO (`description`, `robots`), Open Graph sosyal kart
  (`og:title`, `og:image`, `og:description`), `viewport`, `http-equiv`
- Semantik HTML5: `header`, `nav`, `main`, `article`, `section`, `footer`
- Form girdileri: `date`, `range` + canlı `<output>`, `datalist`, `checkbox`,
  `radio`, `required`
- CSS: seçiciler, alt öğe seçici (`h2 > span`), `:focus:invalid` sözde sınıfı,
  görselleri `margin: auto` ile ortalama

---

## Bilinen sorunlar

`blog.html` ve `booking.html` içinde bir **çift `</head>` kapanışı** ve arada
boş bir `<nav>` var (satır ~44-47). Tarayıcılar bunu hoş görüyor ama HTML
geçersiz. Ayrıntı ve düzeltme: [`YAPILACAKLAR.md`](YAPILACAKLAR.md) → H1.

Tam liste: [`YAPILACAKLAR.md`](YAPILACAKLAR.md) · Durum: [`DURUM-RAPORU.md`](DURUM-RAPORU.md)
