global:
  domain: ${subdomain}.${domain}
  nodeSelector:
    kubernetes.io/os: linux
    %{ if node_type != "any" }
    cloud.google.com/gke-provisioning: ${node_type}
    %{ endif }
  securityContext:
    fsGroup: 999
    runAsUser: 999
  logging:
    level: error
dex:
  serviceAccount:
    create: false
    name: ${service_acc_name}
controller:
  serviceAccount:
    create: false
    name: ${service_acc_name}
  metrics:
    enabled: ${metrics}
    serviceMonitor:
      enabled: ${metrics}
repoServer:
  metrics:
    enabled: ${metrics}
    serviceMonitor:
      enabled: ${metrics}
  serviceAccount:
    create: false
    name: ${service_acc_name}
    autoscaling:
      enabled: true
      minReplicas: 1
      maxReplicas: 5
  initContainers:
    - name: download-tools
      image: alpine:3
      command: [ sh, -c ]
      args:
      - |
        cd /var/run/docker-credential-gcr
        wget -qO - https://github.com/GoogleCloudPlatform/docker-credential-gcr/releases/download/v2.1.21/docker-credential-gcr_linux_amd64-2.1.21.tar.gz | tar xz
        PATH=$PATH:/var/run/docker-credential-gcr HOME=/var/run/config docker-credential-gcr configure-docker --include-artifact-registry
        chmod +r /var/run/config/.docker/config.json
      volumeMounts:
      - mountPath: /var/run/docker-credential-gcr
        name: docker-credential-gcr
      - mountPath: /var/run/config/.docker
        name: docker-config
  volumeMounts:
    - mountPath: /usr/local/bin/docker-credential-gcr
      name: docker-credential-gcr
      subPath: docker-credential-gcr
      readOnly: true
    - mountPath: /home/argocd/.docker
      name: docker-config
      readOnly: true
  volumes:
    - emptyDir: {}
      name: docker-credential-gcr
    - emptyDir: {}
      name: docker-config
server:
  metrics:
    enabled: ${metrics}
    serviceMonitor:
      enabled: ${metrics}
  serviceAccount:
    create: false
    name: ${service_acc_name}
  autoscaling:
    enabled: true
    minReplicas: 2
  extraArgs:
    - --insecure
  ingress:
    enabled: true
    annotations:
      kubernetes.io/ingress.class: ${ingress_class}
      cert-manager.io/cluster-issuer: ${lets_encrypt_issuer}
      nginx.ingress.kubernetes.io/whitelist-source-range: ${allowed_ip_to_connect}
    hosts:
      - ${subdomain}.${domain}
    tls:
      - hosts:
          - ${subdomain}.${domain}
        secretName: ${subdomain}.${domain}-tls
  config:
    url: https://${subdomain}.${domain}
    statusbadge.enabled: "true"

configs:
  cm:
    url: https://${subdomain}.${domain}
    statusbadge.enabled: true
    exec.enabled: ${enable_web_terminal}
    dex.config: |
      connectors:
        - type: ${platform}
          id: ${platform}
          name: ${platform == "github" ? "GitHub" : "bitbucket"}
          config:
            clientID: ${clientID}
            clientSecret: ${clientSecret}
            redirectURI: https://${subdomain}.${domain}/api/dex/callback
            scopes:
            - email
            - account
            %{ if platform == "github" }
            orgs:
            - name: ${github_org}
            %{ endif }
  rbac:
    policy.default: 'role:admin'
