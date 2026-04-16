# customize.sh
# Advanced Systemless Installer Script for Curl Binary
# Fully rewritten and optimized for Wahyu6070
# Purpose: Rename libcurl.so to curl and inject into /system/bin

# Helper function to maintain consistent logging across the installation UI
print_log() {
    ui_print "$@"
}

print_log " "
print_log "==================================================="
print_log "    *Curl Binary Flashable Module By Wahyu6070* "
print_log "==================================================="
print_log " "
print_log "- Initializing hardware and architecture detection..."
print_log "- Detected Architecture (ARCH) : *$ARCH*"
print_log "- Detected Android API Level   : *$API*"
print_log " "

# Defining the source path based on the detected hardware architecture
# This module targets the libcurl.so file located in the bin folders
CURL_SRC_DIR="$MODPATH/bin/$ARCH"

# ---------------------------------------------------------
# PRE-INSTALLATION SOURCE VALIDATION
# ---------------------------------------------------------
print_log "- Validating source files for the *$ARCH* architecture..."

# Critical check: Ensure the architecture-specific folder exists
if [ ! -d "$CURL_SRC_DIR" ]; then
    print_log "! **CRITICAL ERROR**: Source directory for *$ARCH* was not found."
    print_log "! Installation cannot proceed. Aborting..."
    exit 1
fi

# Critical check: Ensure libcurl.so exists before attempting to rename/copy
if [ ! -f "$CURL_SRC_DIR/libcurl.so" ]; then
    print_log "! **CRITICAL ERROR**: *libcurl.so* is missing from the source folder."
    print_log "! Please verify your module ZIP structure."
    exit 1
fi

# ---------------------------------------------------------
# SYSTEMLESS DIRECTORY ALLOCATION
# ---------------------------------------------------------
print_log "- Preparing the system execution path..."
# We only focus on /system/bin as the user designated target
mkdir -p "$MODPATH/system/bin"

# ---------------------------------------------------------
# BINARY RENAMING AND INJECTION LOGIC
# ---------------------------------------------------------
print_log "- Starting binary transformation and injection..."

# Renaming libcurl.so to curl during the copy process to /system/bin/curl
print_log "  -> Processing: *libcurl.so* -> */system/bin/curl*"
cp -pf "$CURL_SRC_DIR/libcurl.so" "$MODPATH/system/bin/curl"

# Verifying the success of the copy and rename operation
if [ -f "$MODPATH/system/bin/curl" ]; then
    print_log "  -> Successfully renamed and injected *curl*."
    
    # Setting the execution bit (rwxr-xr-x) for the new binary
    print_log "  -> Setting execution permissions (chmod 0755)..."
    chmod 0755 "$MODPATH/system/bin/curl"
else
    print_log "! **ERROR**: Failed to copy the binary to the destination path."
    exit 1
fi

# ---------------------------------------------------------
# CLEANUP AND FINALIZATION
# ---------------------------------------------------------
# Removing Termux references and unnecessary source binaries to save space
print_log "- Finalizing installation and cleaning up temporary files..."
rm -rf "$MODPATH/bin"

print_log " "
print_log "==================================================="
print_log " *Installation Successfully Finished!*"
print_log " "
print_log " *Quick Start Instructions:*"
print_log " 1. Open your terminal app."
print_log " 2. Request root access by typing: *su*"
print_log " 3. Test the installation with: *curl --version*"
print_log "==================================================="
print_log " "
