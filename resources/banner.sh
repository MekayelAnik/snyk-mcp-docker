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
