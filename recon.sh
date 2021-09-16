#!/bin/bash

mkdir $1;

cd $1;

echo "[*] SUBDOMIAN RECON";

subfinder --silent -d $1 -o subdomains;

cat subdoimans | wc -l;

echo;

echo "[*] HTTP VALIDATION";

cat subdomains | httpx | anew valid_domains;

cat valid_domains | wc -l;

echo;

echo "[*] WEB FINGERPRINT";

mkdir fingerprint;

cd fingerprint;

cat ../valid_domains | aquatone -silent | grep -v aqua;

waybackurls $1 > url.txt