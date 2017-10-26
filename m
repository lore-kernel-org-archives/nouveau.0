From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103467] [NVC0/GF108] fifo: read fault at cd90f4d000
 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on
 channel 1 [003fe11000 DRM]
Date: Thu, 26 Oct 2017 14:48:49 +0000
Message-ID: <bug-103467-8800-aAZJ3AtRgp@http.bugs.freedesktop.org/>
References: <bug-103467-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0614917940=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103467-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0614917940==
Content-Type: multipart/alternative; boundary="15090293292.F1edA97.25923";
 charset="UTF-8"


--15090293292.F1edA97.25923
Date: Thu, 26 Oct 2017 14:48:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103467

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Can you grab dmesg from the beginning, and boot with nouveau.debug=3Dtrace?=
 Try
increasing the kernel log buffer, or send it over netconsole or something.

Note that no one has gotten this to work in the past (although few have tri=
ed
with any level of persistence).

I believe at last report, the issue was something to do with the color LUT
being set up wrong, although that's clearly not your present issue.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15090293292.F1edA97.25923
Date: Thu, 26 Oct 2017 14:48:49 +0000
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
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVC0/GF108] fifo: read fault at cd90f4d000 engine 07 [PF=
IFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT] on channel 1 [003fe110=
00 DRM]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103467">bug 10346=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Can you grab dmesg from the beginning, and boot with nouveau.d=
ebug=3Dtrace? Try
increasing the kernel log buffer, or send it over netconsole or something.

Note that no one has gotten this to work in the past (although few have tri=
ed
with any level of persistence).

I believe at last report, the issue was something to do with the color LUT
being set up wrong, although that's clearly not your present issue.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15090293292.F1edA97.25923--

--===============0614917940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0614917940==--
