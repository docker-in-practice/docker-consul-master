.PHONY: images

consul.master: consul
	docker build --force-rm -f Dockerfile.build -t consul-build .
	docker run --rm consul-build cat /gopath/bin/consul > consul.master
	chmod +x consul.master
	cp consul.master server/
	cp consul.master agent/

images: consul.master
	docker build --force-rm -f Dockerfile.agent -t dockerinpractice/consul-agent .
	docker build --force-rm -f Dockerfile.server -t dockerinpractice/consul-server .
