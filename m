From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 106794] New: Driver crash while browsing with chrome
Date: Sun, 03 Jun 2018 12:15:45 +0000
Message-ID: <bug-106794-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1142573840=="
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


--===============1142573840==
Content-Type: multipart/alternative; boundary="15280281451.cdfaaE47.14670"
Content-Transfer-Encoding: 7bit


--15280281451.cdfaaE47.14670
Date: Sun, 3 Jun 2018 12:15:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D106794

            Bug ID: 106794
           Summary: Driver crash while browsing with chrome
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: freedesktop-fkvRmXC7U9Y@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 139986
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D139986&action=3Dedit
Kernel Log

I executed chromium on the secondary gpu (`DRI_PRIME=3D1 chromium`). After =
a bit
of idle time on https://medium.com the system hanged for a bit. `dmesg` sho=
wed
a nouveau driver crash.=20

---- Chromium Log ----
[2245:2245:0603/131810.945660:ERROR:buffer_manager.cc(461)]
[.DisplayCompositor-0x11f68c3ee800]GL ERROR :GL_INVALID_OPERATION :
glBufferData: <- error from previous GL command
[2245:2245:0603/131828.527625:ERROR:buffer_manager.cc(461)]
[.DisplayCompositor-0x11f68c3ee000]GL ERROR :GL_INVALID_OPERATION :
glBufferData: <- error from previous GL command

Exact url was:
https://medium.com/@MaartenSikkema/using-react-redux-and-webpack-with-dotne=
t-core-to-build-a-modern-web-frontend-7e2d091b3ba=20

---- Versions ----
Linux 4.14.47-1-lts #1 SMP Wed May 30 21:09:23 UTC 2018 x86_64 GNU/Linux

extra/libdrm 2.4.92-1 [installed]
extra/mesa 18.0.4-1 [installed]
extra/xf86-video-nouveau 1.0.15-3 (xorg-drivers) [installed]

Chromium: Version 67.0.3396.62 (Official Build) Arch Linux (64-bit)


---- GPU ----
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15280281451.cdfaaE47.14670
Date: Sun, 3 Jun 2018 12:15:45 +0000
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
   title=3D"NEW - Driver crash while browsing with chrome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D106794">106794</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Driver crash while browsing with chrome
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
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
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>freedesktop&#64;254.ch
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D139986=
" name=3D"attach_139986" title=3D"Kernel Log">attachment 139986</a> <a href=
=3D"attachment.cgi?id=3D139986&amp;action=3Dedit" title=3D"Kernel Log">[det=
ails]</a></span>
Kernel Log

I executed chromium on the secondary gpu (`DRI_PRIME=3D1 chromium`). After =
a bit
of idle time on <a href=3D"https://medium.com">https://medium.com</a> the s=
ystem hanged for a bit. `dmesg` showed
a nouveau driver crash.=20

---- Chromium Log ----
[2245:2245:0603/131810.945660:ERROR:buffer_manager.cc(461)]
[.DisplayCompositor-0x11f68c3ee800]GL ERROR :GL_INVALID_OPERATION :
glBufferData: &lt;- error from previous GL command
[2245:2245:0603/131828.527625:ERROR:buffer_manager.cc(461)]
[.DisplayCompositor-0x11f68c3ee000]GL ERROR :GL_INVALID_OPERATION :
glBufferData: &lt;- error from previous GL command

Exact url was:
<a href=3D"https://medium.com/&#64;MaartenSikkema/using-react-redux-and-web=
pack-with-dotnet-core-to-build-a-modern-web-frontend-7e2d091b3ba">https://m=
edium.com/&#64;MaartenSikkema/using-react-redux-and-webpack-with-dotnet-cor=
e-to-build-a-modern-web-frontend-7e2d091b3ba</a>=20

---- Versions ----
Linux 4.14.47-1-lts #1 SMP Wed May 30 21:09:23 UTC 2018 x86_64 GNU/Linux

extra/libdrm 2.4.92-1 [installed]
extra/mesa 18.0.4-1 [installed]
extra/xf86-video-nouveau 1.0.15-3 (xorg-drivers) [installed]

Chromium: Version 67.0.3396.62 (Official Build) Arch Linux (64-bit)


---- GPU ----
01:00.0 VGA compatible controller: NVIDIA Corporation GM107GLM [Quadro M200=
0M]
(rev a2)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15280281451.cdfaaE47.14670--

--===============1142573840==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1142573840==--
