From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95520] Error when recovering from suspend mode:
 fifo: ce0 engine fault on channel 0
Date: Sun, 05 Jun 2016 23:11:44 +0000
Message-ID: <bug-95520-8800-BufRzwRYel@http.bugs.freedesktop.org/>
References: <bug-95520-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0845299851=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95520-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0845299851==
Content-Type: multipart/alternative; boundary="14651683030.F1cb0.27682";
 charset="UTF-8"


--14651683030.F1cb0.27682
Date: Sun, 5 Jun 2016 23:11:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D95520

--- Comment #1 from Jack Massey <jacknmassey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I am also having this issue.

Environment:
  - Linux kernel 4.4.0-22
  - Desktop encironment: Gnome 3.18.4
  - Xorg 1.18.3
  - Graphics card: NVIDIA Corporation GF119 [NVS 310]

I get a very similar crash error:

Jun  6 08:36:05 jackspc kernel: [235092.854673] nouveau 0000:01:00.0: disp:
outp 00:0006:0342: link training failed
Jun  6 08:36:26 jackspc kernel: [235113.279516] nouveau 0000:01:00.0: fifo:
write fault at 00030b5000 engine 15 [PCE0] client 01 [PCOPY0] reason 02
[PAGE_NOT_PRESENT] on channel 0 [001fe74000 DRM]
Jun  6 08:36:26 jackspc kernel: [235113.279520] nouveau 0000:01:00.0: fifo:=
 ce0
engine fault on channel 0, recovering...

Note that this crash happened immediately after unlocking the screen *not* =
when
waking from sleep, and I am using a 4.4.x Ubuntu kernel.

This issue started happening after I upgraded my Monitors on Friday. I went
from 3x1080p to 2x1440p. Is it possible that the number of pixels / type of
monitor has an effect?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14651683030.F1cb0.27682
Date: Sun, 5 Jun 2016 23:11:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Error when recovering from suspend mode: fifo: ce0 engine=
 fault on channel 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95520#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Error when recovering from suspend mode: fifo: ce0 engine=
 fault on channel 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D95520">bug 95520<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jacknmassey&#64;gmail.com" title=3D"Jack Massey &lt;jacknmassey&#64;gmail.c=
om&gt;"> <span class=3D"fn">Jack Massey</span></a>
</span></b>
        <pre>I am also having this issue.

Environment:
  - Linux kernel 4.4.0-22
  - Desktop encironment: Gnome 3.18.4
  - Xorg 1.18.3
  - Graphics card: NVIDIA Corporation GF119 [NVS 310]

I get a very similar crash error:

Jun  6 08:36:05 jackspc kernel: [235092.854673] nouveau 0000:01:00.0: disp:
outp 00:0006:0342: link training failed
Jun  6 08:36:26 jackspc kernel: [235113.279516] nouveau 0000:01:00.0: fifo:
write fault at 00030b5000 engine 15 [PCE0] client 01 [PCOPY0] reason 02
[PAGE_NOT_PRESENT] on channel 0 [001fe74000 DRM]
Jun  6 08:36:26 jackspc kernel: [235113.279520] nouveau 0000:01:00.0: fifo:=
 ce0
engine fault on channel 0, recovering...

Note that this crash happened immediately after unlocking the screen *not* =
when
waking from sleep, and I am using a 4.4.x Ubuntu kernel.

This issue started happening after I upgraded my Monitors on Friday. I went
from 3x1080p to 2x1440p. Is it possible that the number of pixels / type of
monitor has an effect?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14651683030.F1cb0.27682--

--===============0845299851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0845299851==--
