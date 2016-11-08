From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98631] GPU lock ups when starting GDM, SDDM,
	and Plasma Desktop
Date: Tue, 08 Nov 2016 10:58:14 +0000
Message-ID: <bug-98631-8800-jHC1QUi5PZ@http.bugs.freedesktop.org/>
References: <bug-98631-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1245251648=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98631-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1245251648==
Content-Type: multipart/alternative; boundary="14786026942.beD3.31233";
 charset="UTF-8"


--14786026942.beD3.31233
Date: Tue, 8 Nov 2016 10:58:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98631

--- Comment #4 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Apropos Xfce 4.12, notice two variants of the Xfwm4:

=3D Xfwm4 4.12.3 "released" - Xrender driven compositor,
  it can be run on virtually any machine

$ xfwm4 --version
        ...
        Build configuration and supported features:
        - Render support:                               Yes
        - Embedded compositor:                          Yes


=3D Xfwm4 "not released" - GL(X) driven compositor,
  https://git.xfce.org/xfce/xfwm4/commit/?id=3Dfee08ea
  it can run on NV50 family (Tesla),
  https://nouveau.freedesktop.org/wiki/CodeNames/#NV50
  on e.g. NV30 is slow, i.e. not very useful,
  although it may have to do with the performance of the CPU.

$ xfwm4 --version
        ...
        Build configuration and supported features:
        - Embedded compositor:                          Yes
        - Epoxy support:                                Yes



LightDM GTK+ Greeter (lightdm-gtk-greeter) is not accelerated,
therefore it can be run on virtually any machine.


KF5/KDE5 i.e. KWin also provides two variants of the compositor, GL and XRe=
nder
driven.


One important difference is that Xrender driven compositors aren't tear-fre=
e.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14786026942.beD3.31233
Date: Tue, 8 Nov 2016 10:58:14 +0000
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
   title=3D"NEW - GPU lock ups when starting GDM, SDDM, and Plasma Desktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GPU lock ups when starting GDM, SDDM, and Plasma Desktop"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98631">bug 98631<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>Apropos Xfce 4.12, notice two variants of the Xfwm4:

=3D Xfwm4 4.12.3 &quot;released&quot; - Xrender driven compositor,
  it can be run on virtually any machine

$ xfwm4 --version
        ...
        Build configuration and supported features:
        - Render support:                               Yes
        - Embedded compositor:                          Yes


=3D Xfwm4 &quot;not released&quot; - GL(X) driven compositor,
  <a href=3D"https://git.xfce.org/xfce/xfwm4/commit/?id=3Dfee08ea">https://=
git.xfce.org/xfce/xfwm4/commit/?id=3Dfee08ea</a>
  it can run on NV50 family (Tesla),
  <a href=3D"https://nouveau.freedesktop.org/wiki/CodeNames/#NV50">https://=
nouveau.freedesktop.org/wiki/CodeNames/#NV50</a>
  on e.g. NV30 is slow, i.e. not very useful,
  although it may have to do with the performance of the CPU.

$ xfwm4 --version
        ...
        Build configuration and supported features:
        - Embedded compositor:                          Yes
        - Epoxy support:                                Yes



LightDM GTK+ Greeter (lightdm-gtk-greeter) is not accelerated,
therefore it can be run on virtually any machine.


KF5/KDE5 i.e. KWin also provides two variants of the compositor, GL and XRe=
nder
driven.


One important difference is that Xrender driven compositors aren't tear-fre=
e.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14786026942.beD3.31233--

--===============1245251648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1245251648==--
