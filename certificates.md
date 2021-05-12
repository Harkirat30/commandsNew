
Below is the command for Inspecting a certificate 

1) openssl x509 -in certificate.crt -text -noout

This is used to verify the contents of a certificate * certificates - generating public and private key using rsa*

openssl genrsa -out privkey.pem 2048   ---->> generating private key

openssl rsa -in privkey.pem -out pubkey.pem -pubout  ---->> generating public key

