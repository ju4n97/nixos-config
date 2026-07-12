# nixos-config

Declarative system configuration tree based on Nix Flakes.

## Architecture

- `modules/system/`: OS-level primitives. Requires root permissions.
- `modules/user/`: Environment primitives managed via Home Manager.
- `hosts/`: Machine-specific entry points using shared modules.

## Deployment

1. Generate hardware profile:

    ```sh
    nixos-generate-config --show-hardware-config > hosts/nixos/hardware-configuration.nix
    ```

2. Track state:

   ```sh
   git add .
   ```

3. Apply state:

   ```sh
   sudo nixos-rebuild switch --flake .#nixos 
   
   # Or rebuild alias
   ```

## Management

### Update dependencies

```sh
nix flake update
rebuild
```

### Garbage collection

```sh
sudo nix-collect-garbage -d
```

## Subsystems

- Core: NixOS 26.05 (x86_64-linux)
- DE: XFCE4 / LightDM
- Shell: Zsh / Direnv / Oh-My-Posh
