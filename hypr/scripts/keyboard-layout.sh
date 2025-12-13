# ~/.config/hypr/scripts/keyboard-layout.sh
#!/bin/bash

declare -A icons=(
    ["us"]="English"
    ["ru"]="Russia"
    ["de"]="German"
    ["jp"]="Japanese"
)

# Function to get current layout
get_layout() {
    # Get active keyboard layout from hyprctl
    hyprctl devices -j | jq -r '.keyboards[] | select(.name | contains("at-translated-set-2")) | .active_keymap' | head -1
}

# Function to get all layouts for current keyboard
get_all_layouts() {
    hyprctl devices -j | jq -r '.keyboards[] | select(.name | contains("at-translated-set-2")) | .keymaps[]' | tr '\n' ' '
}

# Get current layout
current_layout=$(get_layout)

# Display with icon if available, otherwise just layout code
if [[ -n "${icons[$current_layout]}" ]]; then
    echo "${icons[$current_layout]} $current_layout"
else
    echo "$current_layout"
fi
