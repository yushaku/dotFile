alias k='kubectl'

command -v fzf >/dev/null 2>&1 && {
	source <(kubectl completion zsh | sed 's#${requestComp} 2>/dev/null#${requestComp} 2>/dev/null | head -n -1 | fzf  --multi=0 #g')
}

k-namespace() {
	kubectl config set-context --current --namespace="$1"
}

k-bash() {
	kubectl exec -it "$1" -- sh -c "(bash || sh)"
}

k-scale() {
	kubectl scale --replicas="$2" deployment "$1"
}

k-env() {
	kubectl exec -it "$1" -- env | grep -ev "(TCP|tcp|HTTP|SERVICE_HOST|SERVICE_PORT)" | batcat -l DotENV --theme TwoDark
}

k-restart() {
	kubectl rollout restart deployment/"$1"
}

k-image() {
	kubectl get deploy -o wide | grep "$1" | awk '{print $7}'
}

# Port forwarding
function kpf() {
	if [[ -z $1 ]]; then
		echo "you forgot enter service name"
		return 1
	elif [[ -z $2 ]]; then
		echo "you forgot enter service port"
		return 1
	elif [[ -z $3 ]]; then
		kubectl port-forward svc/"$1" "$2":"$2"
	else
		kubectl port-forward svc/"$1" "$3":"$2"
	fi
}

# Apply a YML file
alias kaf='kubectl apply -f'

# Manage configuration quickly to switch contexts between local, dev ad staging.
alias kcuc='kubectl config use-context'
alias kcsc='kubectl config set-context'
alias kcdc='kubectl config delete-context'
alias kccc='kubectl config current-context'

# List all contexts
alias kcgc='kubectl config get-contexts'

# General aliases
alias kdel='kubectl delete'
alias kdelf='kubectl delete -f'

# Pod management.
function kgp() {
	if [[ -z $1 ]]; then
		kubectl get pods
	else
		kubectl get pods | grep "$1"
	fi
}
alias kgpa='kubectl get pods --all-namespaces'
alias kgpw='kubectl get pods --watch'
alias kgpwide='kubectl get pods -o wide'
alias kep='kubectl edit pods'
alias kdp='kubectl describe pods'
alias kdelp='kubectl delete pods'
alias kgpall='kubectl get pods --all-namespaces -o wide'

# get pod by label: kgpl "app=myapp" -n myns
alias kgpl='kgp -l'

# get pod by namespace: kgpn kube-system"
alias kgpn='kgp -n'

# Service management.
function kgs() {
	if [[ -z $1 ]]; then
		kubectl get svc
	else
		kubectl get svc | grep "$1"
	fi
}

alias kgsa='kubectl get svc --all-namespaces'
alias kgsw='kgs --watch'
alias kgswide='kgs -o wide'
alias kes='kubectl edit svc'
alias kds='kubectl describe svc'
alias kdels='kubectl delete svc'

# Ingress management
alias kgi='kubectl get ingress'
alias kgia='kubectl get ingress --all-namespaces'
alias kei='kubectl edit ingress'
alias kdi='kubectl describe ingress'
alias kdeli='kubectl delete ingress'

# Namespace management
alias kgns='kubectl get namespaces'
alias kens='kubectl edit namespace'
alias kdns='kubectl describe namespace'
alias kdelns='kubectl delete namespace'
alias kcn='kubectl config set-context --current --namespace'

# ConfigMap management
alias kgcm='kubectl get configmaps'
alias kgcma='kubectl get configmaps --all-namespaces'
alias kecm='kubectl edit configmap'
alias kdcm='kubectl describe configmap'
alias kdelcm='kubectl delete configmap'

# Secret management
alias kgsec='kubectl get secret'
alias kgseca='kubectl get secret --all-namespaces'
alias kdsec='kubectl describe secret'
alias kdelsec='kubectl delete secret'

# Deployment management.
alias kgd='kubectl get deployment'
alias kgda='kubectl get deployment --all-namespaces'
alias kgdw='kgd --watch'
alias kgdwide='kgd -o wide'
alias ked='kubectl edit deployment'
alias kdd='kubectl describe deployment'
alias kdeld='kubectl delete deployment'
alias ksd='kubectl scale deployment'
alias krsd='kubectl rollout status deployment'

# Rollout management.
alias kgrs='kubectl get replicaset'
alias kdrs='kubectl describe replicaset'
alias kers='kubectl edit replicaset'
alias krh='kubectl rollout history'
alias kru='kubectl rollout undo'

# Statefulset management.
alias kgss='kubectl get statefulset'
alias kgssa='kubectl get statefulset --all-namespaces'
alias kgssw='kgss --watch'
alias kgsswide='kgss -o wide'
alias kess='kubectl edit statefulset'
alias kdss='kubectl describe statefulset'
alias kdelss='kubectl delete statefulset'
alias ksss='kubectl scale statefulset'
alias krsss='kubectl rollout status statefulset'

# Tools for accessing all information
alias kga='kubectl get all'
alias kgaa='kubectl get all --all-namespaces'

# Logs
function k-logs() {
	if [[ -z "$2" ]]; then
		kubectl logs -f deployment/"$1" | pino-pretty
	else
		kubectl logs -f deployment/"$1" | grep -v "$2" | pino-pretty
	fi
}
alias kl='kubectl logs'
alias kl1h='kubectl logs --since 1h'
alias kl1m='kubectl logs --since 1m'
alias kl1s='kubectl logs --since 1s'
alias klf='kubectl logs -f'
alias klf1h='kubectl logs --since 1h -f'
alias klf1m='kubectl logs --since 1m -f'
alias klf1s='kubectl logs --since 1s -f'

# File copy
alias kcp='kubectl cp'

# Node Management
alias kgno='kubectl get nodes'
alias keno='kubectl edit node'
alias kdno='kubectl describe node'
alias kdelno='kubectl delete node'

# PVC management.
alias kgpvc='kubectl get pvc'
alias kgpvca='kubectl get pvc --all-namespaces'
alias kgpvcw='kgpvc --watch'
alias kepvc='kubectl edit pvc'
alias kdpvc='kubectl describe pvc'
alias kdelpvc='kubectl delete pvc'

# Service account management.
alias kdsa="kubectl describe sa"
alias kdelsa="kubectl delete sa"

# DaemonSet management.
alias kgds='kubectl get daemonset'
alias kgdsw='kgds --watch'
alias keds='kubectl edit daemonset'
alias kdds='kubectl describe daemonset'
alias kdelds='kubectl delete daemonset'

# CronJob management.
k-cron() {
	if [[ -z "$1" ]]; then
		kubectl get cronjob
	else
		kubectl get cronjob | grep "$1"
	fi
}
alias kecj='kubectl edit cronjob'
alias kdcj='kubectl describe cronjob'
alias kdelcj='kubectl delete cronjob'

# Job management.
alias kgj='kubectl get job'
alias kej='kubectl edit job'
alias kdj='kubectl describe job'
alias kdelj='kubectl delete job'
