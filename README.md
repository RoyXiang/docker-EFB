Unofficial Docker image for [EH Forwarder Bot](https://github.com/blueset/ehForwarderBot). Maintained by [Roy Xiang](http://github.com/RoyXiang). Included all officialy maintained channels.

# Supported tags and respective `Dockerfile` links

* `latest` ([Dockerfile](https://github.com/RoyXiang/docker-EFB/blob/master/Dockerfile))
* `dev` ([Dockerfile](https://github.com/RoyXiang/docker-EFB/blob/dev/Dockerfile))

# Get Started

Make sure you have `config.py` in the current working directory.

If you use Telegram as your master channel and do not have a `tgdata.db` backuped. You need to create one first:

```
$ touch tgdata.db
```

Then start a docker container by the following command:

```
$ docker run -d --restart=always \
        --name=ehforwarderbot \
        -v $(pwd)/config.py:/opt/ehForwarderBot/config.py \
        -v $(pwd)/tgdata.db:/opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db \
        royx/docker-efb
```

If an interactive process is needed for authentication (like WeChat), check it in docker logs:

```
$ docker logs ehforwarderbot
```

# Volumes

* `/opt/ehForwarderBot/config.py` - the configuration file for [EH Forwarder Bot](https://github.com/blueset/ehForwarderBot)
* `/opt/ehForwarderBot/plugins/eh_telegram_master/tgdata.db` - the file which holds the link information and message logs

[Official Documentation](https://ehforwarderbot.readthedocs.io)
