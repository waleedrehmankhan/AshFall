$projectRoot = Get-Location
 
Write-Host ""
Write-Host "Setting up Ashfall project at: $projectRoot" -ForegroundColor Cyan
Write-Host ""
 
$folders = @(
    "assets\audio\music",
    "assets\audio\sfx",
    "assets\fonts",
    "assets\textures\characters",
    "assets\textures\environment",
    "assets\textures\ui",
    "assets\models",
    "scenes\main",
    "scenes\levels",
    "scenes\player",
    "scenes\enemies",
    "scenes\ui",
    "scenes\shared",
    "scripts\autoload",
    "scripts\player",
    "scripts\enemies",
    "scripts\components",
    "scripts\ui",
    "shaders",
    "addons"
)
 
foreach ($folder in $folders) {
    $path = Join-Path $projectRoot $folder
    if (-not (Test-Path $path)) {
        New-Item -ItemType Directory -Path $path -Force | Out-Null
        # Add a .gitkeep so empty folders are tracked by git
        New-Item -ItemType File -Path "$path\.gitkeep" -Force | Out-Null
        Write-Host "  [+] $folder" -ForegroundColor Green
    } else {
        Write-Host "  [=] $folder (already exists)" -ForegroundColor Yellow
    }
}
 
Write-Host ""
Write-Host "Writing .gitignore..." -ForegroundColor Cyan
 
$gitignore = @"
# =======================
# Godot 4 — .gitignore
# =======================
 
# Godot editor cache & generated data (Godot 4)
.godot/
 
# Godot 3 import cache (safe to include for compatibility)
.import/
*.import
 
# Export presets (comment out if you want to share export settings)
# export_presets.cfg
 
# Build / export output
export/
builds/
*.apk
*.aab
*.ipa
*.exe
*.x86_64
*.arm64-v8a
*.pck
*.zip
 
# Mono / C# build artifacts
.mono/
data_*/
mono_crash.*.json
 
# macOS clutter
.DS_Store
.AppleDouble
__MACOSX/
 
# Windows clutter
Thumbs.db
ehthumbs.db
Desktop.ini
`$RECYCLE.BIN/
 
# Editor configs
*.swp
*.swo
.idea/
.vscode/
*.user
"@
 
Set-Content -Path (Join-Path $projectRoot ".gitignore") -Value $gitignore -Encoding UTF8
Write-Host "  [+] .gitignore written" -ForegroundColor Green
 
Write-Host ""
Write-Host "Writing .gitattributes..." -ForegroundColor Cyan
 
$gitattributes = @"
# ==========================
# Godot 4 — .gitattributes
# ==========================
 
# Normalize line endings for all text files to LF
* text=auto eol=lf
 
# Godot source files (text, mergeable)
*.gd         text eol=lf
*.gdshader    text eol=lf
*.tscn       text eol=lf merge=union
*.tres       text eol=lf merge=union
*.godot      text eol=lf
project.godot text eol=lf
*.import     text eol=lf
 
# Images
*.png        filter=lfs diff=lfs merge=lfs -text
*.jpg        filter=lfs diff=lfs merge=lfs -text
*.jpeg       filter=lfs diff=lfs merge=lfs -text
*.webp       filter=lfs diff=lfs merge=lfs -text
*.tga        filter=lfs diff=lfs merge=lfs -text
*.bmp        filter=lfs diff=lfs merge=lfs -text
*.exr        filter=lfs diff=lfs merge=lfs -text
*.hdr        filter=lfs diff=lfs merge=lfs -text
*.psd        filter=lfs diff=lfs merge=lfs -text
 
# Audio
*.wav        filter=lfs diff=lfs merge=lfs -text
*.mp3        filter=lfs diff=lfs merge=lfs -text
*.ogg        filter=lfs diff=lfs merge=lfs -text
*.flac       filter=lfs diff=lfs merge=lfs -text
 
# 3D Models
*.glb        filter=lfs diff=lfs merge=lfs -text
*.gltf       filter=lfs diff=lfs merge=lfs -text
*.fbx        filter=lfs diff=lfs merge=lfs -text
*.obj        filter=lfs diff=lfs merge=lfs -text
*.blend      filter=lfs diff=lfs merge=lfs -text
 
# Fonts
*.ttf        filter=lfs diff=lfs merge=lfs -text
*.otf        filter=lfs diff=lfs merge=lfs -text
 
# Video
*.mp4        filter=lfs diff=lfs merge=lfs -text
*.webm       filter=lfs diff=lfs merge=lfs -text
"@
 
Set-Content -Path (Join-Path $projectRoot ".gitattributes") -Value $gitattributes -Encoding UTF8
Write-Host "  [+] .gitattributes written" -ForegroundColor Green
 
Write-Host ""
Write-Host "Initialising git..." -ForegroundColor Cyan
 
git init
git lfs install
 
Write-Host ""
Write-Host "Making first commit..." -ForegroundColor Cyan
 
git add .
git commit -m "chore: initial project structure and git config"
 
git branch -M main
 
Write-Host ""
Write-Host "Done! One last step - paste your GitHub remote URL below." -ForegroundColor Cyan
Write-Host "Find it on GitHub under: Code > HTTPS" -ForegroundColor Gray
Write-Host ""
$remoteUrl = Read-Host "GitHub remote URL (or press Enter to skip)"
 
if ($remoteUrl -ne "") {
    git remote add origin $remoteUrl
    git push -u origin main
    Write-Host ""
    Write-Host "Pushed to GitHub successfully!" -ForegroundColor Green
} else {
    Write-Host ""
    Write-Host "Skipped. To add the remote later, run:" -ForegroundColor Yellow
    Write-Host "  git remote add origin YOUR_GITHUB_URL" -ForegroundColor White
    Write-Host "  git push -u origin main" -ForegroundColor White
}
 
Write-Host ""
Write-Host "All done! Your Ashfall repo is ready." -ForegroundColor Cyan
Write-Host ""