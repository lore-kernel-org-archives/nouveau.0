From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93629] [NVE6] complete system freeze,
 PGRAPH engine fault on channel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]
Date: Thu, 25 Jan 2018 00:30:53 +0000
Message-ID: <bug-93629-8800-hWEtayNDnG@http.bugs.freedesktop.org/>
References: <bug-93629-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0722602206=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93629-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0722602206==
Content-Type: multipart/alternative; boundary="15168402531.CAaC2C3e.7939"
Content-Transfer-Encoding: 7bit


--15168402531.CAaC2C3e.7939
Date: Thu, 25 Jan 2018 00:30:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93629

--- Comment #43 from Bruce <bkorb-P4Gpa63ZLlY@public.gmane.org> ---
"Me, too" Extract from /var/log/kern.log:

    Jan 24 16:07:35 bach kernel: [28972.823404] nouveau 0000:01:00.0: gr: T=
RAP
ch 8 [007f6be000 chrome[2903]]
    Jan 24 16:07:35 bach kernel: [28972.823428] nouveau 0000:01:00.0: gr:
GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_=
REG]
    Jan 24 16:07:35 bach kernel: [28972.823437] nouveau 0000:01:00.0: gr:
GPC0/TPC1/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_=
REG]
    Jan 24 16:07:39 bach kernel: [28977.119555] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
    Jan 24 16:07:39 bach kernel: [28977.119564] nouveau 0000:01:00.0: fifo:=
 gr
engine fault on channel 2, recovering...

The easiest way to reproduce is to leave the computer alone for a while and
more often than not, the KDE desktop will lock up. But it also locked while=
 I
was actively using it about 1/2 hour ago.

I used to be able to ssh in and type "init 4 ; init 5" and successfully res=
tart
KDE. Unfortunately, someone made SSH access tighter recently and I can no
longer do that ("Connection refused").

    $ sr find /lib* /usr/lib* |grep -i nouveau|sed s/'^/    /'
    /lib/modules/4.10.0-42-generic/kernel/drivers/gpu/drm/nouveau
    /lib/modules/4.10.0-42-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
    /lib/modules/4.10.0-35-generic/kernel/drivers/gpu/drm/nouveau
    /lib/modules/4.10.0-35-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
    /lib/modules/4.8.0-53-generic/kernel/drivers/gpu/drm/nouveau
    /lib/modules/4.8.0-53-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
    /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2
    /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.so
    /usr/lib/x86_64-linux-gnu/dri/nouveau_vieux_dri.so
    /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2.0.0
    /usr/lib/xorg/modules/drivers/nouveau_drv.so
    /usr/lib/i386-linux-gnu/libdrm_nouveau.so.2
    /usr/lib/i386-linux-gnu/dri/nouveau_dri.so
    /usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so
    /usr/lib/i386-linux-gnu/libdrm_nouveau.so.2.0.0


    $ sed 's/^/    /' /etc/os-release=20
    NAME=3D"Linux Mint"
    VERSION=3D"18.2 (Sonya)"
    ID=3Dlinuxmint
    ID_LIKE=3Dubuntu
    PRETTY_NAME=3D"Linux Mint 18.2"
    VERSION_ID=3D"18.2"
    HOME_URL=3D"http://www.linuxmint.com/"
    SUPPORT_URL=3D"http://forums.linuxmint.com/"
    BUG_REPORT_URL=3D"http://bugs.launchpad.net/linuxmint/"
    VERSION_CODENAME=3Dsonya
    UBUNTU_CODENAME=3Dxenial

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15168402531.CAaC2C3e.7939
Date: Thu, 25 Jan 2018 00:30:53 +0000
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
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629#c43">Commen=
t # 43</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] complete system freeze, PGRAPH engine fault on cha=
nnel 2, SCHED_ERROR [ CTXSW_TIMEOUT ]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93629">bug 93629<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bkorb&#64;ntp.org" title=3D"Bruce &lt;bkorb&#64;ntp.org&gt;"> <span class=
=3D"fn">Bruce</span></a>
</span></b>
        <pre>&quot;Me, too&quot; Extract from /var/log/kern.log:

    Jan 24 16:07:35 bach kernel: [28972.823404] nouveau 0000:01:00.0: gr: T=
RAP
ch 8 [007f6be000 chrome[2903]]
    Jan 24 16:07:35 bach kernel: [28972.823428] nouveau 0000:01:00.0: gr:
GPC0/TPC0/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_=
REG]
    Jan 24 16:07:35 bach kernel: [28972.823437] nouveau 0000:01:00.0: gr:
GPC0/TPC1/MP trap: global 00000004 [MULTIPLE_WARP_ERRORS] warp 3f000d [OOR_=
REG]
    Jan 24 16:07:39 bach kernel: [28977.119555] nouveau 0000:01:00.0: fifo:
SCHED_ERROR 0a [CTXSW_TIMEOUT]
    Jan 24 16:07:39 bach kernel: [28977.119564] nouveau 0000:01:00.0: fifo:=
 gr
engine fault on channel 2, recovering...

The easiest way to reproduce is to leave the computer alone for a while and
more often than not, the KDE desktop will lock up. But it also locked while=
 I
was actively using it about 1/2 hour ago.

I used to be able to ssh in and type &quot;init 4 ; init 5&quot; and succes=
sfully restart
KDE. Unfortunately, someone made SSH access tighter recently and I can no
longer do that (&quot;Connection refused&quot;).

    $ sr find /lib* /usr/lib* |grep -i nouveau|sed s/'^/    /'
    /lib/modules/4.10.0-42-generic/kernel/drivers/gpu/drm/nouveau
    /lib/modules/4.10.0-42-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
    /lib/modules/4.10.0-35-generic/kernel/drivers/gpu/drm/nouveau
    /lib/modules/4.10.0-35-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
    /lib/modules/4.8.0-53-generic/kernel/drivers/gpu/drm/nouveau
    /lib/modules/4.8.0-53-generic/kernel/drivers/gpu/drm/nouveau/nouveau.ko
    /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2
    /usr/lib/x86_64-linux-gnu/dri/nouveau_dri.so
    /usr/lib/x86_64-linux-gnu/dri/nouveau_vieux_dri.so
    /usr/lib/x86_64-linux-gnu/libdrm_nouveau.so.2.0.0
    /usr/lib/xorg/modules/drivers/nouveau_drv.so
    /usr/lib/i386-linux-gnu/libdrm_nouveau.so.2
    /usr/lib/i386-linux-gnu/dri/nouveau_dri.so
    /usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so
    /usr/lib/i386-linux-gnu/libdrm_nouveau.so.2.0.0


    $ sed 's/^/    /' /etc/os-release=20
    NAME=3D&quot;Linux Mint&quot;
    VERSION=3D&quot;18.2 (Sonya)&quot;
    ID=3Dlinuxmint
    ID_LIKE=3Dubuntu
    PRETTY_NAME=3D&quot;Linux Mint 18.2&quot;
    VERSION_ID=3D&quot;18.2&quot;
    HOME_URL=3D&quot;<a href=3D"http://www.linuxmint.com/">http://www.linux=
mint.com/</a>&quot;
    SUPPORT_URL=3D&quot;<a href=3D"http://forums.linuxmint.com/">http://for=
ums.linuxmint.com/</a>&quot;
    BUG_REPORT_URL=3D&quot;<a href=3D"http://bugs.launchpad.net/linuxmint/"=
>http://bugs.launchpad.net/linuxmint/</a>&quot;
    VERSION_CODENAME=3Dsonya
    UBUNTU_CODENAME=3Dxenial</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15168402531.CAaC2C3e.7939--

--===============0722602206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0722602206==--
