From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110500] X-Server crashes - GL error:
 GL_OUT_OF_MEMORY in glTexSubImage
Date: Tue, 23 Apr 2019 18:23:13 +0000
Message-ID: <bug-110500-8800-z0NNaf0yYJ@http.bugs.freedesktop.org/>
References: <bug-110500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1642680985=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110500-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1642680985==
Content-Type: multipart/alternative; boundary="15560437930.470a660.1195"
Content-Transfer-Encoding: 7bit


--15560437930.470a660.1195
Date: Tue, 23 Apr 2019 18:23:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110500

--- Comment #2 from wixbisce-jFQLhMmostjmZLV5cmOKUwC/G2K4zDHf@public.gmane.org <wixbisce-jFQLhMmostjmZLV5cmOKUwC/G2K4zDHf@public.gmane.org>=
 ---
The package
https://packages.ubuntu.com/bionic-updates/xserver-xorg-video-nouveau-hwe-1=
8.04
is already installed by default.

I have a /usr/lib/xorg/modules/drivers/nouveau_drv.so file.

lsmod |grep nouveau
nouveau              1851392  21
video                  45056  1 nouveau
i2c_algo_bit           16384  1 nouveau
mxm_wmi                16384  1 nouveau
ttm                   110592  1 nouveau
drm_kms_helper        172032  1 nouveau
drm                   458752  11 drm_kms_helper,ttm,nouveau
wmi                    24576  2 mxm_wmi,nouveau


I dont know how to use something special. I just installed the OS and have =
the
issues i linked. I am using the LTS release for stability.

It crashed already few times.
It crashed few minutes again. Here the last log:

[  4869.797] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[  4869.797] (WW) glamor: Failed to allocate 455x1 FBO due to GL_OUT_OF_MEM=
ORY.
[  4869.797] (WW) glamor: Expect reduced performance.
[  4869.798] (EE)=20
[  4869.798] (EE) Backtrace:
[  4869.798] (EE) 0: /usr/lib/xorg/Xorg (OsLookupColor+0x139) [0x5630e630d4=
59]
[  4869.798] (EE) 1: /lib/x86_64-linux-gnu/libpthread.so.0 (funlockfile+0x5=
0)
[0x7fea4ef6a8df]
[  4869.798] (EE) 2: /usr/lib/xorg/modules/libglamoregl.so
(glamor_get_pixmap_texture+0x7d) [0x7fea4b9c155d]
[  4869.799] (EE) 3: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x78f4) [0x7fea4b9d3644]
[  4869.799] (EE) 4: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7caf) [0x7fea4b9d3d6f]
[  4869.799] (EE) 5: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x8668) [0x7fea4b9d4888]
[  4869.799] (EE) 6: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0xa26f) [0x7fea4b9d807f]
[  4869.799] (EE) 7: /usr/lib/xorg/Xorg (DamageRegionAppend+0x6c6)
[0x5630e6290996]
[  4869.800] (EE) 8: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x1110f) [0x7fea4b9e645f]
[  4869.800] (EE) 9: /usr/lib/xorg/Xorg (AddTraps+0x423d) [0x5630e62895ed]
[  4869.800] (EE) 10: /usr/lib/xorg/Xorg (SendErrorToClient+0x368)
[0x5630e61b0498]
[  4869.800] (EE) 11: /usr/lib/xorg/Xorg (InitFonts+0x3c8) [0x5630e61b4478]
[  4869.800] (EE) 12: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0x=
e7)
[0x7fea4eb81b97]
[  4869.800] (EE) 13: /usr/lib/xorg/Xorg (_start+0x2a) [0x5630e619e13a]
[  4869.800] (EE)=20
[  4869.800] (EE) Segmentation fault at address 0x0
[  4869.800] (EE)=20
Fatal server error:
[  4869.800] (EE) Caught signal 11 (Segmentation fault). Server aborting

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15560437930.470a660.1195
Date: Tue, 23 Apr 2019 18:23:13 +0000
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
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500">bug 11050=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wixbisce&#64;guerrillamail.com" title=3D"wixbisce&#64;guerrillamail.com &lt=
;wixbisce&#64;guerrillamail.com&gt;"> <span class=3D"fn">wixbisce&#64;guerr=
illamail.com</span></a>
</span></b>
        <pre>The package
<a href=3D"https://packages.ubuntu.com/bionic-updates/xserver-xorg-video-no=
uveau-hwe-18.04">https://packages.ubuntu.com/bionic-updates/xserver-xorg-vi=
deo-nouveau-hwe-18.04</a>
is already installed by default.

I have a /usr/lib/xorg/modules/drivers/nouveau_drv.so file.

lsmod |grep nouveau
nouveau              1851392  21
video                  45056  1 nouveau
i2c_algo_bit           16384  1 nouveau
mxm_wmi                16384  1 nouveau
ttm                   110592  1 nouveau
drm_kms_helper        172032  1 nouveau
drm                   458752  11 drm_kms_helper,ttm,nouveau
wmi                    24576  2 mxm_wmi,nouveau


I dont know how to use something special. I just installed the OS and have =
the
issues i linked. I am using the LTS release for stability.

It crashed already few times.
It crashed few minutes again. Here the last log:

[  4869.797] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[  4869.797] (WW) glamor: Failed to allocate 455x1 FBO due to GL_OUT_OF_MEM=
ORY.
[  4869.797] (WW) glamor: Expect reduced performance.
[  4869.798] (EE)=20
[  4869.798] (EE) Backtrace:
[  4869.798] (EE) 0: /usr/lib/xorg/Xorg (OsLookupColor+0x139) [0x5630e630d4=
59]
[  4869.798] (EE) 1: /lib/x86_64-linux-gnu/libpthread.so.0 (funlockfile+0x5=
0)
[0x7fea4ef6a8df]
[  4869.798] (EE) 2: /usr/lib/xorg/modules/libglamoregl.so
(glamor_get_pixmap_texture+0x7d) [0x7fea4b9c155d]
[  4869.799] (EE) 3: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x78f4) [0x7fea4b9d3644]
[  4869.799] (EE) 4: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7caf) [0x7fea4b9d3d6f]
[  4869.799] (EE) 5: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x8668) [0x7fea4b9d4888]
[  4869.799] (EE) 6: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0xa26f) [0x7fea4b9d807f]
[  4869.799] (EE) 7: /usr/lib/xorg/Xorg (DamageRegionAppend+0x6c6)
[0x5630e6290996]
[  4869.800] (EE) 8: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x1110f) [0x7fea4b9e645f]
[  4869.800] (EE) 9: /usr/lib/xorg/Xorg (AddTraps+0x423d) [0x5630e62895ed]
[  4869.800] (EE) 10: /usr/lib/xorg/Xorg (SendErrorToClient+0x368)
[0x5630e61b0498]
[  4869.800] (EE) 11: /usr/lib/xorg/Xorg (InitFonts+0x3c8) [0x5630e61b4478]
[  4869.800] (EE) 12: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0x=
e7)
[0x7fea4eb81b97]
[  4869.800] (EE) 13: /usr/lib/xorg/Xorg (_start+0x2a) [0x5630e619e13a]
[  4869.800] (EE)=20
[  4869.800] (EE) Segmentation fault at address 0x0
[  4869.800] (EE)=20
Fatal server error:
[  4869.800] (EE) Caught signal 11 (Segmentation fault). Server aborting</p=
re>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15560437930.470a660.1195--

--===============1642680985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1642680985==--
