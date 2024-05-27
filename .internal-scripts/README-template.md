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

<!-- INSERT commands_help -->
