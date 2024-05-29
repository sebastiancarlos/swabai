# add this somewhere in your .bashrc

# wm-use-workspace-cwd
# - this must be implemented as a function because it calls 'cd'
# - usecase: matching scracthpad's cwd to the cwd of the workspace
function wm-use-workspace-cwd () {
  if [[ "$#" -eq 1 && ("$1" == "-h" || "$1" == "--help") ]]; then
      echo "${bold}Usage:${reset} ${green}wm-use-workspace-cwd${reset} [workspace-name]"
      echo "  - Change to the CWD of the first window in the provided workspace"
      echo "  - If no workspace is provided, uses the currently focused workspace"
      echo "  - If there is no window in the workspace, change to ~"
      return 1
  fi

  cd $(wm-workspace-get-cwd "$@")
}
