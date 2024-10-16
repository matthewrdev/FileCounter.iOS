
echo "Cleaning previous build artifacts..."

# Delete existing build artifacts
if [ -d "FileCounter/bin" ]; then
    rm -rf "FileCounter/bin"
fi
if [ -d "FileCounter/obj" ]; then
    rm -rf "FileCounter/obj"
fi

# Execute the builds.
dotnet build FileCounter/FileCounter.csproj -c Release

# Delete existing output
if [ -d "lib" ]; then
    rm -rf "lib"
fi

mkdir "lib"

# Move libraries into correct folders.
cp -R "FileCounter/bin/Release/net8.0-ios" "lib"

# Cleanup unused files that may have been moved by the previous step.
rm "lib/net8.0-ios/FileCounter.pdb"