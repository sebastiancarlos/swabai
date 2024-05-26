# return either 'linux' or 'macos'
function get_platform () {
  case "$(uname -s)" in
    Darwin)
      echo "macos"
      ;;
    Linux)
      echo "linux"
      ;;
    *)
      echo "unsupported platform"
      exit 1
      ;;
  esac
}
platform=$(get_platform)

function is_apple_silicon () {
  if [[ "$platform" == "macos" && $(uname -m) == "arm64" ]]; then
    echo "true"
  else
    echo "false"
  fi
}
apple_silicon=$(is_apple_silicon)
