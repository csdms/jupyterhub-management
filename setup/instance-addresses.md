# EC2 instance addresses

Public IP addresses for the EC2 instances I use,
including the JupyterHubs and csdms.io.

| **Instance** | **IP address**
| ---          | ---
| lab          | `54.151.127.133`
| explore      | `52.8.89.49`
| jupyter      | `44.239.190.110`
| frontier     | `35.86.30.205`
| test         | `13.57.91.137`
| csdms.io     | `13.56.97.225`

Connect to a Hub with:
```sh
ssh -i "csdms-jh.pem" USER@IP_ADDRESS
```
where `USER` is `ubuntu` for the Hubs,
and `ec2-user` for csdms.io.
