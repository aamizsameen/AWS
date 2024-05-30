# Helm Chart Commands

```bash
# To create a new repo:
helm create <repo-name>

# To add the remote repo:
helm repo add <prometheus-community> <https://prometheus-community.github.io/helm-charts>

# To update the remote repo:
helm repo update

# To install the helm repo:
helm install <release-name> <repo-name>

# To list the repo which is added from the remote:
helm repo ls

# To list all the repos including local and remote:
helm ls
# or
helm list

# Upgrade the release:
helm upgrade <release-name> <repo-name> --values <repo-name>/values.yaml

# To roll back to the older version:
helm rollback <release-name> <version>

# To delete the repo:
helm delete <release-name>
