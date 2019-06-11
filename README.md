Unofficial Docker image for [EH Forwarder Bot](https://github.com/blueset/ehForwarderBot). 

# 从这里开始

## 配置文件格式



```
├── blueset.telegram
│   ├── config.yaml
│   └── tgdata.db *
├── blueset.wechat *
│   ├── wxpy.pkl *
│   └── wxpy_puid.pkl *
├── config.yaml
└── docker-compose.yml **
```
标记 * 号为自动生成的路径和文件，可以不用管它，** 可见最后。

### config.yaml

在当前路径下创建 `config.yaml` 文件

下面是一个拿来可用的 `config.yaml` 示例：
```
master_channel: blueset.telegram
slave_channels:
- blueset.wechat
middlewares:
- catbaron.sticker2img
- filter.FilterMiddleware
```

### blueset.telegram/config.yaml

创建 Telegram 主频道配置文件 `config.yaml` 

```
$ mkdir blueset.telegram
$ touch blueset.telegram/config.yaml
```
下面是需要修改的 `blueset.telegram/config.yaml` 示例文件:

```
token: "Telegram Bot's token"
admins:
 - 你的 Telegram User ID
```

然后运行：

```
$ docker run -d --restart=always \
        --name efbv2 \
        -v $(pwd):/root/.ehforwarderbot/profiles/default/ \
        scavin/docker-efbv2
```

最后，使用下面的命令查看微信二维码：


```
$ docker logs efbv2
```

## 如何使用过滤

选择你要屏蔽的对象，直接回复 ```filter` ``` 即可

## Docker Compose

docker-compose.yml 示例：

```
efbv2:
  image: scavin/docker-efbv2
  container_name: efbv2
  restart: always
  volumes:
    - ./:/root/.ehforwarderbot/profiles/default/ 
 ```

[Official Documentation](https://ehforwarderbot.readthedocs.io/en/latest/)
