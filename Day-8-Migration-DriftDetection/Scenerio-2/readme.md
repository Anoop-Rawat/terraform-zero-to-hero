DRIFT DETECTION

Drift detection in Terraform refers to the process of identifying discrepancies between the desired state and the actual state of infrastructure. 

Drift occurs when changes are made outside of Terraform, such as manual updates via cloud consoles or modifications by other automation tools.


Drift detection is crucial because:
- Prevents Configuration Mismatches – Ensures infrastructure remains as intended.
- Enhances Security – Detects unauthorized changes that could introduce vulnerabilities.
- Improves Compliance – Helps maintain regulatory standards by tracking unexpected modifications.
- Reduces Operational Risks – Prevents unexpected failures due to untracked changes.
- Optimizes Costs – Identifies unintended resource modifications that may increase expenses.


In this project, we have S3 bucket for terraform backend which store terraform state file and same is used for state locking too.

I've used github action to detect drift , we can schedule it on particular time or just manually run the workflow

When workflow run, it print No drift detected if there is no external change and if there is a change from outside for terraform then it print Drift Detected which help us to find any changes done outside of terraform and we can import it if it required. If we do not import it and run terraform apply then those changes done outside of terraform will be destroy.