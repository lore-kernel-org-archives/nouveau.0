From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103202] Tearing with reverse prime (intel primary,
 nouveau secondary)
Date: Wed, 11 Oct 2017 08:58:04 +0000
Message-ID: <bug-103202-8800-OmJ1drtMVp@http.bugs.freedesktop.org/>
References: <bug-103202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0467918139=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103202-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0467918139==
Content-Type: multipart/alternative; boundary="15077122842.aBf8.21176";
 charset="UTF-8"


--15077122842.aBf8.21176
Date: Wed, 11 Oct 2017 08:58:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103202

--- Comment #4 from Michel D=C3=A4nzer <michel-otUistvHUpPR7s880joybQ@public.gmane.org> ---
(In reply to post+fdo from comment #3)
> It seems there is some work on getting synchronization to work with PRIME
> <https://www.x.org/wiki/Events/XDC2016/Program/xdc-2016-prime-sync.pdf>; =
[...]

FWIW, it's possible to avoid tearing between GPUs in a much less complicated
way than that, if the drivers for both GPUs use the ScreenRec::SyncSharedPi=
xmap
hook. You can take a look at xf86-video-amdgpu/ati for an example. (The dri=
ver
of the displaying GPU also needs to separately prevent tearing of the scano=
ut
process itself. xf86-video-amdgpu/ati do this by default for PRIME outputs)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15077122842.aBf8.21176
Date: Wed, 11 Oct 2017 08:58:04 +0000
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
   title=3D"NEW - Tearing with reverse prime (intel primary, nouveau second=
ary)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103202#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Tearing with reverse prime (intel primary, nouveau second=
ary)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103202">bug 10320=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
michel&#64;daenzer.net" title=3D"Michel D=C3=A4nzer &lt;michel&#64;daenzer.=
net&gt;"> <span class=3D"fn">Michel D=C3=A4nzer</span></a>
</span></b>
        <pre>(In reply to post+fdo from <a href=3D"show_bug.cgi?id=3D103202=
#c3">comment #3</a>)
<span class=3D"quote">&gt; It seems there is some work on getting synchroni=
zation to work with PRIME
&gt; &lt;<a href=3D"https://www.x.org/wiki/Events/XDC2016/Program/xdc-2016-=
prime-sync.pdf">https://www.x.org/wiki/Events/XDC2016/Program/xdc-2016-prim=
e-sync.pdf</a>&gt;; [...]</span >

FWIW, it's possible to avoid tearing between GPUs in a much less complicated
way than that, if the drivers for both GPUs use the ScreenRec::SyncSharedPi=
xmap
hook. You can take a look at xf86-video-amdgpu/ati for an example. (The dri=
ver
of the displaying GPU also needs to separately prevent tearing of the scano=
ut
process itself. xf86-video-amdgpu/ati do this by default for PRIME outputs)=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15077122842.aBf8.21176--

--===============0467918139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0467918139==--
