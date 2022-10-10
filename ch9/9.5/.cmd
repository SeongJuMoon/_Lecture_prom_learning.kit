   69  ls -rlth
   70  cat 1.MUST-Run-to-change-Slack-URL.sh
   71  ./1.MUST-Run-to-change-Slack-URL.sh https://hooks.slack.com/services/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
   72  cat prom-operator-config/add-alertmanager.yaml
   73  ls -rlth
   74  cat ./2.prometheus-stack-upgrader-15s.sh
   75  ./2.prometheus-stack-upgrader-15s.sh
   76  k -n monitoring get po,svc
   77  k -n monitoring get prometheus
   78  k -n monitoring edit prometheus prometheus-stack-kube-prom-prometheus
   79  k -n monitoring get alertmanager
   80  k -n monitoring edit prometheus-stack-kube-prom-alertmanager
   81  k -n monitoring edit alertmanager prometheus-stack-kube-prom-alertmanager
   82  k -n monitoring get secret
   83  k -n monitoring edit secret alertmanager-prometheus-stack-kube-prom-alertmanager
   84  ls -rlth
   85  cat 3.retrieve-alertmanager-config.sh
   86  ./3.retrieve-alertmanager-config.sh
   87  k -n monitoring get svc
   88  ls -rlth
   89  vi 4.PrometheusRule-prometheus-operator-down.yaml
   90  k apply -f 4.PrometheusRule-prometheus-operator-down.yaml
   91  k -n monitoring get prometheusrule
   92  k -n monitoring get cm
   93  k -n monitoring deploy
   94  k -n monitoring get deploy
   95  k -n monitoring scale deploy prometheus-stack-kube-prom-operator --replicas=0
   96  k -n monitoring scale deploy prometheus-stack-kube-prom-operator --replicas=1
   97  k delete -f 4.PrometheusRule-prometheus-operator-down.yaml
   98  k -n monitoring get prometheusrule
   99  k -n monitoring get cm
  100  ls -rlth
  101  cat 5.rollback-add-alertmanager.sh
  102  ./5.rollback-add-alertmanager.sh
  103  k -n monitoring get alertmanager
  104  k -n monitoring get po,svc
  105  history
