From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99922] [NVE4] [regression,
 bisected] 4.10 (atomic): X shows black screen with cursor after
 monitors turn off
Date: Mon, 27 Feb 2017 12:43:22 +0000
Message-ID: <bug-99922-8800-EhWP0BYJkL@http.bugs.freedesktop.org/>
References: <bug-99922-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0986237941=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99922-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0986237941==
Content-Type: multipart/alternative; boundary="14881994010.b024655d.22861";
 charset="UTF-8"


--14881994010.b024655d.22861
Date: Mon, 27 Feb 2017 12:43:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99922

--- Comment #7 from bastian.beischer-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org ---
I can confirm this problem. I'm using nouveau on a "NVIDIA Corporation GT20=
0b
[GeForce GTX 285]" GPU. I'm not using DRI3 either:

$ grep DRI /var/log/Xorg.0.log
[    14.197] (=3D=3D) NOUVEAU(0): Allowed maximum DRI level 2.
[    14.350] (=3D=3D) NOUVEAU(G0): Allowed maximum DRI level 2.
[    14.426] (II) NOUVEAU(G0): [DRI2] Setup complete
[    14.426] (II) NOUVEAU(G0): [DRI2]   DRI driver: nouveau
[    14.426] (II) NOUVEAU(G0): [DRI2]   VDPAU driver: nouveau
[    14.443] (II) NOUVEAU(0): [DRI2] Setup complete
[    14.443] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    14.443] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    14.598] (II) GLX: Initialized DRI2 GL provider for screen 0

$ LIBGL_DEBUG=3Dverbose glxinfo 2>&1 | grep DRI
libGL: Using DRI2 for screen 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14881994010.b024655d.22861
Date: Mon, 27 Feb 2017 12:43:21 +0000
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
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE4] [regression, bisected] 4.10 (atomic): X shows blac=
k screen with cursor after monitors turn off"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99922">bug 99922<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bastian.beischer&#64;rwth-aachen.de" title=3D"bastian.beischer&#64;rwth-aac=
hen.de">bastian.beischer&#64;rwth-aachen.de</a>
</span></b>
        <pre>I can confirm this problem. I'm using nouveau on a &quot;NVIDI=
A Corporation GT200b
[GeForce GTX 285]&quot; GPU. I'm not using DRI3 either:

$ grep DRI /var/log/Xorg.0.log
[    14.197] (=3D=3D) NOUVEAU(0): Allowed maximum DRI level 2.
[    14.350] (=3D=3D) NOUVEAU(G0): Allowed maximum DRI level 2.
[    14.426] (II) NOUVEAU(G0): [DRI2] Setup complete
[    14.426] (II) NOUVEAU(G0): [DRI2]   DRI driver: nouveau
[    14.426] (II) NOUVEAU(G0): [DRI2]   VDPAU driver: nouveau
[    14.443] (II) NOUVEAU(0): [DRI2] Setup complete
[    14.443] (II) NOUVEAU(0): [DRI2]   DRI driver: nouveau
[    14.443] (II) NOUVEAU(0): [DRI2]   VDPAU driver: nouveau
[    14.598] (II) GLX: Initialized DRI2 GL provider for screen 0

$ LIBGL_DEBUG=3Dverbose glxinfo 2&gt;&amp;1 | grep DRI
libGL: Using DRI2 for screen 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14881994010.b024655d.22861--

--===============0986237941==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0986237941==--
