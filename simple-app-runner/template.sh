helm template . -f values.yaml -n app-chart-namespace --set app.recreatePod=true > template.yaml