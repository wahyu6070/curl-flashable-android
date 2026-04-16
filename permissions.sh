# permissions.sh
# Last Updated: 16-04-2026
# Security and Access Control Configuration for the Curl Module

# Unified logging function to support both Magisk/KSU and Recovery environments
if type ui_print >/dev/null 2>&1; then
    log_print() { ui_print "$@"; }
elif type print >/dev/null 2>&1; then
    log_print() { print "$@"; }
else
    log_print() { echo "$@"; }
fi

log_print "- Initiating permission protocols for the Curl binary..."

# ---------------------------------------------------------
# TARGET EXECUTION PERMISSION LOGIC
# ---------------------------------------------------------
# This function applies standard Android security policies to the curl binary
apply_curl_security_policy() {
    local target_path="$1/curl"
    
    if [ -f "$target_path" ]; then
        log_print "  -> Applying security context to: $target_path"
        
        # 1. Ownership: root (UID 0) and shell (GID 2000) for system binary standard
        chown 0:2000 "$target_path"
        
        # 2. Access Rights: Read & Execute for everyone (rwxr-xr-x)
        chmod 0755 "$target_path"
        
        # 3. SELinux: Set to system_file context to prevent access denials
        chcon u:object_r:system_file:s0 "$target_path" 2>/dev/null
        
        log_print "     [SUCCESS] Permissions verified for *curl*."
    fi
}

# ---------------------------------------------------------
# ENVIRONMENT DETECTION AND EXECUTION
# ---------------------------------------------------------

# Checking for Magisk/APatch/KernelSU environment via MODPATH
if [ -n "$MODPATH" ]; then
    log_print "- Detected Systemless environment (MODPATH). Proceeding..."
    apply_curl_security_policy "$MODPATH/system/bin"
fi

# Checking for Custom Recovery or Kopi Installer environment via SYSTEM
if [ -n "$SYSTEM" ]; then
    log_print "- Detected System partition environment (Recovery). Proceeding..."
    apply_curl_security_policy "$SYSTEM/bin"
fi

log_print "- Permission routine for Curl has been completed."
