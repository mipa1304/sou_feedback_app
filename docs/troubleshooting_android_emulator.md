# Internet Not Working in the Emulator

If you are experiencing issues with internet connectivity in your Android emulator, follow these troubleshooting steps:

## Steps to Resolve

1. **Check Emulator Network Settings**:
    - Ensure the emulator is connected to the internet.
    - Go to `Settings > Network & Internet` in the emulator and verify the Wi-Fi or mobile data is enabled.

2. **Restart the Emulator**:
    - Close and restart the emulator to refresh its network configuration.

3. **Verify Host Machine's Internet**:
    - Ensure your host machine has an active internet connection.

4. **Reset Emulator Network**:
    - Open the emulator's extended controls (`...` menu).
    - Navigate to `Settings > Proxy` and reset any custom proxy settings.

5. **Check ADB Connection**:
    - Run the following command to verify the emulator is connected:
      ```bash
      adb devices
      ```
    - If the emulator is not listed, restart the ADB server:
      ```bash
      adb kill-server
      adb start-server
      ```

6. **Update Emulator and SDK Tools**:
    - Open Android Studio.
    - Go to `SDK Manager > SDK Tools` and update the emulator and related tools.

7. **Clear Emulator Data**:
    - In Android Studio, go to `AVD Manager`.
    - Select your emulator and click `Wipe Data`.

8. **Test with a New Emulator**:
    - Create a new emulator instance in `AVD Manager` to rule out configuration issues.

## Additional Resources
- [Android Emulator Documentation](https://developer.android.com/studio/run/emulator)
- [Common Emulator Issues](https://developer.android.com/studio/run/emulator-troubleshooting)

If the issue persists, consider reaching out to the Android developer community or filing a bug report.
