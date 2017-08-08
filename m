From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101782] GTX1050TI (GP107 / NV137): HDMI output not
	working
Date: Tue, 08 Aug 2017 17:36:54 +0000
Message-ID: <bug-101782-8800-c5o9DtjsGm@http.bugs.freedesktop.org/>
References: <bug-101782-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0570650698=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101782-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0570650698==
Content-Type: multipart/alternative; boundary="15022138141.3B1F9d.22206";
 charset="UTF-8"


--15022138141.3B1F9d.22206
Date: Tue, 8 Aug 2017 17:36:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101782

--- Comment #4 from Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org> ---
Apparently the problem is:

(EE) NOUVEAU(G0): Error creating GPU channel: -19
(EE) NOUVEAU(G0): Error initialising acceleration.  Falling back to NoAccel

in our kernel we are booting with 'noaccel=3D1' that is disabling accelerat=
ion.
But nouveau can't do the prime offload without accel since it uses the copy
engine to copy the framebuffer out.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15022138141.3B1F9d.22206
Date: Tue, 8 Aug 2017 17:36:54 +0000
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
   title=3D"NEW - GTX1050TI (GP107 / NV137): HDMI output not working"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101782#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - GTX1050TI (GP107 / NV137): HDMI output not working"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101782">bug 10178=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carlo&#64;caione.org" title=3D"Carlo Caione &lt;carlo&#64;caione.org&gt;"> =
<span class=3D"fn">Carlo Caione</span></a>
</span></b>
        <pre>Apparently the problem is:

(EE) NOUVEAU(G0): Error creating GPU channel: -19
(EE) NOUVEAU(G0): Error initialising acceleration.  Falling back to NoAccel

in our kernel we are booting with 'noaccel=3D1' that is disabling accelerat=
ion.
But nouveau can't do the prime offload without accel since it uses the copy
engine to copy the framebuffer out.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15022138141.3B1F9d.22206--

--===============0570650698==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0570650698==--
