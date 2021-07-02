# city-bus-docker-starter

## 安装docker环境

```bash
bash install-docker-linux
```

## linux下部署项目

 执行脚本, 自动生成mysql和redis随机密码

  ```bash
    bash docker-compose-up-linux.sh
  ```

## Window下部署项目(docker desktop)

执行脚本, 自动生成mysql和redis随机密码

  ```bash
    bash docker-compose-up-window.sh
  ```

## 手工部署项目

并修改env内初始密码

执行脚本, -d 后台执行

  ```bash
    docker-compose up -d  
  ```

---

## 其他

### 注意事项

```text
★★★ 容器名称不要使用中横线- ★★★
```

### 如何查看配置

```bash
docker-compose config
```

### 如何指定文件启动

```bash
docker-compose -f docker-compose.yml up -d
或
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d
```

### 关闭并删除项目, 谨慎使用

```bash
docker-compose down mysql
```

### 默认开启默认端口

服务名称 | 端口映射
------- | -------
gateway-808 | 0.0.0.0:9010->9010/tcp
gateway-dispatch | 0.0.0.0:8011->8011/tcp
gateway-web | 0.0.0.0:8899->8899/tcp
mysql | 0.0.0.0:9600->3306/tcp, 33060/tcp
redis | 0.0.0.0:9700->6379/tcp
nginx | 0.0.0.0:8080->80/tcp