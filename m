From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 13778] New: DMA queue hang Class 0x0397 Mthd 1808,
	FX5600
Date: Sat, 22 Dec 2007 03:59:06 -0800 (PST)
Message-ID: <bug-13778-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=13778

           Summary: DMA queue hang Class 0x0397 Mthd 1808, FX5600
           Product: xorg
           Version: unspecified
          Platform: Other
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: xake-ca8b1Tj3MiseIZ0/mPfg9Q@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


After playing around with rotation on my NV31 (drivers rebuilt today from
latest git) I got and DMA-queue hang. It occured while I was minimizing windows
to a panel in gnome. The pixture froze (the mouse still moving) and gdm
restarted X.
The intresting part here may be that when I reached the loginscreen I had the
same problems as before the fix for NV31 with missing fonts.
A "sudo /etc/ini.d/xdm restart" was needed for that to fix itself. Starting
firefox-3 and starting to typ bugzill.. it hang again (could be due to the
massive graphics in firefox-3s history-bar).

Both where Class 0x0397 and Mthd 1808... dmesg one crash (identical dmesg) is
attached with Xlog from both.

xorg-server-1.4.0.90
mesa, x11-drm, libdrm and nouveau fresh from git.

Portage 2.1.4_rc10 (default-linux/x86/2007.0/desktop, gcc-4.2.2, glibc-2.7-r1,
2.6.23-gentoo-r4 i686)
=================================================================
System uname: 2.6.23-gentoo-r4 i686 Intel(R) Pentium(R) 4 CPU 2.80GHz
Timestamp of tree: Sat, 22 Dec 2007 10:30:06 +0000
distcc 2.18.3 i686-pc-linux-gnu (protocols 1 and 2) (default port 3632)
[disabled]
ccache version 2.4 [enabled]
app-shells/bash:     3.2_p17-r1
dev-java/java-config: 1.3.7, 2.1.3
dev-lang/python:     2.5.1-r4
dev-util/ccache:     2.4-r7
sys-apps/baselayout: 2.0.0_rc6
sys-apps/sandbox:    1.2.18.1-r2
sys-devel/autoconf:  2.13, 2.61-r1
sys-devel/automake:  1.5, 1.7.9-r1, 1.8.5-r3, 1.9.6-r2, 1.10
sys-devel/binutils:  2.18-r1
sys-devel/gcc-config: 1.4.0-r4
sys-devel/libtool:   1.5.24
virtual/os-headers:  2.6.23-r2
ACCEPT_KEYWORDS="x86 ~x86"
CBUILD="i686-pc-linux-gnu"
CFLAGS="-march=native -pipe -O2 -ggdb -fforce-addr"
CHOST="i686-pc-linux-gnu"
CONFIG_PROTECT="/etc"
CONFIG_PROTECT_MASK="/etc/env.d /etc/env.d/java/ /etc/fonts/fonts.conf
/etc/gconf /etc/gentoo-release /etc/revdep-rebuild /etc/splash /etc/terminfo
/etc/texmf/web2c /etc/udev/rules.d"
CXXFLAGS="-march=native -pipe -O2 -ggdb -fforce-addr"
DISTDIR="/usr/portage/distfiles"
FEATURES="ccache distlocks parallel-fetch sandbox sfperms splitdebug strict
test unmerge-orphans userfetch"
GENTOO_MIRRORS="ftp://ftp.sunet.se/pub/os/Linux/distributions/gentoo"
LANG="sv_SE.UTF-8"
LC_ALL="sv_SE.UTF-8"
LINGUAS="sv_SE.UTF-8"
MAKEOPTS="-j3"
PKGDIR="/usr/portage/packages"
PORTAGE_RSYNC_OPTS="--recursive --links --safe-links --perms --times --compress
--force --whole-file --delete --delete-after --stats --timeout=180
--exclude=/distfiles --exclude=/local --exclude=/packages
--filter=H_**/files/digest-*"
PORTAGE_TMPDIR="/var/tmp"
PORTDIR="/usr/portage"
PORTDIR_OVERLAY="/usr/portage/local/layman/nouveau
/usr/portage/local/layman/gnome-experimental /usr/portage/local/layman/mozilla
/usr/local/overlays/portage"
SYNC="rsync://rsync.gentoo.org/gentoo-portage"
USE="X a52 aac acl acpi aiglx alsa amr amrnb amrwb asf audioscrobbler avahi
bash bash-completion berkdb bitmap-fonts bogofilter branding bzip2 cairo
cdaudio cddb cdr cli cracklib crypt cups curl dbus debug device-mapper
disk-partition divx dpms dri dts dvd dvdnav dvdr dvdread eds eiglx emboss
encode etcproposals evo evolution exif fam fat fbcondecor ffmpeg firefox flac
fortran freetype ftp galago gd gdbm gedit gif gimp glib glitz glsa gmedia gmp
gnome gnutls gpm gsf gstreamer gtk gtk2 gtkhtml hal hpn iconv icu inotify ipv6
irda irmc isdnlog ithreads java jikes joystick jpeg kerberos keyring keyutils
kqemu lcms ldap libnotify libofa libsexy lm_sensors logrotate mad matroska
maxoptimization mdnsresponder-compat midi mikmod mmx mng mono moznocompose
moznoirc moznomail mp3 mpeg msn mudflap musepack musicbrainz nautilus ncurses
network network-cron newspr nfs nls nntp nptl nptlonly ntp numeric obex
offensive ogg opengl openmp pam pcre pdf perl physfs pic pidgin png policykit
pppd print pulseaudio python qa qt3support quicktime rar readline real
realmedia reflection rsvg rtc samba scanner sdl sensord session slang smp sou
sound sox spamassasin spell spf spl sqlite sqlite3 srt sse sse2 ssh ssl
startup-notification subtitles svg syslog tagwriting tcltk tcpd test theora
threads tiff tracker truetype truetype-fonts tth type1-fonts unicode usb
userlocales utf8 vorbis win32codecs wma wmf wmp wnck wv wxwindows x264 x86
xattr xcb xinerama xinetd xml xml2 xorg xosd xprint xulrunner xv xvid zeroconf
zlib" ALSA_CARDS="emu10k1 intel8x0 usb-audio" ALSA_PCM_PLUGINS="adpcm alaw asym
copy dmix dshare dsnoop empty extplug file hooks iec958 ioplug ladspa lfloat
linear meter mulaw multi null plug rate route share shm softvol"
APACHE2_MODULES="actions alias auth_basic authn_alias authn_anon authn_dbm
authn_default authn_file authz_dbm authz_default authz_groupfile authz_host
authz_owner authz_user autoindex cache dav dav_fs dav_lock deflate dir
disk_cache env expires ext_filter file_cache filter headers include info
log_config logio mem_cache mime mime_magic negotiation rewrite setenvif speling
status unique_id userdir usertrack vhost_alias" ELIBC="glibc"
INPUT_DEVICES="keyboard mouse" KERNEL="linux" LCD_DEVICES="bayrad cfontz
cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text" LINGUAS="sv_SE.UTF-8"
USERLAND="GNU" VIDEO_CARDS="nouveau vesa"
Unset:  CPPFLAGS, CTARGET, EMERGE_DEFAULT_OPTS, INSTALL_MASK, LDFLAGS,
PORTAGE_COMPRESS, PORTAGE_COMPRESS_FLAGS, PORTAGE_RSYNC_EXTRA_OPTS


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
