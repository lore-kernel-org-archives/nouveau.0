From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111371] [NV04] bios OOB on kernel driver
 initialization
Date: Sun, 11 Aug 2019 15:53:19 +0000
Message-ID: <bug-111371-8800-c5TjWkPEyP@http.bugs.freedesktop.org/>
References: <bug-111371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0703253451=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111371-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0703253451==
Content-Type: multipart/alternative; boundary="15655387982.8a0f8C25b.3376"
Content-Transfer-Encoding: 7bit


--15655387982.8a0f8C25b.3376
Date: Sun, 11 Aug 2019 15:53:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111371

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Sounds like there's something weird going on:

[    1.862577] pci 0000:01:00.0: BAR 6: no space for [mem size 0x00010000 p=
ref]
[    1.862592] pci 0000:01:00.0: BAR 6: failed to assign [mem size 0x000100=
00
pref]

So ... question 1: did this ever work, with any kernel?

I'll be honest - I've never actually tried a NV4 (no AGP motherboard here).
Last I tried a NV5 (PCI version), it worked fine. This was some time ago, a=
nd I
can re-check if necessary. However:

[  103.927615] nouveau 0000:01:00.0: pci: failed to acquire agp

is definitely worrying. From the kernel messages, it would appear that the
agpgart support module is loading *after* nouveau. This is not good. Try
compiling nouveau as a module, and ensuring that it loads after the agpgart
module.

Of course, I don't know that this is highly related to the issue at hand --=
 AGP
is for the GPU accessing system memory, which is not necessary to retrieve =
the
VBIOS data.

Please try booting the 4.x kernel with

nouveau.debug=3Dbios=3Ddebug

which might yield more info. Please don't use NvBios=3DPRAMIN when doing th=
is,
and include the full boot log.

You can also use nvagetbios from envytools to fetch using certain methods
(definitely the ones applicable to your hw).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655387982.8a0f8C25b.3376
Date: Sun, 11 Aug 2019 15:53:18 +0000
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
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371">bug 11137=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Sounds like there's something weird going on:

[    1.862577] pci 0000:01:00.0: BAR 6: no space for [mem size 0x00010000 p=
ref]
[    1.862592] pci 0000:01:00.0: BAR 6: failed to assign [mem size 0x000100=
00
pref]

So ... question 1: did this ever work, with any kernel?

I'll be honest - I've never actually tried a NV4 (no AGP motherboard here).
Last I tried a NV5 (PCI version), it worked fine. This was some time ago, a=
nd I
can re-check if necessary. However:

[  103.927615] nouveau 0000:01:00.0: pci: failed to acquire agp

is definitely worrying. From the kernel messages, it would appear that the
agpgart support module is loading *after* nouveau. This is not good. Try
compiling nouveau as a module, and ensuring that it loads after the agpgart
module.

Of course, I don't know that this is highly related to the issue at hand --=
 AGP
is for the GPU accessing system memory, which is not necessary to retrieve =
the
VBIOS data.

Please try booting the 4.x kernel with

nouveau.debug=3Dbios=3Ddebug

which might yield more info. Please don't use NvBios=3DPRAMIN when doing th=
is,
and include the full boot log.

You can also use nvagetbios from envytools to fetch using certain methods
(definitely the ones applicable to your hw).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15655387982.8a0f8C25b.3376--

--===============0703253451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0703253451==--
