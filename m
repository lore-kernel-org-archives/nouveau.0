From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111213] VA-API nouveau SIGSEGV and asserts
Date: Wed, 21 Aug 2019 04:36:57 +0000
Message-ID: <bug-111213-8800-c98b8OrmyD@http.bugs.freedesktop.org/>
References: <bug-111213-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1073307808=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111213-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1073307808==
Content-Type: multipart/alternative; boundary="15663622162.3c3374E.4373"
Content-Transfer-Encoding: 7bit


--15663622162.3c3374E.4373
Date: Wed, 21 Aug 2019 04:36:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111213

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |FIXED

--- Comment #18 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I've pushed a change to mesa which disables the compute paths for the video
compositor on nouveau (well, basically just enabled for AMD). Unfortunately=
 it
was relying on AMD-specific features. We probably could have implemented th=
ese,
but the benefits are dubious, so I didn't want to bother...

This also seems to fix the assertion in libdrm, which is probably triggerab=
le
in more general ways, but oh well.

https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D958390a9bf8904522a50f8e=
9c26c50c96179c183

commit 958390a9bf8904522a50f8e9c26c50c96179c183
Author: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Date:   Sat Aug 17 12:13:34 2019 -0400

    gallium/vl: use compute preference for all multimedia, not just blit

    The compute paths in vl are a bit AMD-specific. For example, they (on
    nouveau), try to use a BGRX8 image format, which is not supported.
    Fixing all this is probably possible, but since the compute paths aren't
    in any way better, it's difficult to care.

    Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=3D111213
    Fixes: 9364d66cb7 (gallium/auxiliary/vl: Add video compositor compute
shader render)
    Signed-off-by: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
    Reviewed-by: Marek Ol<C5><A1><C3><A1>k <marek.olsak-5C7GfCeVMHo@public.gmane.org>

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--15663622162.3c3374E.4373
Date: Wed, 21 Aug 2019 04:36:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:imirkin&#=
64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <s=
pan class=3D"fn">Ilia Mirkin</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>FIXED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213#c18">Comme=
nt # 18</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - VA-API nouveau SIGSEGV and asserts"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111213">bug 11121=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I've pushed a change to mesa which disables the compute paths =
for the video
compositor on nouveau (well, basically just enabled for AMD). Unfortunately=
 it
was relying on AMD-specific features. We probably could have implemented th=
ese,
but the benefits are dubious, so I didn't want to bother...

This also seems to fix the assertion in libdrm, which is probably triggerab=
le
in more general ways, but oh well.

<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D958390a9bf89=
04522a50f8e9c26c50c96179c183">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3D958390a9bf8904522a50f8e9c26c50c96179c183</a>

commit 958390a9bf8904522a50f8e9c26c50c96179c183
Author: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.edu">imirkin=
&#64;alum.mit.edu</a>&gt;
Date:   Sat Aug 17 12:13:34 2019 -0400

    gallium/vl: use compute preference for all multimedia, not just blit

    The compute paths in vl are a bit AMD-specific. For example, they (on
    nouveau), try to use a BGRX8 image format, which is not supported.
    Fixing all this is probably possible, but since the compute paths aren't
    in any way better, it's difficult to care.

    Bugzilla: <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - VA-API nouveau SIGSEGV and asserts"
   href=3D"show_bug.cgi?id=3D111213">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111213</a>
    Fixes: 9364d66cb7 (gallium/auxiliary/vl: Add video compositor compute
shader render)
    Signed-off-by: Ilia Mirkin &lt;<a href=3D"mailto:imirkin&#64;alum.mit.e=
du">imirkin&#64;alum.mit.edu</a>&gt;
    Reviewed-by: Marek Ol&lt;C5&gt;&lt;A1&gt;&lt;C3&gt;&lt;A1&gt;k &lt;<a h=
ref=3D"mailto:marek.olsak&#64;amd.com">marek.olsak&#64;amd.com</a>&gt;</pre>
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

--15663622162.3c3374E.4373--

--===============1073307808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1073307808==--
