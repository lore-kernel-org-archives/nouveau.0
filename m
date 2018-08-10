From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107537] 4.14+ - Full screen OpenGL applications
 results in black screen
Date: Fri, 10 Aug 2018 16:14:55 +0000
Message-ID: <bug-107537-8800-6MtIKXvb1E@http.bugs.freedesktop.org/>
References: <bug-107537-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0972497180=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107537-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0972497180==
Content-Type: multipart/alternative; boundary="15339176950.58b32b0Ab.9913"
Content-Transfer-Encoding: 7bit


--15339176950.58b32b0Ab.9913
Date: Fri, 10 Aug 2018 16:14:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107537

--- Comment #1 from Erik Karlsson <pilo-dZJkCKxksfnYtjvyW6yDsg@public.gmane.org> ---
Created attachment 141039
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D141039&action=3Dedit
DRM logging with drm.debug=3D30

The thing I find interesting is the line

[drm:drm_atomic_set_mode_for_crtc [drm]] Set [MODE:] for CRTC state
0000000082c49623

where the new mode name should probably be shown, but isn't.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15339176950.58b32b0Ab.9913
Date: Fri, 10 Aug 2018 16:14:55 +0000
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
   title=3D"NEW - 4.14+ - Full screen OpenGL applications results in black =
screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107537#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 4.14+ - Full screen OpenGL applications results in black =
screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107537">bug 10753=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pilo&#64;ayeon.org" title=3D"Erik Karlsson &lt;pilo&#64;ayeon.org&gt;"> <sp=
an class=3D"fn">Erik Karlsson</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D141039=
" name=3D"attach_141039" title=3D"DRM logging with drm.debug=3D30">attachme=
nt 141039</a> <a href=3D"attachment.cgi?id=3D141039&amp;action=3Dedit" titl=
e=3D"DRM logging with drm.debug=3D30">[details]</a></span>
DRM logging with drm.debug=3D30

The thing I find interesting is the line

[drm:drm_atomic_set_mode_for_crtc [drm]] Set [MODE:] for CRTC state
0000000082c49623

where the new mode name should probably be shown, but isn't.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15339176950.58b32b0Ab.9913--

--===============0972497180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0972497180==--
