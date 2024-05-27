<!-- Note: This README.md file was automatically generated. Plase run `make readme` to generate a new one. -->

# SWABAI (A wrapper for the Sway/i3/Yabai tiling window managers)
<p align="center">
  <img width="400" alt="Screenshot 2024-04-27 at 17 09 31" src="https://github.com/sebastiancarlos/swabai/assets/88276600/bae83e06-2891-40ba-83ef-9c06c83f5133">
</p>

Swabai is a set of abstractions for the Sway, i3, and Yabai **tiling window
managers**, allowing an identical workflow between them. It provides low-level
scripts for common tasks, and higher-level scripts built on top of them to
essentially create new commands which will work on both window managers.

This is my personal window manager setup, but I'm sharing it as it offers two
novel things:
- An example of using the same commands for several tiling window managers.
- A workflow that is not too different from the one you might be used to, as it
  closely follows Sway/i3 but uses a simpler scratchpad system similar to the
  one in Yabai.

If you ever felt like configuring a tiling window manager was hard, then let me
tell you this: Configuring two at the same time feels like a tall and
well-oiled Swabian is sodomizing you in Berghain. But hey, being forced to use
macOS at work, and losing your keybindings is even more unacceptable. This is
why I made Swabai. _Mir san Mir!_

## Features
- **Cross-platform compatibility:** Works with both Sway/i3 (Linux) and Yabai
  (macOS).
- **Quake mode:** A scratchpad which can be toggled with a keybinding. Expected
  to be used for terminals.  
- **Integrated application launcher:** Your scratchpad is your application
  launcher. Launching applications from there will close the scratchpad as soon
  as the application opens a window. (A workflow featured in ["Are Application
  Launchers
  Overrated?"](https://sebastiancarlos.com/are-application-launchers-overrated-e0407e220dc7))
- **Sway-like numbered workspaces:** Although more limited due to macOS
  limitations, spaces are numbered, they are deleted when empty, and you can
  move windows between them.
- **Minimal requirements:** Only Bash and jq.

## Limitations
- Does not support other operating systems or window managers.
- Might be too suited to the author's workflow. The author is a person who
  refers to themself in the third person when writing READMEs, so tread
  carefully. 99% of the time, they are using a terminal or a web browser;
  nothing else. However, this project might provide a good starting point for
  customization tailored to your specific needs.
- Bugs and outdated comments might be present. Please report them if you find
  them.
- Despite the name, there's no AI in Swabai.

## Installation

Open your favorite shell and get started:

1. `git clone https://github.com/sebastiancarlos/swabai'
2. `cd swabai`
3. `make install` (Adds them to your `PATH`).
4. Read through the commands, then add them to your keybindings or use them
directly from the terminal.

You can uninstall them by running `make uninstall`.

## Commands

Every command comes with its own help message. Just type `--help` after the
command to get a detailed explanation of its usage.

The commands are:

### `background-exec`

```bash
Usage: background-exec [OPTIONS] [--]  <command> [arguments...]
       background-exec [OPTIONS] [--] '<command> [arguments...]'

- Launch a command in the background, with no output, and outside of the job control.

Options:
  -d, --debug               Print debug output.
  -w, --quiet               Disable output.
  -h, --help                Show this help message.
```

### `get-terminal-cwd`

```bash
Usage: get-terminal-cwd <terminal-pid>
  - return the CWD of the terminal with the given PID
  - this is done by checking the first child of the terminal, which is usually a shell
  - default to ~ if there is no child
```

### `wm-workspace`

```bash
Usage: wm-workspace [OPTIONS] [VALUE]

- Go to provided workspace. Create it if it doesn't exist.
- If no value is provided, print the current workspace.

VALUE can be:
- "next", "prev", "next-empty", or a number.

OPTIONS:
  -q, --quiet               Do not print any output. (Useful for wrapping scripts
                            with their own outputs.)
  -h, --help                Show this help message.
```

### `wm-workspace-exists`

```bash
Usage: wm-workspace-exists <workspace>
  - Print 'true' if workspace exists, 'false' otherwise
  - Also, exit codes are 0 and 1 respectively
```

### `wm-workspace-get-cwd`

```bash
Usage: wm-workspace-get-cwd [workspace-name]
  - Prints the CWD of the first window in the provided workspace
  - If no workspace is provided, uses the currently focused workspace
  - If there is no window in the workspace, return ~
```

### `wm-workspace-kill`

```bash
Usage: wm-workspace-kill [workspace-name]
  - Close all windows in the provided workspace (but leave floating ones)
  - If no workspace is provided, uses the currently focused workspace
```

### `wm-workspace-kill-all`

```bash
Usage: wm-workspace-kill-all
  - Close all windows in all workspaces (except floating windows)
```

### `wm-workspace-get-current`

```bash
Usage: wm-workspace-get-current
  - Print name of current workspace
```

### `wm-workspace-get-next-empty`

```bash
Usage: wm-workspace-get-next-empty
  - Print number of the first empty workspace to the right of the
    current one (or the current workspace if it is empty).
```

### `wm-workspace-is-empty`

```bash
Usage: wm-is-workspace-empty <workspace>
  - Print 'true' if workspace is empty, 'false' otherwise
  - If workspace doesn't exist, print 'workspace doesn't exist' and exit with 1
  - Also, exit codes are 0 and 1 respectively
```

### `wm-swap-workspaces`

```bash
Usage: wm-swap-workspaces <workspace1> <workspace2>
       wm-swap-workspaces left|right
```

### `wm-move-to-workspace`

```bash
Usage: wm-move-to-workspace WORKSPACE

- Move window to provided workspace. Create it if it doesn't exist.
```

### `wm-fullscreen-toggle`

```bash
Usage: wm-fullscreen-toggle
  - Toggle fullscreen mode for the focused window
```

### `wm-float-toggle`

```bash
Usage: wm-float-toggle
  - Toggle the current focus between tiling and floating mode
  - If becoming floating, add a border
  - If becoming tiling, remove the border
```

### `wm-scratchpad-is-focused`

```bash
Usage: wm-scratchpad-is-focused
  - If focused, returns 0 and print "true"
  - If not, returns 1 and print "false"
```

### `wm-scratchpad-toggle`

```bash
Usage: wm-scratchpad-toggle [-h|--help] [-q|--quiet]
 - "advanced" version of "swaymsg scratchpad show" with one advantage:
   It toggles the scratchpad even if it's not currently focused, but only visible
   in the current workspace.
 - Relies on the scratchpad having the mark "scratchpad".
```

### `wm-move-to-scratchpad`

```bash
Usage: wm-move-to-scratchpad
  - Move the focused window to the scratchpad
  - Also add a border and a mark called "scratchpad"
```

### `wm-launch`

```bash
Usage: wm-launch [OPTIONS] [--]  <command> [arguments...]
       wm-launch [OPTIONS] [--] '<command> [arguments...]'

- Launch a command. Meant to be called from a wrapper script or alias, which in turn
  is called from a terminal running in the Sway/i3 scratchpad.

- After running it, the scratchpad is hidden. This is meant to simulate the UX of an
  application launcher like rofi, but from a terminal running in the scratchpad.

Options:
  -w, --workspace=<value>   Launch the command in the given workspace.
                            - VALUE can be "current" (default), "next", "prev",
                              "next-empty", or a number.
  -n, --no-hide-scratchpad  Do not hide the scratchpad after launching the command.
  -e, --window-name <value> Used to check for the new window's existence (by app_id
                            or instance). When the window exists, wm-launch exits.
                            With no value (default), exit as soon as a new window
                            is created.
  -t, --no-wait             Do not wait for a window to open. Exit immediately.
  -q, --quiet               Do not print any output. (Useful for wrapping scripts
                            with their own outputs.)
  -d, --debug               Print debug output.
  -h, --help                Show this help message.

Example:
  # in .bashrc
  alias firefox='wm-launch --workspace=next-empty -- firefox'

 <mod>- # open scratchpad
 firefox<ret> # launch firefox, scratchpad is then hidden.
```

### `wm-track-prev-focus`

```bash
Usage: wm-track-prev-focus

Tracks focus changes in i3/sway, renames workspaces and marks windows
with _prev. This enables the following key binding:
    bindsym $mod+grave [con_mark=_prev] focus
```

### `wm-print-tree`

```bash
Prints the current sway tree
  - Currently only works on Linux
```

