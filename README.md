# XFM-Mopidy
This Docker file is use by Radio XFM (Denmark) to stream music from online sources to a Icecast server

## How to build Docker file
```shell
cd xfm-mopidy
Docker build --tag xfm-mopidy:latest .
```

## How to run
```shell
Docker run -p 6600:6600 -p 6680:6680 xfm-mopidy:latest
```

## Links
Mopidy: https://www.mopidy.com/