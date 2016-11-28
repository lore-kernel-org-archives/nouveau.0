From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Mon, 28 Nov 2016 10:07:54 +0000
Message-ID: <bug-94990-8800-YApqjV1p1r@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0190516897=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0190516897==
Content-Type: multipart/alternative; boundary="14803276749.36AA7.25087";
 charset="UTF-8"


--14803276749.36AA7.25087
Date: Mon, 28 Nov 2016 10:07:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #100 from Yann Golanski <freedesktop-0sa3Xf22Pasdnm+yROfE0A@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #98)
> To get back to the previous behavior, remove the firmware, or boot
> with nouveau.noaccel=3D1 nouveau.nofbaccel=3D1 which should avoid initial=
izing
> the graphics accel engine. (And hopefully avoid secboot as well, but I'm =
not
> 100% sure.)


Just to be crystal clear: setting the two settings above will boot with X11=
 (so
I can get a gdm login screen and an Xsession=E2=80=A6) but just without any=
 3D
acceleration?

Would this work around work on Fedora 25?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14803276749.36AA7.25087
Date: Mon, 28 Nov 2016 10:07:54 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c100">Comme=
nt # 100</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;kierun.org" title=3D"Yann Golanski &lt;freedesktop&#64;kier=
un.org&gt;"> <span class=3D"fn">Yann Golanski</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D949=
90#c98">comment #98</a>)
<span class=3D"quote">&gt; To get back to the previous behavior, remove the=
 firmware, or boot
&gt; with nouveau.noaccel=3D1 nouveau.nofbaccel=3D1 which should avoid init=
ializing
&gt; the graphics accel engine. (And hopefully avoid secboot as well, but I=
'm not
&gt; 100% sure.)</span >


Just to be crystal clear: setting the two settings above will boot with X11=
 (so
I can get a gdm login screen and an Xsession=E2=80=A6) but just without any=
 3D
acceleration?

Would this work around work on Fedora 25?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14803276749.36AA7.25087--

--===============0190516897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0190516897==--
