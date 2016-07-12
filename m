From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 96737] [NV98] breaks Login / SwitchToGreeter /
	SwitchToUser
Date: Tue, 12 Jul 2016 09:59:17 +0000
Message-ID: <bug-96737-8800-y8EwhuiW1i@http.bugs.freedesktop.org/>
References: <bug-96737-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1160299552=="
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


--===============1160299552==
Content-Type: multipart/alternative; boundary="14683175560.A134Ba24.11367";
 charset="UTF-8"


--14683175560.A134Ba24.11367
Date: Tue, 12 Jul 2016 09:59:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D96737

--- Comment #5 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

VT switching - with disabled acceleration, works


/var/log/Xorg.0.log
Kernel command line: ... nouveau.noaccel=3D1
(EE) NOUVEAU(0): Error initialising acceleration.  Falling back to NoAccel
(**) NOUVEAU(0): [COPY] acceleration disabled

glxinfo:
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.8, 128 bits)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/etc/X11/xorg.conf.d/nouveau.conf
Section "Device"
        Identifier "video0"
        Driver "nouveau"
        Option "NoAccel" "on"
EndSection

/var/log/Xorg.0.log
(**) NOUVEAU(0): Option "NoAccel" "on"
(**) NOUVEAU(0): Acceleration disabled
(**) NOUVEAU(0): [COPY] acceleration disabled

glxinfo:
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.8, 128 bits)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/etc/X11/xorg.conf.d/nouveau.conf
Section "Device"
        Identifier "video0"
        Driver "nouveau"
        Option "AccelMethod" "none"
EndSection

/var/log/Xorg.0.log
(**) NOUVEAU(0): Option "AccelMethod" "none"
(**) NOUVEAU(0): [COPY] acceleration disabled

glxinfo:
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.8, 128 bits)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14683175560.A134Ba24.11367
Date: Tue, 12 Jul 2016 09:59:16 +0000
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
   title=3D"NEW - [NV98] breaks Login / SwitchToGreeter / SwitchToUser"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96737#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV98] breaks Login / SwitchToGreeter / SwitchToUser"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D96737">bug 96737<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>
VT switching - with disabled acceleration, works


/var/log/Xorg.0.log
Kernel command line: ... nouveau.noaccel=3D1
(EE) NOUVEAU(0): Error initialising acceleration.  Falling back to NoAccel
(**) NOUVEAU(0): [COPY] acceleration disabled

glxinfo:
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.8, 128 bits)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/etc/X11/xorg.conf.d/nouveau.conf
Section &quot;Device&quot;
        Identifier &quot;video0&quot;
        Driver &quot;nouveau&quot;
        Option &quot;NoAccel&quot; &quot;on&quot;
EndSection

/var/log/Xorg.0.log
(**) NOUVEAU(0): Option &quot;NoAccel&quot; &quot;on&quot;
(**) NOUVEAU(0): Acceleration disabled
(**) NOUVEAU(0): [COPY] acceleration disabled

glxinfo:
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.8, 128 bits)

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

/etc/X11/xorg.conf.d/nouveau.conf
Section &quot;Device&quot;
        Identifier &quot;video0&quot;
        Driver &quot;nouveau&quot;
        Option &quot;AccelMethod&quot; &quot;none&quot;
EndSection

/var/log/Xorg.0.log
(**) NOUVEAU(0): Option &quot;AccelMethod&quot; &quot;none&quot;
(**) NOUVEAU(0): [COPY] acceleration disabled

glxinfo:
OpenGL renderer string: Gallium 0.4 on llvmpipe (LLVM 3.8, 128 bits)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14683175560.A134Ba24.11367--

--===============1160299552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1160299552==--
