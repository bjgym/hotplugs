# Unreleased

## Fix
- replace removed apiVersions so the hotplug charts install on modern
  Kubernetes: PDB templates `policy/v1beta1` → `policy/v1` (removed in 1.25)
  across thanos (storegateway, bucketweb, ruler, receive, query,
  query-frontend) and kubecube-monitoring (prometheus, alertmanager,
  kube-state-metrics, prometheus-adapter, grafana); HPA templates
  `autoscaling/v2beta1` → `autoscaling/v2` (removed in 1.26) across thanos
  (storegateway, receive, query-frontend, query) and grafana
- gate the remaining PodSecurityPolicy templates (thanos query and
  query-frontend, prometheus-adapter) on the `policy/v1beta1
  PodSecurityPolicy` API being served, so enabling them on Kubernetes ≥1.25
  renders nothing instead of failing the release
