<div align="center">

<img src="https://camo.githubusercontent.com/5b298bf6b0596795602bd771c5bddbb963e83e0f/68747470733a2f2f692e696d6775722e636f6d2f7031527a586a512e706e67" align="center" width="144px" height="144px"/>

### Homelab Kubernetes infrastructure :sailboat:

</div>

### Tech Stack

<table>
    <tr>
        <th>Logo</th> <th>Name</th> <th>Description</th>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/proxmox.svg" width="48"></td>
        <td><a href="https://proxmox.com">Proxmox</a></td>
        <td>Virtualization platform</td>
    </tr> <tr>
        <td><img src="https://avatars.githubusercontent.com/u/61287648" width="48">
        <td><a href="https://getfedora.org/server">Fedora Server</a></td>
        <td>Base OS for Kubernetes nodes</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/k3s.svg" width="48">
        <td><a href="https://k3s.io">K3s</a></td>
        <td>Lightweight distribution of Kubernetes</td>
    </tr> <tr>
        <td><img src="https://avatars.githubusercontent.com/u/60239468" width="48">
        <td><a href="https://metallb.org">MetalLB</a></td>
        <td>Bare metal load balancer for Kubernetes</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/kubernetes.svg" width="48">
        <td><a href="https://kubernetes.io">Kubernetes</a></td>
        <td>Container orchestration system</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/fluxcd.svg" width="48">
        <td><a href="https://fluxcd.io">FluxCD</a></td>
        <td>GitOps for apps and infrastructure</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/helm.svg" width="48">
        <td><a href="https://helm.sh">Helm</a></td>
        <td>Kubernetes package manager</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/certmanager.svg" width="48">
        <td><a href="https://cert-manager.io">cert-manager</a></td>
        <td>Cloud native certificate management</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/weaveworks.svg" width="48">
        <td><a href="https://weave.works">Weave GitOps</a></td>
        <td>GitOps dashboard interface</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/traefik-gopher.svg" width="48">
        <td><a href="https://traefik.io">Traefik</a></td>
        <td>Kubernetes ingress controller</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/kubernetes-sigs/external-dns/master/docs/img/external-dns.png" width="48">
        <td><a href="https://github.com/kubernetes-sigs/external-dns">ExternalDNS</a></td>
        <td>Synchronize Kubernetes services with DNS</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/loganmarchione/homelab-svg-assets/main/assets/cloudflare.svg" width="48">
        <td><a href="https://www.cloudflare.com/products/tunnel">Cloudflare</a></td>
        <td>DNS and Tunnel</td>
    </tr> <tr>
        <td><img src="https://raw.githubusercontent.com/toboshii/hajimari/main/assets/logo.png" width="48">
        <td><a href="https://hajimari.io">Hajimari</a></td>
        <td>Simplistic startpage for Kubernetes services</td>
    </tr>
</table>

## Fix tailscale networking

Run on host:

```
echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf

sudo iptables -A FORWARD --in-interface tailscale0 -j ACCEPT
sudo iptables -A FORWARD --out-interface tailscale0 -j ACCEPT
sudo iptables -t nat -A POSTROUTING --source 100.64.0.0/10 --out-interface wlan0 -j MASQUERADE
```
