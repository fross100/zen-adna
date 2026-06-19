#!/bin/bash
# Adna Theme Editor - Quick access tools
# Usage: ./edit-theme.sh [command]

THEME_DIR="/home/fross/Projects/Zen Theme"
ZEN_CHROME="/home/fross/.zen/0cn651kv.Default Profile/chrome"

case "${1:-help}" in
    "sync")
        echo "Syncing theme to Zen profile..."
        cp "$THEME_DIR/userChrome.css" "$ZEN_CHROME/userChrome.css"
        echo "✓ Done! Restart Zen Browser to apply changes."
        ;;
    "watch")
        echo "Watching for changes... (Press Ctrl+C to stop)"
        while true; do
            inotifywait -q -e modify "$THEME_DIR/userChrome.css" 2>/dev/null
            if [ $? -eq 0 ]; then
                cp "$THEME_DIR/userChrome.css" "$ZEN_CHROME/userChrome.css"
                echo "[$(date)] ✓ Theme synced"
            fi
            sleep 1
        done
        ;;
    "edit")
        ${EDITOR:-nano} "$THEME_DIR/userChrome.css"
        ;;
    "preview")
        echo "Current theme content:"
        echo "========================"
        cat "$THEME_DIR/userChrome.css"
        echo "========================"
        ;;
    "remote")
        echo "Starting Zen with remote debugging..."
        pkill -f "zen-bin" 2>/dev/null
        sleep 2
        /opt/zen-browser-bin/zen-bin --remote-debugging-port=9222 &
        echo "✓ Zen started with debugging on port 9222"
        echo "Run: python3 zen-css-editor.py ws://127.0.0.1:9222"
        ;;
    "help"|*)
        echo "╔══════════════════════════════════════════════════════════╗"
        echo "║           Adna Theme Editor                            ║"
        echo "╚══════════════════════════════════════════════════════════╝"
        echo ""
        echo "Usage: $0 [command]"
        echo ""
        echo "Commands:"
        echo "  sync    - Copy theme to Zen profile"
        echo "  watch   - Auto-sync on file changes"
        echo "  edit    - Open theme in editor"
        echo "  preview - Show current theme"
        echo "  remote  - Start Zen with debugging"
        echo "  help    - Show this help"
        echo ""
        echo "Examples:"
        echo "  $0 sync      # Apply theme changes"
        echo "  $0 edit      # Edit theme file"
        echo "  $0 watch     # Auto-sync while editing"
        echo "  $0 remote    # Enable remote debugging"
        echo ""
        echo "Live Editing (Recommended):"
        echo "  1. Open Zen Browser"
        echo "  2. Press Ctrl+Shift+Alt+I"
        echo "  3. Go to Style Editor tab"
        echo "  4. Edit userChrome.css directly"
        echo "  5. Press Ctrl+S to save"
        ;;
esac
