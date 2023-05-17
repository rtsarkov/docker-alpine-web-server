#!/usr/bin/env bash

indexer --config /etc/sphinxsearch/sphinx.conf  --rotate --all
searchd --config /etc/sphinxsearch/sphinx.conf --nodetach
#searchd -c /etc/sphinxsearch/sphinx.conf -i bitrix -q 'test'