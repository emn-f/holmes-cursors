#!/usr/bin/env bash
set -euo pipefail

# Build and install Holmes-Dark and/or Holmes-Light XCursor themes on Linux.
# Dependencies: ImageMagick (magick) and xcursorgen.

VARIANT="${1:-all}" # dark | light | all
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TMP_DIR="$(mktemp -d)"
trap 'rm -rf "$TMP_DIR"' EXIT

for cmd in magick xcursorgen; do
  if ! command -v "$cmd" >/dev/null 2>&1; then
    echo "Erro: '$cmd' não encontrado. Instale ImageMagick e xcursorgen primeiro." >&2
    echo "  Fedora: sudo dnf install ImageMagick xcursorgen" >&2
    echo "  Ubuntu/Debian: sudo apt install imagemagick x11-apps" >&2
    exit 1
  fi
done

declare -A HOTSPOTS=(
  [arrow]="2 2"
  [pointer]="12 12"
  [help]="2 2"
  [work]="2 2"
  [busy]="16 16"
  [cross]="16 16"
  [text]="16 16"
  [hand]="4 28"
  [unavail]="16 16"
  [vert]="16 16"
  [horz]="16 16"
  [dgn1]="16 16"
  [dgn2]="16 16"
  [move]="16 16"
  [alternate]="16 4"
)

declare -A X11_ALIASES=(
  [arrow]="left_ptr default arrow top_left_arrow"
  [pointer]="hand2 pointer hand1"
  [help]="help question_arrow whats_this"
  [work]="left_ptr_watch progress half-busy"
  [busy]="watch wait"
  [cross]="crosshair cross tcross"
  [text]="xterm text ibeam"
  [hand]="pencil"
  [unavail]="not-allowed crossed_circle no-drop"
  [vert]="ns-resize sb_v_double_arrow v_double_arrow n-resize s-resize"
  [horz]="ew-resize sb_h_double_arrow h_double_arrow e-resize w-resize"
  [dgn1]="nwse-resize bd_double_arrow nw-resize se-resize"
  [dgn2]="nesw-resize fd_double_arrow ne-resize sw-resize"
  [move]="move fleur all-scroll"
  [alternate]="up_arrow center_ptr"
)

build_variant() {
  local variant="$1"
  local theme_name="Holmes-${variant^}"
  local out_dir="$HOME/.icons/$theme_name"
  local cursors_dir="$out_dir/cursors"
  mkdir -p "$cursors_dir"

  cat > "$out_dir/index.theme" <<EOF
[Icon Theme]
Name=$theme_name
Comment=Spider-Verse + Editorial Brutalist cursor theme (HOLMES_)
EOF

  for name in "${!HOTSPOTS[@]}"; do
    local svg="$ROOT_DIR/$variant/${name}.svg"
    local hx hy
    read -r hx hy <<< "${HOTSPOTS[$name]}"
    local cfg="$TMP_DIR/${variant}_${name}.cfg"
    : > "$cfg"

    for size in 24 32 48; do
      local sx=$(( hx * size / 32 ))
      local sy=$(( hy * size / 32 ))
      local png="$TMP_DIR/${variant}_${name}_${size}.png"
      magick -background none -density 384 "$svg" -resize "${size}x${size}" "$png"
      echo "$size $sx $sy $png" >> "$cfg"
    done

    local primary="${X11_ALIASES[$name]%% *}"
    xcursorgen "$cfg" "$cursors_dir/$primary"

    for alias in ${X11_ALIASES[$name]}; do
      if [[ "$alias" != "$primary" ]]; then
        ln -sf "$primary" "$cursors_dir/$alias"
      fi
    done
  done

  echo "Instalado: $out_dir"
}

case "$VARIANT" in
  dark|light)
    build_variant "$VARIANT"
    ;;
  all)
    build_variant dark
    build_variant light
    ;;
  *)
    echo "Uso: $0 [dark|light|all]" >&2
    exit 1
    ;;
esac

echo "Para ativar no GNOME: gsettings set org.gnome.desktop.interface cursor-theme 'Holmes-Dark'"
