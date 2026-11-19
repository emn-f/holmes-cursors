# HOLMES_ Cursors

Custom **15-cursor pack** inspired by the *Spider-Verse + Editorial Brutalist* visual identity of [EMANUEL FERREIRA aka HOLMES_](https://emn-f.github.io/holmes/en/).

Available in two variants:
- **`dark`** — cyan (`#00e5ff`) + red (`#ff0033`) chromatic glitch
- **`light`** — editorial cobalt (`#1d4ed8`) + emerald (`#6ee7b7`) + red (`#e62429`)

---

## Preview (15 cursors)

| Cursor | Role | Dark | Light | Hotspot (`32×32`) |
| :--- | :--- | :---: | :---: | :--- |
| `arrow` | Normal select | ![dark arrow](./dark/arrow.svg) | ![light arrow](./light/arrow.svg) | `(2, 2)` |
| `pointer` | Link select / hover (crosshair) | ![dark pointer](./dark/pointer.svg) | ![light pointer](./light/pointer.svg) | `(12, 12)` |
| `help` | Help select | ![dark help](./dark/help.svg) | ![light help](./light/help.svg) | `(2, 2)` |
| `work` | Working in background | ![dark work](./dark/work.svg) | ![light work](./light/work.svg) | `(2, 2)` |
| `busy` | Busy | ![dark busy](./dark/busy.svg) | ![light busy](./light/busy.svg) | `(16, 16)` |
| `cross` | Precision select | ![dark cross](./dark/cross.svg) | ![light cross](./light/cross.svg) | `(16, 16)` |
| `text` | Text select (`I-Beam`) | ![dark text](./dark/text.svg) | ![light text](./light/text.svg) | `(16, 16)` |
| `hand` | Handwriting / drawing | ![dark hand](./dark/hand.svg) | ![light hand](./light/hand.svg) | `(4, 28)` |
| `unavail` | Unavailable | ![dark unavail](./dark/unavail.svg) | ![light unavail](./light/unavail.svg) | `(16, 16)` |
| `vert` | Vertical resize | ![dark vert](./dark/vert.svg) | ![light vert](./light/vert.svg) | `(16, 16)` |
| `horz` | Horizontal resize | ![dark horz](./dark/horz.svg) | ![light horz](./light/horz.svg) | `(16, 16)` |
| `dgn1` | Diagonal resize (`↖↘`) | ![dark dgn1](./dark/dgn1.svg) | ![light dgn1](./light/dgn1.svg) | `(16, 16)` |
| `dgn2` | Diagonal resize (`↗↙`) | ![dark dgn2](./dark/dgn2.svg) | ![light dgn2](./light/dgn2.svg) | `(16, 16)` |
| `move` | Move | ![dark move](./dark/move.svg) | ![light move](./light/move.svg) | `(16, 16)` |
| `alternate` | Alternate select | ![dark alternate](./dark/alternate.svg) | ![light alternate](./light/alternate.svg) | `(16, 4)` |

---

## `arrow` Alternatives (`alternatives/`)

13 additional `arrow` shapes (`dark/` and `light/`, hotspot `(2, 2)`) — sharp, brutalist, geometric, round, and square variants:

| Variant | Dark | Light | Style |
| :--- | :---: | :---: | :--- |
| `02-razor-shard` | ![dark 02](./alternatives/dark/02-razor-shard.svg) | ![light 02](./alternatives/light/02-razor-shard.svg) | Sharp asymmetric blade |
| `03-brutalist-block` | ![dark 03](./alternatives/dark/03-brutalist-block.svg) | ![light 03](./alternatives/light/03-brutalist-block.svg) | 90° orthogonal block |
| `04-origami-kite` | ![dark 04](./alternatives/dark/04-origami-kite.svg) | ![light 04](./alternatives/light/04-origami-kite.svg) | Directional diamond |
| `05-tri-prism` | ![dark 05](./alternatives/dark/05-tri-prism.svg) | ![light 05](./alternatives/light/05-tri-prism.svg) | Scalene triangle |
| `06-hex-dart` | ![dark 06](./alternatives/dark/06-hex-dart.svg) | ![light 06](./alternatives/light/06-hex-dart.svg) | Faceted hex dart |
| `07-target-chevron` | ![dark 07](./alternatives/dark/07-target-chevron.svg) | ![light 07](./alternatives/light/07-target-chevron.svg) | Chevron + reticle |
| `08-stepped-monolith` | ![dark 08](./alternatives/dark/08-stepped-monolith.svg) | ![light 08](./alternatives/light/08-stepped-monolith.svg) | Glitch-sliced steps |
| `09-orb-teardrop` | ![dark 09](./alternatives/dark/09-orb-teardrop.svg) | ![light 09](./alternatives/light/09-orb-teardrop.svg) | Round teardrop pin |
| `10-halo-circle` | ![dark 10](./alternatives/dark/10-halo-circle.svg) | ![light 10](./alternatives/light/10-halo-circle.svg) | Pure circle + precision dot |
| `11-soft-arrow` | ![dark 11](./alternatives/dark/11-soft-arrow.svg) | ![light 11](./alternatives/light/11-soft-arrow.svg) | Soft-edged arrow |
| `12-directional-squircle` | ![dark 12](./alternatives/dark/12-directional-squircle.svg) | ![light 12](./alternatives/light/12-directional-squircle.svg) | Rounded square + sharp tip |
| `13-brutalist-cube` | ![dark 13](./alternatives/dark/13-brutalist-cube.svg) | ![light 13](./alternatives/light/13-brutalist-cube.svg) | Sharp 90° cube |
| `14-soft-box` | ![dark 14](./alternatives/dark/14-soft-box.svg) | ![light 14](./alternatives/light/14-soft-box.svg) | Rounded square + circle core |

---

## Installation

### Windows 10 / 11

1. Download [`holmes-cursors-windows.zip`](https://github.com/emn-f/holmes-cursors/releases/latest/download/holmes-cursors-windows.zip) from the **Releases** page (or directly from this repository).
2. Extract the ZIP archive and open the `dark/` or `light/` folder.
3. Right-click **`install.inf`** → **Install** *(on Windows 11: **Show more options** → **Install**)*.
4. Press `Win + R`, run `main.cpl`, open the **Pointers** tab, and select **Holmes Dark** or **Holmes Light** → **OK**.

**PowerShell shortcut** (inside the extracted folder):

```powershell
rundll32.exe setupapi.dll,InstallHinfSection DefaultInstall 132 "$PWD\dark\install.inf"
control main.cpl,,1
```

---

### Linux (GNOME / KDE / Hyprland)

The [`scripts/install-linux.sh`](./scripts/install-linux.sh) script converts all SVGs into **XCursor** themes (`24px`, `32px`, `48px`) with exact hotspots and installs them to `~/.icons/Holmes-Dark` and `~/.icons/Holmes-Light`.

1. Install `ImageMagick` and `xcursorgen`:
   ```bash
   # Fedora
   sudo dnf install ImageMagick xcursorgen

   # Ubuntu / Debian
   sudo apt install imagemagick x11-apps
   ```
2. Clone and run the installer:
   ```bash
   git clone https://github.com/emn-f/holmes-cursors.git
   cd holmes-cursors
   chmod +x scripts/install-linux.sh
   ./scripts/install-linux.sh all
   ```
3. Enable the theme:
   ```bash
   # GNOME
   gsettings set org.gnome.desktop.interface cursor-theme 'Holmes-Dark'
   gsettings set org.gnome.desktop.interface cursor-size 32
   ```
   - **KDE Plasma:** *System Settings → Appearance → Cursors* → select **Holmes-Dark** or **Holmes-Light**.
   - **Hyprland:** add to `~/.config/hypr/hyprland.conf`:
     ```ini
     env = XCURSOR_THEME,Holmes-Dark
     env = XCURSOR_SIZE,32
     ```

---

### macOS

macOS does not natively support system-wide `.cur` or `XCursor` themes. To use these cursors on a Mac:

1. Convert the SVGs from [`dark/`](./dark) or [`light/`](./light) to high-resolution PNGs:
   ```bash
   brew install imagemagick
   magick -background none -density 384 dark/arrow.svg -resize 64x64 arrow@2x.png
   ```
2. Import the PNGs using [**Mousecape**](https://github.com/alexzielenski/Mousecape), matching the hotspots in the table above (multiplied by `2` for Retina `@2x`).

---

## License

MIT — [Emanuel Ferreira (`emn-f`)](https://github.com/emn-f).
