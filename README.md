# ml-fast-api


# /Users/sorakicuchi/Desktop/martin_ml/Tensorflow/workspace/images/pinzu20230411/LINE_ALBUM_230407_30.jpg


# 仮想環境の切り替え
```
cd /ml-fast-api

# activate
source env/bin/activate.fish

# deactivate
deactivate
```

# requirements.txtの作成
```
cd /ml-fast-api
pip freeze > requirements.txt
```

# ecrへのpush
参照リンク https://docs.aws.amazon.com/ja_jp/AmazonECR/latest/userguide/docker-push-ecr-image.html

ECR認証
```shell
$ aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 590183790791.dkr.ecr.ap-northeast-1.amazonaws.com
```

## image参照
```shell
$ docker images
```

## imageがなければbuild
```shell
$ cd docker
$ docker build -t kokishin-fast-api-image -f ./Dockerfile  ..
```

## tagつける
```shell
$ docker tag <image id> 590183790791.dkr.ecr.ap-northeast-1.amazonaws.com/kokishin-fast-api:latest
```

## pushする
```shell
$ docker push 590183790791.dkr.ecr.ap-northeast-1.amazonaws.com/kokishin-fast-api:latest
```