# Type a script or drag a script file from your workspace to insert its path.
PATH_TO_GOOGLE_PLISTS="${PROJECT_DIR}/Config"

echo "build config is ${CONFIGURATION}"

case "${CONFIGURATION}" in

    "Debug-dev" | "Profile-dev" | "Release-dev")
        cp -r "$PATH_TO_GOOGLE_PLISTS/dev/GoogleService-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;

    "Debug-prod" | "Profile-prod" | "Release-prod")
        cp -r "$PATH_TO_GOOGLE_PLISTS/prod/GoogleService-Info.plist" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;

    *)
        echo "Unknown configuration";;
esac


# # Name and path of the resource we're copying
# GOOGLESERVICE_INFO_PLIST="GoogleService-Info.plist"
# GOOGLESERVICE_INFO_FILE="${PROJECT_DIR}/config"

# # Print the current build configuration.
# echo "build config is ${CONFIGURATION}"

# # Start a case statement to handle different build configurations.
# case "${CONFIGURATION}" in

#    # For dev configurations:
#    "Debug-dev" | "Profile-dev" | "Release-dev")
#         # Copy the development GoogleService-Info plist file to the appropriate location in the build products directory.
#         cp -r "$GOOGLESERVICE_INFO_FILE/dev/$GOOGLESERVICE_INFO_PLIST" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;
        
#     # For prod configurations:
#   "Debug-prod" | "Profile-prod" | "Release-prod")
#         # Copy the beta GoogleService-Info plist file to the appropriate location in the build products directory.
#         cp -r "$GOOGLESERVICE_INFO_FILE/prod/$GOOGLESERVICE_INFO_PLIST" "${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist" ;;

#    # If none of the above configurations match, do nothing.
#     *)
#         ;;
# esac
