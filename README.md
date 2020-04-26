# docker_mailcatcher
ローカル環境でメール送信テストをするためにMailCatcherをDockerで構築します。

## MailCatcher
https://mailcatcher.me/

## Version
```bash
# mailcatcher --version
mailcatcher 0.7.1

# docker --version
Docker version 19.03.8, build afacb8b

# docker-compose --version
docker-compose version 1.25.4, build 8d51620a
```

## Usage
※ローカル環境でDockerが使用できる前提です。

1. `Dockerfile` と `docker-compose.yml` を配置したディレクトリで `docker-compose` のビルドと実行
```bash
docker-compose build
docker-compose up
```
または
```bash
docker-compose up --build
```

2. コンソールに以下が出力されます。
```bash
Creating docker_mailcatcher ... done
Attaching to docker_mailcatcher
docker_mailcatcher | Starting MailCatcher
docker_mailcatcher | ==> smtp://0.0.0.0:1025
docker_mailcatcher | ==> http://0.0.0.0:1080/
```

3. ブラウザで `http://localhost:1080` にアクセスすると以下のようなメーラーが表示されます。

![capture1](https://github.com/sakasa/docker_mailcatcher/blob/master/capture1.png)

4. ローカル環境でアプリケーションのメール送信設定（smtp）をホスト `localhost` 、ポート `1025` に設定しメール送信するとMailCatcherでメールが受信できます。

Example. Python
```python
import smtplib
from email.mime.text import MIMEText

to_addr = "test_to@example.com"
from_addr = "test_from@example.com"
message = "ほん<hr>ぶん"

msg = MIMEText(message, "html")
msg["Subject"] = "けんめい"
msg["To"] = to_addr
msg["From"] = from_addr

server = smtplib.SMTP("localhost", 1025)
server.send_message(msg)
server.quit()
```

![capture2](https://github.com/sakasa/docker_mailcatcher/blob/master/capture2.png)



