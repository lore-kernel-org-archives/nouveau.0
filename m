From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110500] New: X-Server crashes - GL error:
 GL_OUT_OF_MEMORY in glTexSubImage
Date: Tue, 23 Apr 2019 15:34:49 +0000
Message-ID: <bug-110500-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1116350285=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1116350285==
Content-Type: multipart/alternative; boundary="15560336890.2808f1.31893"
Content-Transfer-Encoding: 7bit


--15560336890.2808f1.31893
Date: Tue, 23 Apr 2019 15:34:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110500

            Bug ID: 110500
           Summary: X-Server crashes - GL error: GL_OUT_OF_MEMORY in
                    glTexSubImage
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: wixbisce-jFQLhMmostjmZLV5cmOKUwC/G2K4zDHf@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I try to convert someone from Windows to Linux. I installed Kubuntu 18.04.2=
 .
Suddenly while using it the screen went black and afterwards i had the login
screen.

cat /var/log/Xorg.0.log.old

[  2309.613] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[  2309.613] (WW) glamor: Failed to allocate 455x25 FBO due to
GL_OUT_OF_MEMORY.
[  2309.613] (WW) glamor: Expect reduced performance.
[  2331.150] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[  2331.150] (EE)=20
[  2331.150] (EE) Backtrace:
[  2331.151] (EE) 0: /usr/lib/xorg/Xorg (OsLookupColor+0x139) [0x561f602bb4=
59]
[  2331.151] (EE) 1: /lib/x86_64-linux-gnu/libpthread.so.0 (funlockfile+0x5=
0)
[0x7fa3b600a8df]
[  2331.151] (EE) 2: /usr/lib/xorg/modules/libglamoregl.so
(glamor_get_pixmap_texture+0x7d) [0x7fa3b2a6155d]
[  2331.152] (EE) 3: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x78f4) [0x7fa3b2a73644]
[  2331.152] (EE) 4: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7caf) [0x7fa3b2a73d6f]
[  2331.152] (EE) 5: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x8668) [0x7fa3b2a74888]
[  2331.152] (EE) 6: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0xa26f) [0x7fa3b2a7807f]
[  2331.152] (EE) 7: /usr/lib/xorg/Xorg (DamageRegionAppend+0x6c6)
[0x561f6023e996]
[  2331.153] (EE) 8: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x1110f) [0x7fa3b2a8645f]
[  2331.153] (EE) 9: /usr/lib/xorg/Xorg (AddTraps+0x423d) [0x561f602375ed]
[  2331.153] (EE) 10: /usr/lib/xorg/Xorg (SendErrorToClient+0x368)
[0x561f6015e498]
[  2331.153] (EE) 11: /usr/lib/xorg/Xorg (InitFonts+0x3c8) [0x561f60162478]
[  2331.154] (EE) 12: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0x=
e7)
[0x7fa3b5c21b97]
[  2331.154] (EE) 13: /usr/lib/xorg/Xorg (_start+0x2a) [0x561f6014c13a]
[  2331.154] (EE)=20
[  2331.154] (EE) Segmentation fault at address 0x0
[  2331.154] (EE)=20
Fatal server error:
[  2331.154] (EE) Caught signal 11 (Segmentation fault). Server aborting


OS: Kubuntu 18.04.2 LTS release.
Hardware: 8GB RAM, Nvidia 9500 passive cooled GPU

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15560336890.2808f1.31893
Date: Tue, 23 Apr 2019 15:34:49 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSub=
Image"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110500">110500</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>X-Server crashes - GL error: GL_OUT_OF_MEMORY in glTexSubImage
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>wixbisce&#64;guerrillamail.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I try to convert someone from Windows to Linux. I installed Ku=
buntu 18.04.2 .
Suddenly while using it the screen went black and afterwards i had the login
screen.

cat /var/log/Xorg.0.log.old

[  2309.613] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[  2309.613] (WW) glamor: Failed to allocate 455x25 FBO due to
GL_OUT_OF_MEMORY.
[  2309.613] (WW) glamor: Expect reduced performance.
[  2331.150] (EE) glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage
[  2331.150] (EE)=20
[  2331.150] (EE) Backtrace:
[  2331.151] (EE) 0: /usr/lib/xorg/Xorg (OsLookupColor+0x139) [0x561f602bb4=
59]
[  2331.151] (EE) 1: /lib/x86_64-linux-gnu/libpthread.so.0 (funlockfile+0x5=
0)
[0x7fa3b600a8df]
[  2331.151] (EE) 2: /usr/lib/xorg/modules/libglamoregl.so
(glamor_get_pixmap_texture+0x7d) [0x7fa3b2a6155d]
[  2331.152] (EE) 3: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x78f4) [0x7fa3b2a73644]
[  2331.152] (EE) 4: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x7caf) [0x7fa3b2a73d6f]
[  2331.152] (EE) 5: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x8668) [0x7fa3b2a74888]
[  2331.152] (EE) 6: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0xa26f) [0x7fa3b2a7807f]
[  2331.152] (EE) 7: /usr/lib/xorg/Xorg (DamageRegionAppend+0x6c6)
[0x561f6023e996]
[  2331.153] (EE) 8: /usr/lib/xorg/modules/libglamoregl.so
(glamor_create_gc+0x1110f) [0x7fa3b2a8645f]
[  2331.153] (EE) 9: /usr/lib/xorg/Xorg (AddTraps+0x423d) [0x561f602375ed]
[  2331.153] (EE) 10: /usr/lib/xorg/Xorg (SendErrorToClient+0x368)
[0x561f6015e498]
[  2331.153] (EE) 11: /usr/lib/xorg/Xorg (InitFonts+0x3c8) [0x561f60162478]
[  2331.154] (EE) 12: /lib/x86_64-linux-gnu/libc.so.6 (__libc_start_main+0x=
e7)
[0x7fa3b5c21b97]
[  2331.154] (EE) 13: /usr/lib/xorg/Xorg (_start+0x2a) [0x561f6014c13a]
[  2331.154] (EE)=20
[  2331.154] (EE) Segmentation fault at address 0x0
[  2331.154] (EE)=20
Fatal server error:
[  2331.154] (EE) Caught signal 11 (Segmentation fault). Server aborting


OS: Kubuntu 18.04.2 LTS release.
Hardware: 8GB RAM, Nvidia 9500 passive cooled GPU</pre>
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

--15560336890.2808f1.31893--

--===============1116350285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1116350285==--
