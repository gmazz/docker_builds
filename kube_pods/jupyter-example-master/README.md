# Jupyter project example

## Build image

Customize ``Dockerfile`` to your needs, build it and push it to registry:
```
IMAGE_NAME=nuada/jupyter-example
REPO_NAME=gitlab.ardigen.com:5000/piotr.radkowski/jupyter-example

docker build -t ${IMAGE_NAME} .
docker tag ${IMAGE_NAME} ${REPO_NAME}:$(date +%F)
docker tag ${REPO_NAME}:$(date +%F) ${REPO_NAME}:latest
docker push ${REPO_NAME}:$(date +%F)
docker push ${REPO_NAME}:latest

```

## Jupyter pod

### Create
Customize Jupyter settings via [environment variables](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/common.html#docker-options) and pod metadata:
```
kubectl create -f jupyter-pod.yml
```

This example uses path `<pv-claim>/my-jupyter-project` mapped to `/home/jupyter` for storing files.

### Connection
To access your pod, forward Jupyter port to your computer:
```
kubectl port-forward my-jupyter-project 8888
```

To get Jupyter token use `logs` command:
```
kubectl logs my-jupyter-project
```

## Object storage

### Storemagic

If you want to persist some objects between sessions you can use [storemagic](http://ipython.readthedocs.io/en/stable/config/extensions/storemagic.html).

### Apache Arrow

If you want to persist Pandas DataFrames (especially large ones!) you can use [Apache Arrow](https://arrow.apache.org/docs/python/) file formats Parquet and Feather.

Install as root:
```
apt-get update && apt-get install libsnappy-dev
pip install pyarrow pandas python-snappy
```

To read Parquet file from Jupyter:
```
import pyarrow.parquet as pq
df = pq.read_table('file.pq').to_pandas()
```
