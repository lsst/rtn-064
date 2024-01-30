.PHONY:
init:
	pip install tox pre-commit
	pre-commit install

.PHONY:
html: jor.csv
	tox run -e html
	cp jor.csv _build/html

.PHONY:
lint:
	tox run -e lint,linkcheck

.PHONY:
add-author:
	tox run -e add-author

.PHONY:
sync-authors:
	tox run -e sync-authors

.PHONY:
clean:
	rm -rf _build
	rm -rf .technote
	rm -rf .tox



.FORCE:

jor.csv: .FORCE 
	pip install -r operations_milestones/requirements.txt
	( \
                . operations_milestones/venv/bin/activate; \
                python operations_milestones/opsMiles.py -j -q "and filter=23364"  -u ${JIRA_USER} -p ${JIRA_PASSWORD} \
        )
	echo `date` >> index.rst
	echo `date` >> jor.csv

