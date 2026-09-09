# fastfetch-ricing

🇫🇷 [Lire en français](./README_FRENCH.md)

![Preview](./Preview.png)

A [Fastfetch](https://github.com/fastfetch-cli/fastfetch) config for Windows 11 / PowerShell, featuring:

- A custom logo rendered in Sixel (bring your own image — not included, see below)
- Four grouped sections: **Hardware**, **Software**, **Session**, **Uptime / Date**
- A consistent color palette (green/yellow/blue/purple) on a dark background
- Progress bars for RAM, Swap, and disks

## Requirements

| Tool | Purpose | Install |
|---|---|---|
| [Fastfetch](https://github.com/fastfetch-cli/fastfetch) | Generates the system info display | `winget install fastfetch` or `scoop install fastfetch` |
| Sixel-capable terminal | Renders the logo as an image (Windows Terminal ≥ 1.22, WezTerm, mintty…) | [Windows Terminal](https://github.com/microsoft/terminal) |
| [ImageMagick](https://imagemagick.org/) | Converts your image to `.six` | `winget install ImageMagick.ImageMagick` |
| PowerShell 7+ | To load the profile snippet | `winget install Microsoft.PowerShell` |

> The `packages` module lists Chocolatey/Scoop, and the `wm` module may show empty on Windows — that's expected, Fastfetch hides fields that don't apply.

## Installation

1. **Clone the repo** (or just copy `config.jsonc`) into a stable folder, e.g.:
   ```powershell
   git clone https://github.com/<your-user>/fastfetch-ricing.git C:\Scripts\fastfetch-configs\fastfetch-ricing
   ```

2. **Generate your own Sixel logo** from an image of your choice (PNG/JPG, transparent background recommended):
   ```powershell
   magick convert "your-image.png" -resize 200x -background none sixel:"C:\Scripts\fastfetch-configs\fastfetch-ricing\manga.six"
   ```
   - Adjust `-resize 200x` to your desired width (200 px pairs well with `width: 40` in the config).
   - If your ImageMagick build lacks the `sixel` delegate, use [libsixel](https://github.com/saitoha/libsixel) instead:
     ```powershell
     img2sixel -w 200 "your-image.png" > "C:\Scripts\fastfetch-configs\fastfetch-ricing\manga.six"
     ```
   - `manga.six` must stay **at the root** of the folder (referenced via `%FASTFETCH_EAGLE_ROOT%/manga.six` in `config.jsonc`).

3. **Add the snippet to your PowerShell profile**:
   ```powershell
   notepad $PROFILE
   ```
   Paste the contents of [`profile-snippet.ps1`](./profile-snippet.ps1), then edit this line:
   ```powershell
   $eagleFastfetchRoot = 'C:\Scripts\fastfetch-configs\fastfetch-ricing'
   ```
   to point to your actual folder.

4. **Reload your profile**:
   ```powershell
   . $PROFILE
   ```

## Customization

- **Colors**: edit the hex codes in `display.color` and in each `custom`/`keyColor` block of `config.jsonc`.
- **Sections**: each `Hardware` / `Software` / `Session` / `Uptime / Date` block is a set of modules framed by two `"type": "custom"` entries (borders `┌─...─┐` / `└─...─┘`). Add or remove modules between them to build your own sections.
- **Logo size**: adjust `logo.width` / `logo.height` in `config.jsonc` to match your `.six` resolution.

## About the logo

The `manga.six` file is **intentionally not included** in this repo: it's a derivative image whose rights don't belong to me. Follow the instructions above with an image of your own choosing (royalty-free artwork, a personal photo, a logo, etc.).

## License

MIT — see [LICENSE](./LICENSE). Only covers the files in this repo (`config.jsonc`, `profile-snippet.ps1`), not third-party software (Fastfetch, ImageMagick) or any image you integrate yourself.
