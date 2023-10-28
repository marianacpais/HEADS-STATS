serve-site:
	bundle exec jekyll serve

push:
	git add .
	git commit -m "minor push"
	git push
