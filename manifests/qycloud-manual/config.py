#!/usr/bin/python3
# -*- coding: utf-8 -*-

import os
import codecs
from ruamel.yaml import YAML

yaml = YAML()
yaml.indent(mapping=4, sequence=4, offset=2)


def conf_app(f):
    with codecs.open(f, 'r', 'utf-8') as fp:
        app = yaml.load(fp)

    app['is_debug'] = True
    # app['useSSL'] = false

    with open(f, 'w') as data:
        yaml.dump(app, data)


def conf_database(f, mysql_host, mongo_host):
    with codecs.open(f, 'r', 'utf-8') as fp:
        app = yaml.load(fp)

    app['servers']['default']['host'] = mysql_host
    app['servers']['mongodb']['host'] = mongo_host

    with open(f, 'w') as data:
        yaml.dump(app, data)


def conf_queue(f, host):
    with codecs.open(f, 'r', 'utf-8') as fp:
        app = yaml.load(fp)

    app['host'] = host

    with open(f, 'w') as data:
        yaml.dump(app, data)


def conf_redis(f, host):
    with codecs.open(f, 'r', 'utf-8') as fp:
        app = yaml.load(fp)

    port = app['servers']['default'].split(':')[-1]
    app['servers']['default'] = host + ':' + port
    # app['servers']['organization'] = host + ':' + port
    del app['auth']
    del app['servers']['organization']

    with open(f, 'w') as data:
        yaml.dump(app, data)



def main():




if __name__ == '__main__':
    main()
