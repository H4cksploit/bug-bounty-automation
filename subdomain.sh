RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
BOLD='\033[1m'
UNDERLINE='\033[4m'
NC='\033[0m' # No Color


#mkdir subdomains
#cd subdomains

echo "${RED}${BOLD}input target${NC}:"
read url
echo
echo

# Create directory with target name
target_dir="${url}_subdomains"
mkdir -p "$target_dir"
cd "$target_dir"

echo "${YELLOW}Starting subdomain enumeration for $url${NC}"
echo

echo "${YELLOW}subfinder subdomains${NC}"
echo
echo
subfinder -d $url > subfinder.txt
echo
echo
echo "${YELLOW}puredns subdomains${NC}"
echo
echo
puredns bruteforce /home/hacksploit/subdomains-5000.txt --resolvers /home/hacksploit/resolvers.txt $url --rate-limit 100 --rate-limit-trusted 100 > puredns.txt
echo
echo
echo "${YELLOW}sublist3r${NC}"
echo
echo
sublist3r -d $url > sublist3r.txt
echo
echo
echo "${YELLOW}Assetfinder${NC}"
echo
echo
assetfinder --subs-only $url > assetfinder.txt
echo
echo
echo "${YELLOW}Knockpy${NC}"
echo
echo
knockpy -d $url > knockpy.txt
echo
echo
echo "${YELLOW}findomain${NC}"
echo
echo
findomain -t $url > findomain.txt
echo
echo
fi
