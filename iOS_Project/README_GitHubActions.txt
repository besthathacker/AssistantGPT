# AssistantGPT iOS Build (GitHub Actions)

## Steps
1. Add your `.p12` certificate and provisioning profile as Base64 strings in GitHub Secrets:
   - `CERT_P12_BASE64`
   - `PROVISION_PROFILE_BASE64`
   - `P12_PASSWORD`

2. Update `ExportOptions.plist` with your correct `teamID` and provisioning profile name.

3. Push this repository and run the GitHub Action `iOS IPA Build & Sign`.

The resulting `.ipa` will be available as a workflow artifact.
