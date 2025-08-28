# Enable repart and openssl PACKAGECONFIG
PACKAGECONFIG:append = " repart"

# Ensure openssl is also enabled (required for repart)
PACKAGECONFIG:append = " openssl"