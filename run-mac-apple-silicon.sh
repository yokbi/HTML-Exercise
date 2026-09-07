#!/usr/bin/env bash
#
# run-mac-apple-silicon.sh — Little Lemon alıştırma sayfalarını yerel bir sunucuda açar.
# Apple Silicon Mac (arm64) için yazıldı; Intel Mac ve Linux'ta da aynen çalışır.
#
# Kullanım:  ./run-mac-apple-silicon.sh          (varsayılan port 8080)
#            ./run-mac-apple-silicon.sh 9000     (başka port)
#
# Not: index.html ve location.html BOŞ dosyalardır (0 bayt) — bu yüzden betik
# doğrudan blog.html'i açar. Ayrıntı: DURUM-RAPORU.md §4 (B1)

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

PORT="${1:-8080}"
START_PAGE="blog.html"

if ! command -v python3 >/dev/null 2>&1; then
  echo "HATA: python3 bulunamadı." >&2
  echo "  macOS: xcode-select --install   (veya: brew install python@3.11)" >&2
  echo
  echo "Alternatif: sunucu olmadan da açabilirsiniz ->  open $START_PAGE" >&2
  exit 1
fi

if command -v lsof >/dev/null 2>&1 && lsof -i ":$PORT" >/dev/null 2>&1; then
  echo "UYARI: $PORT portu kullanımda. Başka bir port deneyin: ./run-mac-apple-silicon.sh 9000" >&2
  exit 1
fi

URL="http://localhost:${PORT}/${START_PAGE}"

echo "==> Sunucu başlatılıyor: $URL"
echo "    (Durdurmak için Ctrl+C)"
echo
echo "    Sayfalar:"
echo "      blog.html      -> dolu, alıştırmanın ana çıktısı"
echo "      booking.html   -> dolu, rezervasyon formu"
echo "      index.html     -> BOŞ (0 bayt), beyaz sayfa açar"
echo "      location.html  -> BOŞ (0 bayt), beyaz sayfa açar"
echo

python3 -m http.server "$PORT" >/dev/null 2>&1 &
SERVER_PID=$!
trap 'kill "$SERVER_PID" 2>/dev/null || true' EXIT INT TERM

sleep 1
if ! kill -0 "$SERVER_PID" 2>/dev/null; then
  echo "HATA: sunucu başlatılamadı." >&2
  exit 1
fi

if command -v open >/dev/null 2>&1; then
  open "$URL"
else
  echo "Tarayıcıda açın: $URL"
fi

wait "$SERVER_PID"
