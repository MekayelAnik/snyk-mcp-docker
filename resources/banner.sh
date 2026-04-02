#!/bin/bash
# Placeholder banner - user will replace with custom ASCII art
ORANGE='\033[38;5;208m'
BLUE='\033[38;5;12m'
GREEN='\033[38;5;2m'
ASH_GRAY='\033[38;5;250m'
NC='\033[0m'

print_separator() {
    printf "\n______________________________________________________________________________________________________________________________________________\n"
}

# Print ASCII art
print_ascii_art() {
    printf "${NAVY_BLUE}      /SSSSSS                      /SS              /SSSSSS  /SS       /SSSSSS                       /SS      /SS  /SSSSSS  /SSSSSSS    ${NC}\n"
    printf "${NAVY_BLUE}     /SS__  SS                    | SS             /SS__  SS| SS      |_  SS_/          /SS         | SSS    /SSS /SS__  SS| SS__  SS   ${NC}\n"
    printf "${NAVY_BLUE}    | SS  \__/ /SSSSSSS  /SS   /SS| SS   /SS      | SS  \__/| SS        | SS           | SS         | SSSS  /SSSS| SS  \__/| SS  \ SS   ${NC}\n"
    printf "${NAVY_BLUE}    |  SSSSSS | SS__  SS| SS  | SS| SS  /SS/      | SS      | SS        | SS         /SSSSSSSS      | SS SS/SS SS| SS      | SSSSSSS/   ${NC}\n"
    printf "${NAVY_BLUE}     \____  SS| SS  \ SS| SS  | SS| SSSSSS/       | SS      | SS        | SS        |__  SS__/      | SS  SSS| SS| SS      | SS____/    ${NC}\n"
    printf "${NAVY_BLUE}     /SS  \ SS| SS  | SS| SS  | SS| SS_  SS       | SS    SS| SS        | SS           | SS         | SS\  S | SS| SS    SS| SS         ${NC}\n"
    printf "${NAVY_BLUE}    |  SSSSSS/| SS  | SS|  SSSSSSS| SS \  SS      |  SSSSSS/| SSSSSSSS /SSSSSS         |__/         | SS \/  | SS|  SSSSSS/| SS         ${NC}\n"
    printf "${NAVY_BLUE}     \______/ |__/  |__/ \____  SS|__/  \__/       \______/ |________/|______/                      |__/     |__/ \______/ |__/         ${NC}\n"
    printf "${NAVY_BLUE}                         /SS  | SS                                                                                                      ${NC}\n"
    printf "${NAVY_BLUE}                        |  SSSSSS/                                                                                                      ${NC}\n"
    printf "${NAVY_BLUE}                         \______/                                                                                                       ${NC}\n"
    printf "\n"
}
# Print Maintainer information
print_maintainer_info() {
    printf "\n"
    printf "${ORANGE} 888888ba                                      dP         dP        dP                                             dP                dP  ${NC}\n"
    printf "${ORANGE} 88     8b                                     88         88        88                                             88                88    ${NC}\n"
    printf "${ORANGE} a88aaaa8P 88d888b. .d8888b. dP    dP .d8888b. 88d888b. d8888P    d8888P .d8888b.    dp    dp .d8888b. dP    dP    88d888b. dP    dP       ${NC}\n"
    printf "${ORANGE} 88    8b. 88    88 88    88 88    88 88    88 88    88   88        88   88    88    88    88 88    88 88    88    88    88 88    88       ${NC}\n"
    printf "${ORANGE} 88    .88 88       88.  .88 88.  .88 88.  .88 88    88   88        88   88.  .88    88.  .88 88.  .88 88.  .88    88.  .88 88.  .88 dP    ${NC}\n"
    printf "${ORANGE} 88888888P dP        88888P   88888P   8888P88 dP    dP   888P      888P  88888P      8888P88  88888P   88888P     88Y8888   8888P88 88    ${NC}\n"
    printf "${ORANGE}                                           .88                                           .88                                     .88       ${NC}\n"
    printf "${ORANGE}                                       d8888P                                        d8888P                                  d8888P        ${NC}\n"
    printf "${ASH_GRAY} ███╗   ███╗██████╗        ███╗   ███╗███████╗██╗  ██╗ █████╗ ██╗   ██╗███████╗██╗          █████╗ ███╗   ██╗██╗██╗  ██╗                 ${NC}\n"
    printf "${ASH_GRAY} ████╗ ████║██╔══██╗       ████╗ ████║██╔════╝██║ ██╔╝██╔══██╗╚██╗ ██╔╝██╔════╝██║         ██╔══██╗████╗  ██║██║██║ ██╔╝                 ${NC}\n"
    printf "${ASH_GRAY} ██╔████╔██║██║  ██║       ██╔████╔██║█████╗  █████╔╝ ███████║ ╚████╔╝ █████╗  ██║         ███████║██╔██╗ ██║██║█████╔╝                  ${NC}\n"
    printf "${ASH_GRAY} ██║╚██╔╝██║██║  ██║       ██║╚██╔╝██║██╔══╝  ██╔═██╗ ██╔══██║  ╚██╔╝  ██╔══╝  ██║         ██╔══██║██║╚██╗██║██║██╔═██╗                  ${NC}\n"
    printf "${ASH_GRAY} ██║ ╚═╝ ██║██████╔╝██╗    ██║ ╚═╝ ██║███████╗██║  ██╗██║  ██║   ██║   ███████╗███████╗    ██║  ██║██║ ╚████║██║██║  ██╗                 ${NC}\n"
    printf "${ASH_GRAY} ╚═╝     ╚═╝╚═════╝ ╚═╝    ╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚══════╝    ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝╚═╝  ╚═╝                 ${NC}\n"
}

print_system_info() {
    print_separator
    local display_ip=$(ip route | awk '/default/ {print $3}')
    local disp_port="$PORT"

    printf "${GREEN} >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Starting Snyk MCP Server! <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< \n${NC}"
    printf "${ORANGE} ==================================${NC}\n"
    printf "${ORANGE} PUID: %s${NC}\n" "${PUID:-1000}"
    printf "${ORANGE} PGID: %s${NC}\n" "${PGID:-1000}"
    printf "${ORANGE} MCP IP Address: %s\n${NC}" "$display_ip"
    printf "${ORANGE} MCP Server PORT: ${GREEN}%s\n${NC}" "${disp_port:-8010}"
    printf "${ORANGE} Protocol: ${GREEN}%s\n${NC}" "${PROTOCOL:-SHTTP}"
    printf "${ORANGE} Snyk Profile: ${GREEN}%s\n${NC}" "${SNYK_MCP_PROFILE:-full}"
    printf "${ORANGE} Data Directory: ${GREEN}%s\n${NC}" "${DATA_DIR:-/data}"
    printf "${ORANGE} ==================================${NC}\n"
    [[ -f /usr/local/bin/build-timestamp.txt ]] && printf "${ORANGE}$(cat /usr/local/bin/build-timestamp.txt)${NC}\n"
    printf "${BLUE}This Container was started on:${NC} ${GREEN}$(date)${NC}\n"
}

main() {
    print_separator
    # User will add custom ASCII art here
    printf "${BLUE}  Snyk MCP Server - Security Scanning for AI Agents${NC}\n"
    print_system_info
}

main
