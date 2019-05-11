From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110572] Regularly System Crash: (ca. 1 hour) nouveau
 0000:08:00.0: gr: PGRAPH TLB flush idle timeout fail and nouveau
 0000:08:00.0: mmu: ce0 mmu invalidate timeout
Date: Sat, 11 May 2019 19:09:19 +0000
Message-ID: <bug-110572-8800-qOjZqRViwW@http.bugs.freedesktop.org/>
References: <bug-110572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1714828738=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110572-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1714828738==
Content-Type: multipart/alternative; boundary="15576017590.dbd19168.25716"
Content-Transfer-Encoding: 7bit


--15576017590.dbd19168.25716
Date: Sat, 11 May 2019 19:09:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110572

--- Comment #7 from Linux Freak <Linuxfreak-RbZlAiThDcE@public.gmane.org> ---
THE BASIC QUESTIONS
6) The version i use:

The version:

pacman -Si xf86-video-nouveau

Repository      : extra
Name            : xf86-video-nouveau
Version         : 1.0.16-1
Description     : Open Source 3D acceleration driver for nVidia cards
Architecture    : x86_64
URL             : https://nouveau.freedesktop.org/
Licenses        : GPL
Groups          : xorg-drivers
Provides        : None
Depends On      : libsystemd  mesa
Optional Deps   : None
Conflicts With  : xorg-server<1.20  X-ABI-VIDEODRV_VERSION<24=20
X-ABI-VIDEODRV_VERSION>=3D25
Replaces        : None
Download Size   : 84.94 KiB
Installed Size  : 259.00 KiB
Packager        : Andreas Radke <andyrtrNOSPAMarchlinux.org>
Build Date      : Tue Jan 29 17:13:41 2019
Validated By    : MD5 Sum  SHA-256 Sum  Signature

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15576017590.dbd19168.25716
Date: Sat, 11 May 2019 19:09:19 +0000
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
   title=3D"NEW - Regularly System Crash: (ca. 1 hour) nouveau 0000:08:00.0=
: gr: PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0=
 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Regularly System Crash: (ca. 1 hour) nouveau 0000:08:00.0=
: gr: PGRAPH TLB flush idle timeout fail and nouveau 0000:08:00.0: mmu: ce0=
 mmu invalidate timeout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110572">bug 11057=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Linuxfreak&#64;gmx.at" title=3D"Linux Freak &lt;Linuxfreak&#64;gmx.at&gt;">=
 <span class=3D"fn">Linux Freak</span></a>
</span></b>
        <pre>THE BASIC QUESTIONS
6) The version i use:

The version:

pacman -Si xf86-video-nouveau

Repository      : extra
Name            : xf86-video-nouveau
Version         : 1.0.16-1
Description     : Open Source 3D acceleration driver for nVidia cards
Architecture    : x86_64
URL             : <a href=3D"https://nouveau.freedesktop.org/">https://nouv=
eau.freedesktop.org/</a>
Licenses        : GPL
Groups          : xorg-drivers
Provides        : None
Depends On      : libsystemd  mesa
Optional Deps   : None
Conflicts With  : xorg-server&lt;1.20  X-ABI-VIDEODRV_VERSION&lt;24=20
X-ABI-VIDEODRV_VERSION&gt;=3D25
Replaces        : None
Download Size   : 84.94 KiB
Installed Size  : 259.00 KiB
Packager        : Andreas Radke &lt;andyrtrNOSPAMarchlinux.org&gt;
Build Date      : Tue Jan 29 17:13:41 2019
Validated By    : MD5 Sum  SHA-256 Sum  Signature</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--15576017590.dbd19168.25716--

--===============1714828738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1714828738==--
