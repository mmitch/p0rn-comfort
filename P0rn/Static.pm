# $Id: Static.pm,v 1.8 2005-10-30 18:18:32 mitch Exp $
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
our $PROXY_LIST_PIC_DOWN = 'list_picdown';
our $PROXY_LIST_PICTURE = 'list_pics';
our $PROXY_LIST_THUMB_DOWN = 'list_thumbdown';
our $PROXY_LIST_THUMB = 'list_thumbs';
our $PROXY_MARK_PIC_DOWN= 'mark_as_picdown';
our $PROXY_MARK_PICTURE = 'mark_as_pic';
our $PROXY_MARK_THUMB_DOWN = 'mark_as_thumbdown';
our $PROXY_MARK_THUMB = 'mark_as_thumb';
our $PROXY_SINGLE_PICTURE = 'single_pic';
our $PROXY_SINGLE_THUMB = 'single_thumb';
our $PROXY_UNMARK_DOWNLOAD = 'unmark_as_download';
our $PROXY_UNMARK_PICTURE = 'unmark_as_pic';
our $PROXY_UNMARK_THUMB = 'unmark_as_thumb';
our $VERSION = "0.0.5-dev-mysql-experimental";

our $CYAN="\033[36m";
our $GREEN="\033[32m";
our $BLUE="\033[34m";
our $YELLOW="\033[33m";
our $VIOLET="\033[35m";
our $RED="\033[31m";
our $NORMAL="\033[m";


1;
