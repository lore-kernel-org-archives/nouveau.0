From: rustyBSD <cypherique-DaQTI0RpDDMAvxtiuMwx3w@public.gmane.org>
Subject: [error] xf86-video-nouveau on OpenBSD
Date: Wed, 11 Apr 2012 19:59:49 +0200
Message-ID: <4F85C695.2070008@ymail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1318361308=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1318361308==
Content-Type: multipart/alternative;
 boundary="------------030501030000070005030908"

This is a multi-part message in MIME format.
--------------030501030000070005030908
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,
I'm trying to compile nouveau on OpenBSD, but I always get an error message.

I have already compiled libdrm like this :
echo "/usr/X11R6/share/aclocal" >> /usr/local/share/aclocal/dirlist
./configure --enable-nouveau-experimental-api
make
make install

There wasn't any problem.

Then, I try to compile xf86-video-nouveau with :
./configure
make

But I get this error message :

  CC     nvc0_exa.lo
  CC     nvc0_xv.lo
  CC     drmmode_display.lo
drmmode_display.c: In function 'drmmode_page_flip':
drmmode_display.c:1319: warning: implicit declaration of function
'drmModePageFlip'
drmmode_display.c: In function 'drmmode_screen_init':
drmmode_display.c:1476: error: 'drmEventContext' has no member named
'page_flip_handler'
*** Error code 1

Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau/src (line 448
of Makefile).
*** Error code 1

Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau (line 373 of
Makefile).
*** Error code 1

Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau (line 282 of
Makefile).

Any idea ?Is there anybody who can help me ?

Thanks !

--------------030501030000070005030908
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font face="Overpass">Hi,<br>
      I'm trying to compile nouveau on OpenBSD, but I always get an
      error message.<br>
      <br>
      I have already compiled libdrm like this :<br>
      echo "/usr/X11R6/share/aclocal" &gt;&gt;
      /usr/local/share/aclocal/dirlist<br>
      ./configure --enable-nouveau-experimental-api<br>
      make<br>
      make install<br>
      <br>
      There wasn't any problem.<br>
      <br>
      Then, I try to compile xf86-video-nouveau with :<br>
      ./configure<br>
      make<br>
      <br>
      But I get this error message :<br>
      <br>
      &nbsp; CC&nbsp;&nbsp;&nbsp;&nbsp; nvc0_exa.lo<br>
      &nbsp; CC&nbsp;&nbsp;&nbsp;&nbsp; nvc0_xv.lo<br>
      &nbsp; CC&nbsp;&nbsp;&nbsp;&nbsp; drmmode_display.lo<br>
      drmmode_display.c: In function 'drmmode_page_flip':<br>
      drmmode_display.c:1319: warning: implicit declaration of function
      'drmModePageFlip'<br>
      drmmode_display.c: In function 'drmmode_screen_init':<br>
      drmmode_display.c:1476: error: 'drmEventContext' has no member
      named 'page_flip_handler'<br>
      *** Error code 1<br>
      <br>
      Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau/src
      (line 448 of Makefile).<br>
      *** Error code 1<br>
      <br>
      Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau (line
      373 of Makefile).<br>
      *** Error code 1<br>
      <br>
      Stop in /home/xf86-video-nouveau-0.0.10/xf86-video-nouveau (line
      282 of Makefile).<br>
      <br>
      Any idea ?</font><font face="Overpass"> Is there anybody who can
      help me ?</font><br>
    <font face="Overpass"><br>
      Thanks !<br>
    </font>
  </body>
</html>

--------------030501030000070005030908--

--===============1318361308==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1318361308==--
