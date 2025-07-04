# Terraform GCP Project: Troubleshooting & Pro Tips

Maintained by: GitHub Copilot

This document collects real-world issues, tricky scenarios, and best practices encountered while building and deploying this Terraform GCP resource library. Use it as a reference for onboarding, debugging, and sharing knowledge with your team!

---

## 1. Authentication Without Credentials File
- **Scenario:** No `service-account.json` or credentials file was placed in the repo, but Terraform still worked.
- **Why?**: Terraform uses your local gcloud credentials if you have run `gcloud auth application-default login` or are logged in with the Google Cloud SDK. No credentials file is needed in the repo for local use.
- **Tip:** For CI/CD or team use, generate a service account key and set the `GOOGLE_APPLICATION_CREDENTIALS` environment variable.

---

## 2. Backend Bucket Not Found
- **Scenario:** Terraform errors about a missing GCS bucket for state, even after creating it.
- **Why?**: The bucket must exist in the correct project and region, and the name must match exactly in `backend.tf`.
- **Tip:** Use `gsutil ls -p <project> gs://<bucket>` to verify. Create with `gsutil mb -p <project> -l <region> gs://<bucket>`.

---

## 3. Monitoring/Alerting Errors
- **Scenario:** Errors about metric types, notification channel labels, or log sink destinations.
- **Why?**: GCP APIs are strict about resource types, metric names, and required fields.
- **Tips:**
  - Always include `resource.type` in alert policy filters.
  - Use only valid metric types (e.g., memory utilization requires Ops Agent).
  - For notification channels, use the correct label keys (e.g., `email_address` for email).
  - Log sink destinations must be valid URIs (e.g., `storage.googleapis.com/<bucket>`).

---

## 4. Variable and Module Best Practices
- **Scenario:** Duplicate variable errors or manual prompts for variables.
- **Why?**: Variables should be declared only once per module, and all required variables should be set in `terraform.tfvars`.
- **Tip:** Move all variable blocks to `variables.tf` in each module, and provide a complete `terraform.tfvars` for easy onboarding.

---

## 5. Backend Configuration Ignored Warning
- **Scenario:** Terraform warns that backend configuration is ignored in submodules.
- **Why?**: Backend config must only be in the root module, not in submodules or provider folders.
- **Tip:** Remove all `backend.tf` files except the one in the root.

---

## 6. State and Sensitive Files in Git
- **Scenario:** Accidentally pushing state or secrets to GitHub.
- **Tip:** Use a strict `.gitignore` to exclude `.terraform/`, `*.tfstate*`, `*.tfvars`, and editor/OS files.

---

## 7. General Debugging
- **Tip:**
  - Use `terraform state list` to see all managed resources.
  - Use `terraform plan` to preview changes.
  - Check the `documentation/` folder for module-specific details.

---

## About This Guide
This file is maintained by **GitHub Copilot** and reflects real-world troubleshooting and pro tips from building this project. If you encounter new issues or have tips to share, please contribute!
