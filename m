From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96737] [NV98] Xsession Login breakage -
 SwitchToGreeter / SwitchToUser related
Date: Fri, 15 Jul 2016 17:14:37 +0000
Message-ID: <bug-96737-8800-SS8pZ8cWrg@http.bugs.freedesktop.org/>
References: <bug-96737-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1875473568=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-96737-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1875473568==
Content-Type: multipart/alternative; boundary="14686028762.eebE20cBa.1792";
 charset="UTF-8"


--14686028762.eebE20cBa.1792
Date: Fri, 15 Jul 2016 17:14:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96737

--- Comment #8 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

w/ modeset sameo

/etc/X11/xorg.conf.d/modeset.conf
Section "Device"
        Identifier "video0"
        Driver "modesetting"
        Option "AccelMethod" "none"
EndSection

/var/log/Xorg.0.log
(**) modeset(0): Option "AccelMethod" "none"

glxinfo:
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.8, 128 bits)


What in Acceleration brakes VT switching?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14686028762.eebE20cBa.1792
Date: Fri, 15 Jul 2016 17:14:36 +0000
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
   title=3D"NEW - [NV98] Xsession Login breakage - SwitchToGreeter / Switch=
ToUser related"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96737#c8">Comment=
 # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV98] Xsession Login breakage - SwitchToGreeter / Switch=
ToUser related"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96737">bug 96737<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>
w/ modeset sameo

/etc/X11/xorg.conf.d/modeset.conf
Section &quot;Device&quot;
        Identifier &quot;video0&quot;
        Driver &quot;modesetting&quot;
        Option &quot;AccelMethod&quot; &quot;none&quot;
EndSection

/var/log/Xorg.0.log
(**) modeset(0): Option &quot;AccelMethod&quot; &quot;none&quot;

glxinfo:
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.8, 128 bits)


What in Acceleration brakes VT switching?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14686028762.eebE20cBa.1792--

--===============1875473568==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1875473568==--
