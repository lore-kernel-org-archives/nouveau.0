From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 105319] DRM: EVO timeout with kernel 4.15.x
Date: Sat, 18 Aug 2018 00:34:33 +0000
Message-ID: <bug-105319-8800-cpvKRKJOfL@http.bugs.freedesktop.org/>
References: <bug-105319-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0070253459=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-105319-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0070253459==
Content-Type: multipart/alternative; boundary="15345524732.3fb1Eb.31916"
Content-Transfer-Encoding: 7bit


--15345524732.3fb1Eb.31916
Date: Sat, 18 Aug 2018 00:34:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105319

Dominik 'Rathann' Mierzejewski <dominik-IZ6Av6enwRKJQ7yn63+t2w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dominik-IZ6Av6enwRKJQ7yn63+t2w@public.gmane.org

--- Comment #22 from Dominik 'Rathann' Mierzejewski <dominik-IZ6Av6enwRKJQ7yn63+t2w@public.gmane.org=
> ---
Looks like I have an affected machine as well. I encountered this when brin=
ging
an old installation (F26) up to date.

dmesg from 4.17.14-102.fc27.x86_64:
[...]
Aug 18 01:58:15 kernel: nouveau 0000:01:00.0: NVIDIA G98 (298480a2)
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: bios: version 62.98.3c.00.44
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: bios: M0203T not found
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: bios: M0203E not matched!
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: fb: 512 MiB DDR2
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 01011323
00010034
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000300
00000028
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 02022312
00020030
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00000000
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00000140
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00002261
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB conn 07: 00000513
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer
copies
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: allocated 1440x900 fb:
0x50000, bo 000000006f9828c3
Aug 18 01:58:28 kernel: fbcon: nouveaufb (fb0) is primary device
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: EVO timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: GPU lockup - switching to
software fbcon
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer
device
Aug 18 01:58:30 kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0
Aug 18 01:58:30 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:32 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:37 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:53 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:59:10 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:59:11 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:59:13 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:59:52 kernel: nouveau 0000:01:00.0: DRM: EVO timeout
Aug 18 02:04:07 kernel: nouveau 0000:01:00.0: DRM: EVO timeout

4.14.x works fine like in S=C3=A9rgio's case. Mine is also a single-screen =
setup
(LVDS-1) with no external outputs connected. There are no errors in Xorg lo=
g.

I believe this is a different bug than
https://bugzilla.redhat.com/show_bug.cgi?id=3D1547037 and patch
https://github.com/skeggsb/nouveau/pull/1/files did not fix this.

S=C3=A9rgio, are you sure the above patch fixes this for you?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15345524732.3fb1Eb.31916
Date: Sat, 18 Aug 2018 00:34:33 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:dominik&#=
64;greysector.net" title=3D"Dominik 'Rathann' Mierzejewski &lt;dominik&#64;=
greysector.net&gt;"> <span class=3D"fn">Dominik 'Rathann' Mierzejewski</spa=
n></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>dominik&#64;greysector.net
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319#c22">Comme=
nt # 22</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - DRM: EVO timeout with kernel 4.15.x"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105319">bug 10531=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dominik&#64;greysector.net" title=3D"Dominik 'Rathann' Mierzejewski &lt;dom=
inik&#64;greysector.net&gt;"> <span class=3D"fn">Dominik 'Rathann' Mierzeje=
wski</span></a>
</span></b>
        <pre>Looks like I have an affected machine as well. I encountered t=
his when bringing
an old installation (F26) up to date.

dmesg from 4.17.14-102.fc27.x86_64:
[...]
Aug 18 01:58:15 kernel: nouveau 0000:01:00.0: NVIDIA G98 (298480a2)
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: bios: version 62.98.3c.00.44
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: bios: M0203T not found
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: bios: M0203E not matched!
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: fb: 512 MiB DDR2
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: TMDS table version 2.0
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB version 4.0
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB outp 00: 01011323
00010034
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB outp 01: 02000300
00000028
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB outp 02: 02022312
00020030
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB conn 00: 00000000
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB conn 01: 00000140
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB conn 02: 00002261
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: DCB conn 07: 00000513
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: MM: using M2MF for buffer
copies
Aug 18 01:58:16 kernel: nouveau 0000:01:00.0: DRM: allocated 1440x900 fb:
0x50000, bo 000000006f9828c3
Aug 18 01:58:28 kernel: fbcon: nouveaufb (fb0) is primary device
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: EVO timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: GPU lockup - switching to
software fbcon
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:28 kernel: nouveau 0000:01:00.0: fb0: nouveaufb frame buffer
device
Aug 18 01:58:30 kernel: [drm] Initialized nouveau 1.3.1 20120801 for
0000:01:00.0 on minor 0
Aug 18 01:58:30 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:32 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:37 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:58:53 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:59:10 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:59:11 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:59:13 kernel: nouveau 0000:01:00.0: DRM: base-0: timeout
Aug 18 01:59:52 kernel: nouveau 0000:01:00.0: DRM: EVO timeout
Aug 18 02:04:07 kernel: nouveau 0000:01:00.0: DRM: EVO timeout

4.14.x works fine like in S=C3=A9rgio's case. Mine is also a single-screen =
setup
(LVDS-1) with no external outputs connected. There are no errors in Xorg lo=
g.

I believe this is a different bug than
<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1547037">https://b=
ugzilla.redhat.com/show_bug.cgi?id=3D1547037</a> and patch
<a href=3D"https://github.com/skeggsb/nouveau/pull/1/files">https://github.=
com/skeggsb/nouveau/pull/1/files</a> did not fix this.

S=C3=A9rgio, are you sure the above patch fixes this for you?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15345524732.3fb1Eb.31916--

--===============0070253459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0070253459==--
