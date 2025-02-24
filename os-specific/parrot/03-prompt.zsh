function prompt_htb_box() {
    local boxdir
    local boxname
    local boxip
    case $PWD/ in
    (*htb/boxes/*)
        boxname="$(echo "$PWD" | sed "s@${HOME}/htb/boxes/@@" | cut -d'/' -f1)"
        test -z "${boxname}" && return
        boxdir="${HOME}/htb/boxes/${boxname}"
        if [ -f "${boxdir}/.ip" ]; then
            boxip="$(head -n1 "${boxdir}/.ip")"
            segment_content="${boxip}"
        else
            segment_content="${boxname}"
        fi

        p10k segment -b "#1a2332" -f '#9FEF00' -i '󰆧' -t "${segment_content}"
        ;;
    esac
}
if [[ -z "${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[(r)htb_box]}" ]]; then
    local addition_index="$(( ${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[(i)vpn_ip]} + 1))"
    POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[${addition_index}]=(htb_box "${POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS[${addition_index}]}")
    unset addition_index
fi

typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off # disable transient prompt as it's nice to see the box ip always

typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="${POWERLEVEL9K_SHORTEN_FOLDER_MARKER//)/|.ip)}"
typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=first
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(${POWERLEVEL9K_LEFT_PROMPT_ELEMENTS:#os_icon})
