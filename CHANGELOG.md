## [0.2.0] - 2025-07-08

### Added
- 🏳️ Multi-locale support for the following locales:
  - Bengali (bn-IN)
  - Estonian (ee-EE)
  - English (en-AE, en-BD, en-GB, en-GH, en-IE, en-IN, en-MM, en-MU, en-NG, en-NP, en-PH)
  - Spanish (es-AR, es-ES, es-MX, es-VE)
  - Persian (fa-IR)
  - French (fr-BE, fr-FR)
  - Gujarati (gu-IN)
  - Hindi (hi-IN)
  - Kannada (kn-IN)
  - Hangul / Korean (ko-KR)
  - Latvian (lv-LV)
  - Marathi (mr-IN)
  - Dutch (nl-SR)
  - Nepali (np-NP)
  - Portuguese (pt-BR)
  - Turkish (tr-TR)
  - Urdu (ur-PK)

### Changed
- 📚 Updated README to document all supported locales and Dart usage examples


### Fixed
- Ensured decimal numbers starting with zero (e.g., `0.04`) are correctly converted to "Zero Point Zero Four".
- Made internal handling of the number zero more robust to prevent empty outputs.
