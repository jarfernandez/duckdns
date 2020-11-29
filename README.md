# duckdns
Bash script to update IP address in [DuckDNS](https://www.duckdns.org/).

## Configuration

After cloning the repository, all you have to do is rename the `config/update-duckdns-sample.conf` configuration file to `config/update-duckdns.conf` and then edit it to include the domain(s) (separated by commas) and the DuckDNS token that is provided when registering for the service.

## Execution

It is recommended to run the script periodically, for example every 5 minutes, using the cron service. Here is an example crontab configuration:

```bash
*/5 * * * * ~/duckdns/update-duckdns.sh >/dev/null 2>&1
```

## More information

You can get more information at the following links:

- [DuckDNS HTTP API specification](https://www.duckdns.org/spec.jsp)
- [Installation instructions](https://www.duckdns.org/install.jsp)
