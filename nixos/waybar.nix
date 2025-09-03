{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [ 
    waybar
    pavucontrol
  ];

  # Создаем конфиг файл для Waybar
  environment.etc."xdg/waybar/config".text = ''
    {
      "height": 30,
      "spacing": 10,
      "output": "DP-1",
      "modules-left": [
        "hyprland/workspaces"
      ],
      "modules-center": [
        "clock"
      ],
      "modules-right": [
        "hyprland/language",
        "pulseaudio",
        "group/hardware",
        "network",
        "keyboard-state"
      ],
      "hyprland/workspaces": {
        "on-click": "activate",
        "sort-by-number": true,
        "persistent-workspaces": {
          "1": "1",
          "2": "2",
          "3": "3",
          "4": "4",
          "5": "5",
          "6": "6"
        }
      },
      "hyprland/language": {
        "format": " {}",
        "format-en": "EN",
        "format-ru": "RU"
      },
      "group/hardware": {
        "orientation": "horizontal",
        "modules": ["cpu", "memory"]
      },
      "clock": {
        "format": "{:L%a %d, %b %Y  %H:%M }"
      },
      "cpu": {
        "format": "{usage}% ",
        "tooltip": false
      },
      "memory": {
        "format": "{}% "
      },
      "network": {
        "format-ethernet": "",
        "format-disconnected": "⚠"
      },
      "pulseaudio": {
        "format": "{volume}% {icon} {format_source}",
        "format-bluetooth": "{volume}% {icon} {format_source}",
        "format-bluetooth-muted": " {icon} {format_source}",
        "format-muted": " {format_source}",
        "format-source": "{volume}% ",
        "format-source-muted": "",
        "format-icons": {
          "headphone": "",
          "hands-free": "",
          "headset": "",
          "phone": "",
          "portable": "",
          "car": "",
          "default": ["", "", ""]
        },
        "on-click": "pavucontrol"
      }
    }
  '';

  # Создаем файл стилей
  environment.etc."xdg/waybar/style.css".text = ''
    * {
      border: none;
      border-radius: 0;
      font-family: "FontAwesome", "DejaVu Sans", sans-serif;
      font-size: 12px;
      min-height: 0;
    }
    
    window#waybar {
      background: rgba(0, 0, 0, 0.8);
      color: #ffffff;
    }
    
    #workspaces button {
      padding: 0 5px;
      background: transparent;
      color: #ffffff;
      border-bottom: 3px solid transparent;
    }
    
    #workspaces button.focused {
      border-bottom: 3px solid #ffffff;
    }
    
    #workspaces button.urgent {
      background-color: #eb4d4b;
    }
  '';
}
