repo=lwabish

default: prepare_typecho update_typecho image push kube_update

prepare_typecho:
	if [ ! -d ./typecho ];then git clone https://github.com/lwabish/typecho.git;fi

update_typecho:
	cd typecho && git pull && cd ..
image:
	docker build -t typecho .

push:
	docker tag typecho ${repo}/typecho
	docker push ${repo}/typecho

kube_update:
	kubectl rollout restart deploy blog