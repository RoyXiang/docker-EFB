Unofficial Docker image for [EH Forwarder Bot](https://github.com/blueset/ehForwarderBot). Maintained by [Roy Xiang](http://github.com/RoyXiang). Included all officialy maintained channels, updated with the latest master branch.

# Get Started

```
$ docker run -v config.py:/opt/ehForwarderBot/config.py -v tgdata.db:/opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db royx/docker-efb
```

# Volumes

* `/opt/ehForwarderBot/config.py` - the configuration file for [EH Forwarder Bot](https://github.com/blueset/ehForwarderBot)
* `/opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db` - the file which holds the link information and message logs

[Official Documentation](https://ehforwarderbot.readthedocs.io)
