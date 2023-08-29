#!/bin/bash

# create an empty input.csv file
touch input.csv

# declare an array of urls
urls=(
  https://raw.githubusercontent.com/bigdargon/hostsVN/master/option/domain.txt
  https://adguardteam.github.io/AdGuardSDNSFilter/Filters/filter.txt
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/xiaomi
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/apple
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/alexa
  https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_privacy.txt
  https://raw.githubusercontent.com/mullvad/dns-blocklists/main/output/doh/doh_gambling.txt
  https://abpvn.com/vip/hiepchau96.txt
  https://raw.githubusercontent.com/abpvn/abpvn/master/filter/abpvn.txt
  https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/MobileFilter/sections/adservers.txt
  https://raw.githubusercontent.com/AdguardTeam/AdguardFilters/master/ChineseFilter/sections/adservers_firstparty.txt
  https://gitlab.com/kowith337/PersonalFilterListCollection/raw/master/hosts/hosts_google_hotword.txt
  https://hostfiles.frogeye.fr/firstparty-only-trackers.txt
  https://raw.githubusercontent.com/adv247/IOS/master/ZALO_Block_All.txt
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/native.apple.txt
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/native.tiktok.txt
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/native.tiktok.extended.txt
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/native.winoffice.txt
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/native.amazon.txt
  https://raw.githubusercontent.com/hagezi/dns-blocklists/main/domains/native.huawei.txt
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/samsung
  https://raw.githubusercontent.com/nextdns/click-tracking-domains/main/domains
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/huawei
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/roku
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/sonos
  https://raw.githubusercontent.com/nextdns/native-tracking-domains/main/domains/windows
  https://raw.githubusercontent.com/gieljnssns/Social-media-Blocklists/master/adguard-instagram.txt
  https://raw.githubusercontent.com/gieljnssns/Social-media-Blocklists/master/adguard-facebook.txt
  https://raw.githubusercontent.com/gieljnssns/Social-media-Blocklists/master/pihole-facebook.txt
  https://raw.githubusercontent.com/gieljnssns/Social-media-Blocklists/master/adguard-netflix.txt
  https://raw.githubusercontent.com/ethan-xd/ethan-xd.github.io/master/fb.txt
  https://raw.githubusercontent.com/DandelionSprout/adfilt/master/Alternate%20versions%20Anti-Malware%20List/AntiMalwareHosts.txt

)

# loop through the urls and download each file with curl
for url in "${urls[@]}"; do
  # get the file name from the url
  file=$(basename "$url")
  # download the file with curl and save it as file.txt
  curl -o "$file.txt" "$url"
  # append the file contents to input.csv and add a newline
  cat "$file.txt" >> input.csv
  echo "" >> input.csv
  # remove the file.txt
  rm "$file.txt"
done

# print a message when done
echo "Done. The input.csv file contains merged data from recommended filter lists."
