From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102430] nv4x - memory problems when starting
 graphical application - logs included
Date: Sun, 27 Aug 2017 14:08:20 +0000
Message-ID: <bug-102430-8800-oJZr7Tl6Ng@http.bugs.freedesktop.org/>
References: <bug-102430-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0893656335=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102430-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0893656335==
Content-Type: multipart/alternative; boundary="15038429000.e8a1B43.2951";
 charset="UTF-8"


--15038429000.e8a1B43.2951
Date: Sun, 27 Aug 2017 14:08:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102430

--- Comment #1 from caguduzexi-ybJNiJ/GDrisTnJN9+BGXg@public.gmane.org ---
I ran it once again and it froze the whole system, i cant switch any more w=
ith
ctrl+alt+f2 to a tty and the os seems frozen:

[  124.140697] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 048
[  124.158336] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  124.175958] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  124.193576] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  124.639257] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  125.041344] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  126.686025] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  128.221828] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  128.239466] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  130.374073] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  130.391717] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  130.409338] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  130.426954] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  130.444573] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  130.462190] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  130.979494] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  131.167606] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  131.927840] [TTM] Failed to find memory space for buffer 0xffff9e44dd028=
c00
eviction
[  131.935609] [TTM] No space for ffff9e44dd028c00 (1366 pages, 5464K, 5M)
[  131.942220] [TTM]   placement[0]=3D0x00070002 (1)
[  131.946742] [TTM]     has_type: 1
[  131.950048] [TTM]     use_type: 1
[  131.953357] [TTM]     flags: 0x0000000A
[  131.957185] [TTM]     gpu_offset: 0x00000000
[  131.961442] [TTM]     size: 131072
[  131.964835] [TTM]     available_caching: 0x00070000
[  131.969707] [TTM]     default_caching: 0x00010000
[  131.974404] nouveau 0000:08:00.0: supertuxkart[1075]: fail ttm_validate
[  131.981004] nouveau 0000:08:00.0: supertuxkart[1075]: validating bo list
[  131.987700] nouveau 0000:08:00.0: supertuxkart[1075]: validate: -12
[  132.049424] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0010
[LIMIT_COLOR] nstatus 06000000 [BAD_ARGUMENT PROTECTION_FAULT] ch 7 [0018c0=
00
supertuxkart[1075]] subc 7 class 4097 mthd 1d6c data0
[  162.069689] [TTM] Buffer eviction failed
[  162.074217] nouveau 0000:08:00.0: kwin_x11[864]: fail ttm_validate
[  162.080413] nouveau 0000:08:00.0: kwin_x11[864]: validating bo list
[  162.086680] nouveau 0000:08:00.0: kwin_x11[864]: validate: -12
[  177.072978] [TTM] Buffer eviction failed
[  177.093326] [TTM] Failed to find memory space for buffer 0xffff9e44c4a51=
800
eviction
[  177.101060] [TTM] No space for ffff9e44c4a51800 (1366 pages, 5464K, 5M)
[  177.107667] [TTM]   placement[0]=3D0x00070002 (1)
[  177.112185] [TTM]     has_type: 1
[  177.115492] [TTM]     use_type: 1
[  177.118798] [TTM]     flags: 0x0000000A
[  177.122623] [TTM]     gpu_offset: 0x00000000
[  177.126884] [TTM]     size: 131072
[  177.130276] [TTM]     available_caching: 0x00070000
[  177.135142] [TTM]     default_caching: 0x00010000
[  177.139836] nouveau 0000:08:00.0: Xorg[710]: fail ttm_validate
[  177.145653] nouveau 0000:08:00.0: Xorg[710]: validating bo list
[  177.151559] nouveau 0000:08:00.0: Xorg[710]: validate: -12
[  177.221778] [TTM] Failed to find memory space for buffer 0xffff9e44c4a51=
400
eviction
[  177.229566] [TTM] No space for ffff9e44c4a51400 (1366 pages, 5464K, 5M)
[  177.236171] [TTM]   placement[0]=3D0x00070002 (1)
[  177.240690] [TTM]     has_type: 1
[  177.243997] [TTM]     use_type: 1
[  177.247301] [TTM]     flags: 0x0000000A
[  177.251129] [TTM]     gpu_offset: 0x00000000
[  177.255387] [TTM]     size: 131072
[  177.258782] [TTM]     available_caching: 0x00070000
[  177.263647] [TTM]     default_caching: 0x00010000
[  177.268343] nouveau 0000:08:00.0: Xorg[710]: fail ttm_validate
[  177.274164] nouveau 0000:08:00.0: Xorg[710]: validating bo list
[  177.280072] nouveau 0000:08:00.0: Xorg[710]: validate: -12
[  222.412072] [TTM] Failed to find memory space for buffer 0xffff9e44c237b=
800
eviction
[  222.419842] [TTM] No space for ffff9e44c237b800 (1366 pages, 5464K, 5M)
[  222.426445] [TTM]   placement[0]=3D0x00070002 (1)
[  222.430964] [TTM]     has_type: 1
[  222.434271] [TTM]     use_type: 1
[  222.437577] [TTM]     flags: 0x0000000A
[  222.441402] [TTM]     gpu_offset: 0x00000000
[  222.445660] [TTM]     size: 131072
[  222.449053] [TTM]     available_caching: 0x00070000
[  222.453921] [TTM]     default_caching: 0x00010000
[  222.458616] nouveau 0000:08:00.0: Xorg[710]: fail ttm_validate
[  222.464438] nouveau 0000:08:00.0: Xorg[710]: validating bo list
[  222.470343] nouveau 0000:08:00.0: Xorg[710]: validate: -12
[  267.535046] [TTM] Buffer eviction failed

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15038429000.e8a1B43.2951
Date: Sun, 27 Aug 2017 14:08:20 +0000
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
   title=3D"NEW - nv4x - memory problems when starting graphical applicatio=
n - logs included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102430#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv4x - memory problems when starting graphical applicatio=
n - logs included"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102430">bug 10243=
0</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
caguduzexi&#64;go2vpn.net" title=3D"caguduzexi&#64;go2vpn.net">caguduzexi&#=
64;go2vpn.net</a>
</span></b>
        <pre>I ran it once again and it froze the whole system, i cant swit=
ch any more with
ctrl+alt+f2 to a tty and the os seems frozen:

[  124.140697] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 048
[  124.158336] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  124.175958] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  124.193576] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  124.639257] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  125.041344] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  126.686025] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  128.221828] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  128.239466] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  130.374073] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  130.391717] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  130.409338] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  130.426954] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  130.444573] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 04000248
[  130.462190] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 03000248
[  130.979494] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  131.167606] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0002
[DATA_ERROR] nstatus 02000000 [BAD_ARGUMENT] ch 7 [0018c000 supertuxkart[10=
75]]
subc 7 class 4097 mthd 0208 data 02000248
[  131.927840] [TTM] Failed to find memory space for buffer 0xffff9e44dd028=
c00
eviction
[  131.935609] [TTM] No space for ffff9e44dd028c00 (1366 pages, 5464K, 5M)
[  131.942220] [TTM]   placement[0]=3D0x00070002 (1)
[  131.946742] [TTM]     has_type: 1
[  131.950048] [TTM]     use_type: 1
[  131.953357] [TTM]     flags: 0x0000000A
[  131.957185] [TTM]     gpu_offset: 0x00000000
[  131.961442] [TTM]     size: 131072
[  131.964835] [TTM]     available_caching: 0x00070000
[  131.969707] [TTM]     default_caching: 0x00010000
[  131.974404] nouveau 0000:08:00.0: supertuxkart[1075]: fail ttm_validate
[  131.981004] nouveau 0000:08:00.0: supertuxkart[1075]: validating bo list
[  131.987700] nouveau 0000:08:00.0: supertuxkart[1075]: validate: -12
[  132.049424] nouveau 0000:08:00.0: gr: intr 00100000 [ERROR] nsource 0000=
0010
[LIMIT_COLOR] nstatus 06000000 [BAD_ARGUMENT PROTECTION_FAULT] ch 7 [0018c0=
00
supertuxkart[1075]] subc 7 class 4097 mthd 1d6c data0
[  162.069689] [TTM] Buffer eviction failed
[  162.074217] nouveau 0000:08:00.0: kwin_x11[864]: fail ttm_validate
[  162.080413] nouveau 0000:08:00.0: kwin_x11[864]: validating bo list
[  162.086680] nouveau 0000:08:00.0: kwin_x11[864]: validate: -12
[  177.072978] [TTM] Buffer eviction failed
[  177.093326] [TTM] Failed to find memory space for buffer 0xffff9e44c4a51=
800
eviction
[  177.101060] [TTM] No space for ffff9e44c4a51800 (1366 pages, 5464K, 5M)
[  177.107667] [TTM]   placement[0]=3D0x00070002 (1)
[  177.112185] [TTM]     has_type: 1
[  177.115492] [TTM]     use_type: 1
[  177.118798] [TTM]     flags: 0x0000000A
[  177.122623] [TTM]     gpu_offset: 0x00000000
[  177.126884] [TTM]     size: 131072
[  177.130276] [TTM]     available_caching: 0x00070000
[  177.135142] [TTM]     default_caching: 0x00010000
[  177.139836] nouveau 0000:08:00.0: Xorg[710]: fail ttm_validate
[  177.145653] nouveau 0000:08:00.0: Xorg[710]: validating bo list
[  177.151559] nouveau 0000:08:00.0: Xorg[710]: validate: -12
[  177.221778] [TTM] Failed to find memory space for buffer 0xffff9e44c4a51=
400
eviction
[  177.229566] [TTM] No space for ffff9e44c4a51400 (1366 pages, 5464K, 5M)
[  177.236171] [TTM]   placement[0]=3D0x00070002 (1)
[  177.240690] [TTM]     has_type: 1
[  177.243997] [TTM]     use_type: 1
[  177.247301] [TTM]     flags: 0x0000000A
[  177.251129] [TTM]     gpu_offset: 0x00000000
[  177.255387] [TTM]     size: 131072
[  177.258782] [TTM]     available_caching: 0x00070000
[  177.263647] [TTM]     default_caching: 0x00010000
[  177.268343] nouveau 0000:08:00.0: Xorg[710]: fail ttm_validate
[  177.274164] nouveau 0000:08:00.0: Xorg[710]: validating bo list
[  177.280072] nouveau 0000:08:00.0: Xorg[710]: validate: -12
[  222.412072] [TTM] Failed to find memory space for buffer 0xffff9e44c237b=
800
eviction
[  222.419842] [TTM] No space for ffff9e44c237b800 (1366 pages, 5464K, 5M)
[  222.426445] [TTM]   placement[0]=3D0x00070002 (1)
[  222.430964] [TTM]     has_type: 1
[  222.434271] [TTM]     use_type: 1
[  222.437577] [TTM]     flags: 0x0000000A
[  222.441402] [TTM]     gpu_offset: 0x00000000
[  222.445660] [TTM]     size: 131072
[  222.449053] [TTM]     available_caching: 0x00070000
[  222.453921] [TTM]     default_caching: 0x00010000
[  222.458616] nouveau 0000:08:00.0: Xorg[710]: fail ttm_validate
[  222.464438] nouveau 0000:08:00.0: Xorg[710]: validating bo list
[  222.470343] nouveau 0000:08:00.0: Xorg[710]: validate: -12
[  267.535046] [TTM] Buffer eviction failed</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15038429000.e8a1B43.2951--

--===============0893656335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0893656335==--
