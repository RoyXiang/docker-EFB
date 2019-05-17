Unofficial Docker image for [EH Forwarder Bot](https://github.com/blueset/ehForwarderBot). 

# Get Started

### config.yaml

Make sure you have `config.yaml` in the current working directory.

Here is an example `config.yaml` file:
```
master_channel: blueset.telegram
slave_channels:
- blueset.wechat
middlewares:
- catbaron.sticker2img
```

### blueset.telegram/config.yaml

If you use Telegram as your master channel and do not have a `config.yaml` backuped. You need to create one first:

```
$ mkdir blueset.telegram
$ touch blueset.telegram/config.yaml
```
Here is an example `blueset.telegram/config.yaml` file:

```
token: "Telegram Bot's token"
admins:
 - Your Telegram User ID
```

Then start a docker container by the following command:

```
$ docker run -d --restart=always \
        --name efbv2 \
        -v $(pwd):/root/.ehforwarderbot/profiles/default/ \
        scavin/docker-efbv2
```

If an interactive process is needed for authentication (like WeChat), check it in docker logs:

```
$ docker logs efbv2
```

[Official Documentation](https://ehforwarderbot.readthedocs.io/en/latest/)
