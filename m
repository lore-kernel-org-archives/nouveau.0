From: younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: nouveaufb problems with NV18
Date: Thu, 10 Mar 2011 19:48:11 +0000
Message-ID: <000e0cd488aa1f9936049e26203c@google.com>
References: <20110309200656.23070.qmail@science.horizon.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1444551324=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110309200656.23070.qmail-FT9nftu9LUyCkawlElnc8EEOCMrvLtNR@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1444551324==
Content-Type: multipart/alternative; boundary=000e0cd488aa1f990b049e262039

--000e0cd488aa1f990b049e262039
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes

On , George Spelvin <linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org> wrote:
> I have an NV18 (GeForce4 MX) connected via DVI to a 1920x1080 LCD,

> and when I try to use the nouveau kernel driver, I get a crappy display.



> Thanks in advance to anyone who can help.



> I'm running a recent nouveau git (fa17f241 drm/nv50: fix thinko in vm  
> fault)

> merged with 2.6.38-rc8.



> When the driver loads (it's compiled as a module, so this is after init

> starts), the console shrinks to a 36x90 character box in the upper-left

> corner of the display.



> When the system is busy, the screen "flashes" to the right.

> The console text appears half a screen to the right for a moment.

> It's particularly annoying right after boot, but settles down once the

> system goes quescent.



> The problem is NOT associated with screen updates. I can run "yes"

> and see the problem very little. hdparm -tT, however, makes the screen

> almost unusable during *both* phases.



> Watching during heavy activity, there's a "standard position" to the

> right where the text tends to appear, but there's also lots of "tearing"

> and it appears in multiple positions. Still pretty recognizable as text,

> though; it doesn't seem to change every scanline.



> X is also screwed up; it fails to start with the messages:

> [ 214.714] (II) NOUVEAU(0): Opened GPU channel 1

> [ 214.715] (II) NOUVEAU(0): [DRI2] Setup complete

> [ 214.715] (II) NOUVEAU(0): [DRI2] DRI driver: nouveau_vieux

> [ 214.716] (EE) NOUVEAU(0): Error allocating scanout buffer: 0

> [ 214.716]

> Fatal server error:

> [ 214.716] AddScreen/ScreenInit failed for driver 0



> ... but I figure that's a more advanced problem.



> I've tried and been unhappy with the nouveau driver on this system in

> the past (I remember it coming up but having lots of horizontal lines of

> "snow" on the display), but Debian recently removed the nv driver that

> worked fine for me from its X distribution, so I'm trying again a bit

> harder this time.



> It's a 2 GB Athlon system, small form factor with onboard video.

> lspci -nn gives:

Is there anything at all connected to the other output (referred to as TV-1  
in your log)? You can try disabling TV detection with the tv_disable  
nouveau.ko module parameter if a non-existent TV is somehow being detected.

--000e0cd488aa1f990b049e262039
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On , George Spelvin &lt;linux-gpGsJRJZ3PBBDgjK7y7TUQ@public.gmane.org&gt; wrote:<br />&gt; I have an NV=
18 (GeForce4 MX) connected via DVI to a 1920x1080 LCD,<br />&gt; <br />&gt;=
 and when I try to use the nouveau kernel driver, I get a crappy display.<b=
r />&gt; <br />&gt; <br />&gt; <br />&gt; Thanks in advance to anyone who c=
an help.<br />&gt; <br />&gt; <br />&gt; <br />&gt; I&#39;m running a recen=
t nouveau git (fa17f241 drm/nv50: fix thinko in vm fault)<br />&gt; <br />&=
gt; merged with 2.6.38-rc8.<br />&gt; <br />&gt; <br />&gt; <br />&gt; When=
 the driver loads (it&#39;s compiled as a module, so this is after init<br =
/>&gt; <br />&gt; starts), the console shrinks to a 36x90 character box in =
the upper-left<br />&gt; <br />&gt; corner of the display.<br />&gt; <br />=
&gt; <br />&gt; <br />&gt; When the system is busy, the screen &quot;flashe=
s&quot; to the right.<br />&gt; <br />&gt; The console text appears half a =
screen to the right for a moment.<br />&gt; <br />&gt; It&#39;s particularl=
y annoying right after boot, but settles down once the<br />&gt; <br />&gt;=
 system goes quescent.<br />&gt; <br />&gt; <br />&gt; <br />&gt; The probl=
em is NOT associated with screen updates. =A0I can run &quot;yes&quot;<br /=
>&gt; <br />&gt; and see the problem very little. =A0hdparm -tT, however, m=
akes the screen<br />&gt; <br />&gt; almost unusable during *both* phases.<=
br />&gt; <br />&gt; <br />&gt; <br />&gt; Watching during heavy activity, =
there&#39;s a &quot;standard position&quot; to the<br />&gt; <br />&gt; rig=
ht where the text tends to appear, but there&#39;s also lots of &quot;teari=
ng&quot;<br />&gt; <br />&gt; and it appears in multiple positions. =A0Stil=
l pretty recognizable as text,<br />&gt; <br />&gt; though; it doesn&#39;t =
seem to change every scanline.<br />&gt; <br />&gt; <br />&gt; <br />&gt; X=
 is also screwed up; it fails to start with the messages:<br />&gt; <br />&=
gt; [ =A0 214.714] (II) NOUVEAU(0): Opened GPU channel 1<br />&gt; <br />&g=
t; [ =A0 214.715] (II) NOUVEAU(0): [DRI2] Setup complete<br />&gt; <br />&g=
t; [ =A0 214.715] (II) NOUVEAU(0): [DRI2] =A0 DRI driver: nouveau_vieux<br =
/>&gt; <br />&gt; [ =A0 214.716] (EE) NOUVEAU(0): Error allocating scanout =
buffer: 0<br />&gt; <br />&gt; [ =A0 214.716]<br />&gt; <br />&gt; Fatal se=
rver error:<br />&gt; <br />&gt; [ =A0 214.716] AddScreen/ScreenInit failed=
 for driver 0<br />&gt; <br />&gt; <br />&gt; <br />&gt; ... but I figure t=
hat&#39;s a more advanced problem.<br />&gt; <br />&gt; <br />&gt; <br />&g=
t; I&#39;ve tried and been unhappy with the nouveau driver on this system i=
n<br />&gt; <br />&gt; the past (I remember it coming up but having lots of=
 horizontal lines of<br />&gt; <br />&gt; &quot;snow&quot; on the display),=
 but Debian recently removed the nv driver that<br />&gt; <br />&gt; worked=
 fine for me from its X distribution, so I&#39;m trying again a bit<br />&g=
t; <br />&gt; harder this time.<br />&gt; <br />&gt; <br />&gt; <br />&gt; =
It&#39;s a 2 GB Athlon system, small form factor with onboard video.<br />&=
gt; <br />&gt; lspci -nn gives:<br /><br />Is there anything at all connect=
ed to the other output (referred to as TV-1 in your log)? You can try disab=
ling TV detection with the tv_disable nouveau.ko module parameter if a non-=
existent TV is somehow being detected.
--000e0cd488aa1f990b049e262039--

--===============1444551324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1444551324==--
