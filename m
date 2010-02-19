From: Arvind R <arvino55-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nouveau on xen dom0 working!
Date: Fri, 19 Feb 2010 14:41:17 +0530
Message-ID: <d799c4761002190111n7cf390baof5955af21b3c64a6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1679388950=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1679388950==
Content-Type: multipart/alternative; boundary=000e0cd2e08e5723de047ff07784

--000e0cd2e08e5723de047ff07784
Content-Type: text/plain; charset=ISO-8859-1

Hi all,
Some good news on my first post to this list - git20100218 backport of mesa,
drm, xorg, nouveau (kernel and xf86)
and xen-testing finally enabled me to get Xorg on 2.6.31.6-xen kernel dom0!
Clean VT switches at last on dom0.
Clean (self-built) debian packages used for all components.

Now the bad news. Had to scour the net for some drm and ttm patches. Have to
disable acceleration on
xf86-nouveau driver. So glxgears reports a measly 180 fps - but VERY stable
(24 hours).

The graphics card is GeForce 9400 GT.
With acceleration enabled, syslog is OK with
 - Allocating FIFO number 2
 - nouveau_channle_alloc: initialised FIFO 2
but Xorg.0.log ends with
 - NOUVEAU(0): Opened GPU channel 2
  but never gets to
 - NOUVEAU(0): [DRI2] Setup complete

BTW, does anyone know what the modesetting_drv.so built in the mesa tree is?
On non-xen boots,
using that instead of xf86-video-nouveau driver reports 3D acceleration
enabled but 2D disabled!
Only noticeable bug is the garbled graphic cursor that hangs aroung even in
the console screens.

Hope this post is not amiss in this list.  Pls. contact me for any info that
would be useful.

Arvind R.

--000e0cd2e08e5723de047ff07784
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,<br>Some good news on my first post to this list - git20100218 backp=
ort of mesa, drm, xorg, nouveau (kernel and xf86)<br>and xen-testing finall=
y enabled me to get Xorg on 2.6.31.6-xen kernel dom0! Clean VT switches at =
last on dom0.<br>
Clean (self-built) debian packages used for all components.<br><br>Now the =
bad news. Had to scour the net for some drm and ttm patches. Have to disabl=
e acceleration on<br>xf86-nouveau driver. So glxgears reports a measly 180 =
fps - but VERY stable (24 hours).<br>
<br>The graphics card is GeForce 9400 GT.<br>With acceleration enabled, sys=
log is OK with <br>=A0- Allocating FIFO number 2<br>=A0- nouveau_channle_al=
loc: initialised FIFO 2<br>but Xorg.0.log ends with<br>=A0- NOUVEAU(0): Ope=
ned GPU channel 2<br>
=A0 but never gets to <br>=A0- NOUVEAU(0): [DRI2] Setup complete<br><br>BTW=
, does anyone know what the modesetting_drv.so built in the mesa tree is? O=
n non-xen boots,<br>using that instead of xf86-video-nouveau driver reports=
 3D acceleration enabled but 2D disabled!<br>
Only noticeable bug is the garbled graphic cursor that hangs aroung even in=
 the console screens.<br><br>Hope this post is not amiss in this list.=A0 P=
ls. contact me for any info that would be useful.<br><br>Arvind R.<br>

--000e0cd2e08e5723de047ff07784--

--===============1679388950==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1679388950==--
