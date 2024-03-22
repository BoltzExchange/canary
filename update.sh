#!/bin/bash

CURRENT_DATE=$(date '+%Y-%m-%d')
BEST_BLOCK_HASH=$(bitcoin-cli getblockchaininfo | jq -r .bestblockhash)

cat <<EOF > message.txt
The maintainer(s) and admins of the software project
known as Boltz Exchange have received and complied with 0
requests for information of any kind by any third parties
including but not limited to government agencies. We will
renew this notice in 60 days time. If this notice fails
to be renewed by then, you should assume the worst.

I am the admin of https://boltz.exchange
I am in control of my PGP key.
I will update this canary within 60 days.

Today is $CURRENT_DATE.
Latest bitcoin block hash:
$BEST_BLOCK_HASH
EOF

rm message.txt.asc
gpg --clearsign -u C2640F630570F5EDEDE02DE684D249BA71685D46 message.txt
rm message.txt
