helm repo add prometheus-stack https://prometheus-community.github.io/helm-charts
helm repo update

kubectl cerate namespace monitoring
helm install monitoring-stack prometheus-stack/kube-prometheus-stack -n monitoring -f charts/monitoring/values.yaml