# $Id: Static.pm,v 1.3 2004-11-20 21:08:22 mitch Exp $
#
# global variables for p0rn-comfort
#
# 2004 (C) by Christian Garbs <mitch@cgarbs.de>
# Licensed under GNU GPL.  See COPYING for details.

use strict;

package Static;

our $PROXY_ADMIN = 'admin';
our $PROXY_CTRL_BASE = 'http://www.cgarbs.de/PROXYCONTROL';
our $PROXY_GET_VERSION = 'get_version';
our $PROXY_LIST_DOWNLOAD = 'list_pics';
our $PROXY_LIST_PICTURE = 'list_downs';
our $PROXY_LIST_THUMB = 'list_thumbs';
our $PROXY_MARK_DOWNLOAD= 'mark_as_download';
our $PROXY_MARK_PICTURE = 'mark_as_pic';
our $PROXY_MARK_THUMB = 'mark_as_thumb';
our $PROXY_SINGLE_PICTURE = 'single_pic';
our $PROXY_SINGLE_THUMB = 'single_thumb';
our $PROXY_UNMARK_DOWNLOAD = 'unmark_as_download';
our $PROXY_UNMARK_PICTURE = 'unmark_as_pic';
our $PROXY_UNMARK_THUMB = 'unmark_as_thumb';
our $VERSION = "0.0.5-dev";

1;
