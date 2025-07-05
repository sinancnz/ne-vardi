# Ne Vardı? 📦🥑

Basit ve hızlı **buzdolabı / kiler stok takip** uygulaması.

## Özellikler
- Ürün ekle (isim • miktar • SKT)
- Listele & sil
- SKT yaklaşan ürünlerde ⚠️ uyarı
- Material 3 UI, Türkçe metinler

## Hızlı Başlangıç

```bash
flutter pub get
flutter run
```

## CI/CD

### GitHub Actions
- `.github/workflows/android-build.yml`: `flutter build apk --release`
- Build artefaktı **`ne_vardi-apk`** olarak yüklenir.

### Codemagic (alternatif)
1. Repo’yu Codemagic’e bağla.
2. “Flutter” template’ini seç, `flutter build apk --release` scripti ekle.
3. Keystore bilgilerini *Environment variables* kısmında tanımla.
4. **Start build** → APK hazır!

## Paket Boyutu
- Release: ~15 MB
- Debug: ~40 MB
