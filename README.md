# Adna Theme for Zen Browser

A custom Zen Browser theme with Omarchy theme integration.

## Features

- **Omarchy Integration**: Reads `--base00` (background) and `--base0D` (accent) from Omarchy theme colors
- **Pinned Extensions**: Extensions appear above essentials in the sidebar
- **Essentials Grid**: 3 items per row with hover effects and emboss shadows
- **Tab Emboss Effects**: Subtle inner/outer shadow emboss on all tab types
- **Hover Gradient**: Animated gradient on tab hover
- **Click Depth**: Tabs press inward on click with deeper emboss
- **Folder Gradient**: Subtle gradient effect on tab groups
- **Adaptive Theming**: Uses CSS `light-dark()` for automatic light/dark mode
- **Sora Font**: Clean, modern typography
- **Glass Effect**: Frosted glass sidebar with backdrop blur

## Installation

### Via Sine (Recommended)

1. Open Zen Browser settings and navigate to the **Sine** tab
2. Search for **Adna** in the marketplace
3. Click install

### Manual

1. Copy the contents of `userChrome.css` into your profile's `chrome/userChrome.css` file
2. Restart Zen Browser

To find your profile folder: go to `about:profiles` in the address bar and open the **Root Directory** of your active profile.

## File Structure

```
userChrome.css                  — Entry point
adna/
  style.css                     — Core CSS variables (--adna-base, --adna-accent, shadows)
  chrome.css                    — Module imports
  modules/
    tab-styles.css              — Shared tab base, hover gradient, close/reset buttons
    tab-essentials.css          — Essentials layout + tab backgrounds/hover/selected/active
    tab-pinned.css              — Pinned tab backgrounds/hover/selected/active
    tab-regular.css             — Regular tab backgrounds/hover/selected
    toolbar.css                 — Toolbar layout, glass effect, compact mode
    urlbar.css                  — URL bar styling, floating URL bar
    tab-folders.css             — Tab group/folder styling
    workspace-buttons.css       — Workspace selector
    player.css                  — Media player controls
    extensions.css              — Extension panel styling
    animation.css               — Keyframe animations
```

## Color Variables

| Variable | Source | Description |
|---|---|---|
| `--adna-base` | `--base00` (Omarchy background) | Base color for surfaces |
| `--adna-accent` | `--base0D` (Omarchy accent) | Accent for highlights, gradients |
| `--adna-bg` | 60% of base + transparent | Semi-transparent surface |
| `--adna-tab-selected` | 15% of accent + transparent | Selected tab background |
| `--adna-shadow-dark` | 20% of foreground | Outer dark emboss shadow |
| `--adna-shadow-light` | 12% of foreground | Outer light emboss highlight |

## Development

This theme is ready for customization. Edit the CSS files in `adna/modules/` to adjust specific components.

## License

Feel free to fork and adapt for personal use.
