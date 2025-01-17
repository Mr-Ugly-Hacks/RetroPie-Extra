#!/usr/bin/env bash

# This file is part of RetroPie-Extra, a supplement to RetroPie.
# For more information, please visit:
#
# https://github.com/RetroPie/RetroPie-Setup
# https://github.com/Exarkuniv/RetroPie-Extra
#
# See the LICENSE file distributed with this source and at
# https://raw.githubusercontent.com/Exarkuniv/RetroPie-Extra/master/LICENSE
#

rp_module_id="audacity"
rp_module_desc="Audacity open-source digital audio editor"
rp_module_licence="https://www.audacityteam.org"
rp_module_section="exp"
rp_module_flags="!mali !x86"

function depends_audacity() {
    getDepends xorg matchbox
}

function install_bin_audacity() {
    aptInstall audacity
}

function configure_audacity() {
    mkRomDir "ports"
    mkdir -p "$md_inst"
    moveConfigDir "$home/.config" "$md_conf_root/$md_id"
    cat >"$md_inst/audacity.sh" << _EOF_
#!/bin/bash
xset -dpms s off s noblank
matchbox-window-manager -use_titlebar no &
/usr/bin/audacity
_EOF_
    chmod +x "$md_inst/audacity.sh"

    addPort "$md_id" "audacity" "Audacity Open-Source Digital Audio Editor" "XINIT: $md_inst/audacity.sh"
}
