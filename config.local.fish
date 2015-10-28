. ~/git/virtualfish/virtual.fish
. ~/git/virtualfish/auto_activation.fish
. ~/git/virtualfish/global_requirements.fish

set -gx PATH ~/android-sdk-linux/tools ~/local/bin $PATH
set -gx PATH ~/pebble-dev/PebbleSDK-2.9/bin $PATH

# Source z.fish so that it builds the jump list from my directories
source $__fish_config_dir/functions/z.fish

# Run functions that have --on-variable PWD
auto_scratch_bin
auto_node_modules_bin
