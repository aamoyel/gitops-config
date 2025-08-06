## Flucd (GitOps)

Deploy fluxcd and gitops resources in the cluster

```bash
kustomize build fluxcd/operator | kubectl apply -f -
kustomize build fluxcd/instances | kubectl apply -f -
kustomize build fluxcd/ | kubectl apply -f -
```
