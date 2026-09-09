# Eagle Fastfetch startup
# Ajoutez ce bloc à votre profil PowerShell ($PROFILE).
# Adaptez $eagleFastfetchRoot au dossier où vous avez placé config.jsonc + manga.six
$eagleFastfetchRoot = 'C:\Path\To\fastfetch-eagle'
$eagleFastfetchConfig = Join-Path $eagleFastfetchRoot 'config.jsonc'

if ((Get-Command fastfetch -ErrorAction SilentlyContinue) -and
    (Test-Path -LiteralPath $eagleFastfetchConfig)) {
    $env:FASTFETCH_EAGLE_ROOT = $eagleFastfetchRoot
    fastfetch --config $eagleFastfetchConfig
}
