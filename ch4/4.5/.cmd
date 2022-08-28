# 192.168.1.11 프로메테우스 UI로 이동합니다.

metallb_allocator_addresses_in_use_total #2

kubectl create deploy chk-hn --image sysnet4admin/chk-hn --replicas=1
kubectl expose deploy chk-hn --name chk-hn-loadbalancer --type=LoadBalancer --port 80 --target-port 80

metallb_allocator_addresses_in_use_total #3

# 메탈 LB에 prometheus.io/scrape 및 prometheus.io/port 정보가 설정되있는 것을 확인합니다
kubectl get pods -n metallb-system -o yaml | grep annotation -C 3

# 그러면, 이렇게 설정한 정보는 어떻게 프로메테우스가 가져올까요? 그 답은
프로메테우스 컨피그 서버에 존재합니다.

kubectl get cm prometheus-server -n monitoring -o yaml | nl

---
203  - honor_labels: true
204    job_name: kubernetes-pods
205    kubernetes_sd_configs:
206    - role: pod
207    relabel_configs:
208    - action: keep
209      regex: true
210      source_labels:
211      - __meta_kubernetes_pod_annotation_prometheus_io_scrape
212    - action: drop
213      regex: true
214      source_labels:
215      - __meta_kubernetes_pod_annotation_prometheus_io_scrape_slow
216    - action: replace
217      regex: (https?)
218      source_labels:
219      - __meta_kubernetes_pod_annotation_prometheus_io_scheme
220      target_label: __scheme__
221    - action: replace
222      regex: (.+)
223      source_labels:
224      - __meta_kubernetes_pod_annotation_prometheus_io_path
225      target_label: __metrics_path__
226    - action: replace
227      regex: ([^:]+)(?::\d+)?;(\d+)
228      replacement: $1:$2
229      source_labels:
230      - __address__
231      - __meta_kubernetes_pod_annotation_prometheus_io_port
232      target_label: __address__
233    - action: labelmap
234      regex: __meta_kubernetes_pod_annotation_prometheus_io_param_(.+)
235      replacement: __param_$1
236    - action: labelmap
237      regex: __meta_kubernetes_pod_label_(.+)
238    - action: replace
239      source_labels:
240      - __meta_kubernetes_namespace
241      target_label: namespace
242    - action: replace
243      source_labels:
244      - __meta_kubernetes_pod_name
245      target_label: pod
246    - action: drop
247      regex: Pending|Succeeded|Failed|Completed
248      source_labels:
249      - __meta_kubernetes_pod_phase
---
