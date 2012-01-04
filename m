From: Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: OpenArena on Linux/SPARC + nouveau
Date: Tue, 3 Jan 2012 23:42:30 -0600
Message-ID: <CAEk2Stm6a9b6BLaD5C4EnTJWhRrXJha5D2C3vsChpFN43T_Jdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1794177061=="
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

--===============1794177061==
Content-Type: multipart/alternative; boundary=e89a8f646aa31c76ec04b5ad488d

--e89a8f646aa31c76ec04b5ad488d
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

I posted a while back about running nouveau on (unmodified) x86 graphics
cards, specifically a GeForce 4000 MX on a Sun Ultra 10 using
Debian/sparc64 (Linux 3.1.0)

Well, I don't know who's patches fixed what, but I was able to finally get
a stable X screen on it!  glxgears showed a few hundred FPS, but glxinfo
segfaulted. I even managed to play OpenArena with some modest FPS for a few
minutes before the system hard froze -- but it was the best 5 minutes ever
;)

There are still some kernel traps of nouveau's DRM initialization and dmesg
appears to be filled with "BUG: Bad page map in process Xorg", but I'm
happy to say that there has been a lot of progress for SPARC, whether
intentional or not. ;)

I'd be happy to provide whatever logs I can if anyone is interested.

Patrick

--e89a8f646aa31c76ec04b5ad488d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi all,<br><br>I posted a while back about running nouveau on (unmodified) =
x86 graphics cards, specifically a GeForce 4000 MX on a Sun Ultra 10 using =
Debian/sparc64 (Linux 3.1.0)<br><br>Well, I don&#39;t know who&#39;s patche=
s fixed what, but I was able to finally get a stable X screen on it!=A0 glx=
gears showed a few hundred FPS, but glxinfo segfaulted. I even managed to p=
lay OpenArena with some modest FPS for a few minutes before the system hard=
 froze -- but it was the best 5 minutes ever ;)<br>

<br>There are still some kernel traps of nouveau&#39;s DRM initialization a=
nd dmesg appears to be filled with &quot;BUG: Bad page map in process Xorg&=
quot;, but I&#39;m happy to say that there has been a lot of progress for S=
PARC, whether intentional or not. ;)<br>
<br>I&#39;d be happy to provide whatever logs I can if anyone is interested=
.<br><br>Patrick<br>

--e89a8f646aa31c76ec04b5ad488d--

--===============1794177061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1794177061==--
