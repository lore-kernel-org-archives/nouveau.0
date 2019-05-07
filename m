From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] bus: MMIO read of 00000000 FAULT at
 409800 [ TIMEOUT ]
Date: Tue, 07 May 2019 03:26:18 +0000
Message-ID: <bug-100228-8800-Tft95AAQfl@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0697974039=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0697974039==
Content-Type: multipart/alternative; boundary="15571995799.8711ec.3133"
Content-Transfer-Encoding: 7bit


--15571995799.8711ec.3133
Date: Tue, 7 May 2019 03:26:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #33 from krinkodot22-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org ---
The 1050 card has been tripping up Nouveau for me as well, ever since I got=
 my
laptop over a year ago.

Card info:

~$ lspci | grep -E 'VGA|3D'
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 630 (rev 0=
4)
01:00.0 3D controller: NVIDIA Corporation GP107M [GeForce GTX 1050 Mobile] =
(rev
a1)

It's possible to use Intel integrated graphics by using the kernel paramete=
rs
"nomodeset i915.modeset=3D1" or "nouveau.modeset=3D0 i915.modeset=3D1", whi=
ch is what
I've been using. The proprietary Nvidia driver works fine as well, along wi=
th
the kernel parameters that RPMFusion's package adds.

Without modeset parameters, the laptop used to lock up on boot. Lately, not
using modeset parameters has the laptop shut down during the boot process
instead.

For what it's worth, I'll attach the journal of a failed boot that I invoked
recently. The call traces might be the only important parts, but I'll just =
post
the whole thing in case other parts are useful.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571995799.8711ec.3133
Date: Tue, 7 May 2019 03:26:19 +0000
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
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c33">Comme=
nt # 33</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] bus: MMIO read of 00000000 FAULT at 409800 [ TIME=
OUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
krinkodot22&#64;hotmail.com" title=3D"krinkodot22&#64;hotmail.com">krinkodo=
t22&#64;hotmail.com</a>
</span></b>
        <pre>The 1050 card has been tripping up Nouveau for me as well, eve=
r since I got my
laptop over a year ago.

Card info:

~$ lspci | grep -E 'VGA|3D'
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 630 (rev 0=
4)
01:00.0 3D controller: NVIDIA Corporation GP107M [GeForce GTX 1050 Mobile] =
(rev
a1)

It's possible to use Intel integrated graphics by using the kernel paramete=
rs
&quot;nomodeset i915.modeset=3D1&quot; or &quot;nouveau.modeset=3D0 i915.mo=
deset=3D1&quot;, which is what
I've been using. The proprietary Nvidia driver works fine as well, along wi=
th
the kernel parameters that RPMFusion's package adds.

Without modeset parameters, the laptop used to lock up on boot. Lately, not
using modeset parameters has the laptop shut down during the boot process
instead.

For what it's worth, I'll attach the journal of a failed boot that I invoked
recently. The call traces might be the only important parts, but I'll just =
post
the whole thing in case other parts are useful.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571995799.8711ec.3133--

--===============0697974039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0697974039==--
