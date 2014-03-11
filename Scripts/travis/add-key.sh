mkdir -p ./Scripts/travis/profile
security create-keychain -p travis ios-build.keychain
security import ./Scripts/travis/apple.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./Scripts/travis/dist.cer -k ~/Library/Keychains/ios-build.keychain -T /usr/bin/codesign
security import ./Scripts/travis/dist.p12 -k ~/Library/Keychains/ios-build.keychain -P $KEY_PASSWORD -T /usr/bin/codesign
mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles
cp ./Scripts/travis/profile/* ~/Library/MobileDevice/Provisioning\ Profiles/