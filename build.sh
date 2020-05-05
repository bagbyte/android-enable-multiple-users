#!/bin/bash
sourceFolder="src"

generateManifest() {
  manifest="src/META-INF/MANIFEST.MF"

  declare -a files=("build_prop.sh" "META-INF/com/google/android/update-binary" "META-INF/com/google/android/updater-script")

  echo "Manifest-Version: 1.0" > $manifest
  echo "Created-By: 1.0 (Android SignApk)" >> $manifest

  for file in "${files[@]}"
  do
    sha=$(openssl dgst -sha1 -binary $sourceFolder/$file | base64)

    echo "" >> $manifest
    echo "Name: $file" >> $manifest
    echo "SHA1-Digest: $sha" >> $manifest
  done
}

# Generate src/META-INF/MANIFEST.MF
generateManifest

# Remove all .DS_Store files
find . -name '.DS_Store' -type f -delete

# Remove current enabler.zip
rm -rf enabler.zip

# Create the enabler.zip file
(cd $sourceFolder && zip -r -X ../enabler.zip .)

