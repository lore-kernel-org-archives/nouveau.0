From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Sun, 04 Dec 2016 19:49:51 +0000
Message-ID: <bug-94990-8800-bc7HHld738@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1742922965=="
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


--===============1742922965==
Content-Type: multipart/alternative; boundary="14808809900.eAAa46b62.21790";
 charset="UTF-8"


--14808809900.eAAa46b62.21790
Date: Sun, 4 Dec 2016 19:49:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #101 from Bernie Innocenti <bernie-+SBua99wBSpAfugRpC6u6w@public.gmane.org> ---
I tested 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch wi=
th
4.9.0-rc7 and it correctly initializes the console at 3840x2160 @ 30Hz (for
some reason, the 60Hz mode is not detected).

I also tried the patch on top of drm-next (which as of today is still based=
 on
4.9.0-rc5), but all I got a blank screen. This branch has other stability
issues, so it's not necessarily a nouveau regression.

With 4.9.0-rc7, I can start Xorg, but xf86-video-nouveau fails to initializ=
e:

 [   336.771] (II) [drm] nouveau interface version: 1.3.1
 [   336.771] (EE) Unknown chipset: NV124

This is expected, since GM20x acceleration landed after
xf86-video-nouveau-1.0.13. I'll try rebuilding from head and report back.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14808809900.eAAa46b62.21790
Date: Sun, 4 Dec 2016 19:49:50 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c101">Comme=
nt # 101</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bernie&#64;codewiz.org" title=3D"Bernie Innocenti &lt;bernie&#64;codewiz.or=
g&gt;"> <span class=3D"fn">Bernie Innocenti</span></a>
</span></b>
        <pre>I tested 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-siz=
e-ca.patch with
4.9.0-rc7 and it correctly initializes the console at 3840x2160 &#64; 30Hz =
(for
some reason, the 60Hz mode is not detected).

I also tried the patch on top of drm-next (which as of today is still based=
 on
4.9.0-rc5), but all I got a blank screen. This branch has other stability
issues, so it's not necessarily a nouveau regression.

With 4.9.0-rc7, I can start Xorg, but xf86-video-nouveau fails to initializ=
e:

 [   336.771] (II) [drm] nouveau interface version: 1.3.1
 [   336.771] (EE) Unknown chipset: NV124

This is expected, since GM20x acceleration landed after
xf86-video-nouveau-1.0.13. I'll try rebuilding from head and report back.</=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14808809900.eAAa46b62.21790--

--===============1742922965==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1742922965==--
