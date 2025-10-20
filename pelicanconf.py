#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = 'John Doe'
SITENAME = 'Pelican AI Blog'
SITEURL = ''

PATH = 'content'
TIMEZONE = 'America/Toronto'
DEFAULT_LANG = 'en'

THEME = 'theme/theme-dark'
THEME_STATIC_DIR = 'theme'

FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None

ARTICLE_URL = '{category}/{slug}/'
ARTICLE_SAVE_AS = '{category}/{slug}/index.html'
PAGE_URL = '{slug}/'
PAGE_SAVE_AS = '{slug}/index.html'
CATEGORY_URL = 'category/{slug}.html'
CATEGORY_SAVE_AS = 'category/{slug}.html'

MENUITEMS = (
    ('Home', '/'),
    ('Documentation', '/category/documentation.html'),
    ('Tutorial', '/category/tutorial.html'),
)

DEFAULT_PAGINATION = 10
