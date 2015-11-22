From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92961] Xorg freezes (only mouse and ssh are still
	working)
Date: Sun, 22 Nov 2015 23:26:43 +0000
Message-ID: <bug-92961-8800-SjBPVWOW0s@http.bugs.freedesktop.org/>
References: <bug-92961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0045241441=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0045241441==
Content-Type: multipart/alternative; boundary="1448234803.45e84D41.23860"; charset="UTF-8"


--1448234803.45e84D41.23860
Date: Sun, 22 Nov 2015 23:26:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D92961

--- Comment #3 from Viorel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu <rapiteanu=
.catalin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to ruben from comment #0)
> Created attachment 119677 [details]
> dmesg output from boot onwards
>=20
> The desktop freezes consistently after a few minutes using the nouveau
> driver.
>=20
> Only the mouse can still be used. The system is still fully  operational =
and
> reachable via ssh.

I have the same behaviour on a Latitude e6420 with NVIDIA Corporation GF119M
[NVS 4200M] GPU.

> Have you noticed anything that may cause the freeze, like starting a brow=
ser,=20
> running some OpenGL application, or even some fancy compositor animation?

No. The crashes happen at random intervals. Most of the time there isn't any
intensive application opened when it happens. Regarding the compositor, in =
my
case, the freeze happens even if there isn't any actively used.
The software versions I'm using are:
xf86-video-nouveau 1.0.11+31+g1ff13a9
mesa 11.0.6
xorg-server 1.18.0
plasma-workspace 5.4.95 (happened with a stable version as well 5.4.3)

If you connect via ssh, you can see on the dmesg can be seen the following
error:
> nouveau E[   PFIFO][0000:01:00.0] INTR 0x00800000
most of the time preceaded by:
> nouveau W[   PFIFO][0000:01:00.0] INTR 0x01000000: 0x00000005

Also the full trace of this failure can be observed on the Xorg log.
I've attached all logs on the raported 'Bug 71659'.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1448234803.45e84D41.23860
Date: Sun, 22 Nov 2015 23:26:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961">bug 92961<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rapiteanu.catalin&#64;gmail.com" title=3D"Viorel-C=C4=83t=C4=83lin R=C4=83p=
i=C8=9Beanu &lt;rapiteanu.catalin&#64;gmail.com&gt;"> <span class=3D"fn">Vi=
orel-C=C4=83t=C4=83lin R=C4=83pi=C8=9Beanu</span></a>
</span></b>
        <pre>(In reply to ruben from <a href=3D"show_bug.cgi?id=3D92961#c0"=
>comment #0</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D119677" name=3D"attach_119677" title=3D"dmesg output from boot onwa=
rds">attachment 119677</a> <a href=3D"attachment.cgi?id=3D119677&amp;action=
=3Dedit" title=3D"dmesg output from boot onwards">[details]</a></span>
&gt; dmesg output from boot onwards
&gt;=20
&gt; The desktop freezes consistently after a few minutes using the nouveau
&gt; driver.
&gt;=20
&gt; Only the mouse can still be used. The system is still fully  operation=
al and
&gt; reachable via ssh.</span >

I have the same behaviour on a Latitude e6420 with NVIDIA Corporation GF119M
[NVS 4200M] GPU.

<span class=3D"quote">&gt; Have you noticed anything that may cause the fre=
eze, like starting a browser,=20
&gt; running some OpenGL application, or even some fancy compositor animati=
on?</span >

No. The crashes happen at random intervals. Most of the time there isn't any
intensive application opened when it happens. Regarding the compositor, in =
my
case, the freeze happens even if there isn't any actively used.
The software versions I'm using are:
xf86-video-nouveau 1.0.11+31+g1ff13a9
mesa 11.0.6
xorg-server 1.18.0
plasma-workspace 5.4.95 (happened with a stable version as well 5.4.3)

If you connect via ssh, you can see on the dmesg can be seen the following
error:
<span class=3D"quote">&gt; nouveau E[   PFIFO][0000:01:00.0] INTR 0x0080000=
0</span >
most of the time preceaded by:
<span class=3D"quote">&gt; nouveau W[   PFIFO][0000:01:00.0] INTR 0x0100000=
0: 0x00000005</span >

Also the full trace of this failure can be observed on the Xorg log.
I've attached all logs on the raported '<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVD9] Hangs under load with ![ PFIFO][0000:01:00.0] unha=
ndled status 0x00800000"
   href=3D"show_bug.cgi?id=3D71659">Bug 71659</a>'.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1448234803.45e84D41.23860--

--===============0045241441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0045241441==--
