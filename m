From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103202] Tearing with reverse prime (intel primary,
 nouveau secondary)
Date: Wed, 11 Oct 2017 09:06:32 +0000
Message-ID: <bug-103202-8800-h5LocdgOyr@http.bugs.freedesktop.org/>
References: <bug-103202-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1795943511=="
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


--===============1795943511==
Content-Type: multipart/alternative; boundary="15077127920.1949fde6c.23397";
 charset="UTF-8"


--15077127920.1949fde6c.23397
Date: Wed, 11 Oct 2017 09:06:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103202

--- Comment #5 from post+fdo-8yesU2pFZgY@public.gmane.org ---
> if the drivers for both GPUs use the ScreenRec::SyncSharedPixmap hook. Yo=
u can take a look at xf86-video-amdgpu/ati for an example. (The driver of t=
he displaying GPU also needs to separately prevent tearing of the scanout p=
rocess itself. xf86-video-amdgpu/ati do this by default for PRIME outputs)

So this would be a matter of patching modesetting to do both of these thing=
s?=20
(I also wouldn't mind using the intel/nouveau Xorg drivers, but I got the
impression that modesetting is actually preferred, at least for newer Intel
cards.)

That talk btw says that modesetting supports both "PRIME sync output slave"=
 and
"PRIME sync output master", which makes me wonder why it is not able to sync
with itself.  Either there's a bug in that (so I should reassign), or the
underlying DRM lacks some support for something (so this bugreport would be=
 in
the right place).  How could I figure that out?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15077127920.1949fde6c.23397
Date: Wed, 11 Oct 2017 09:06:32 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103202#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Tearing with reverse prime (intel primary, nouveau second=
ary)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103202">bug 10320=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
post+fdo&#64;ralfj.de" title=3D"post+fdo&#64;ralfj.de">post+fdo&#64;ralfj.d=
e</a>
</span></b>
        <pre><span class=3D"quote">&gt; if the drivers for both GPUs use th=
e ScreenRec::SyncSharedPixmap hook. You can take a look at xf86-video-amdgp=
u/ati for an example. (The driver of the displaying GPU also needs to separ=
ately prevent tearing of the scanout process itself. xf86-video-amdgpu/ati =
do this by default for PRIME outputs)</span >

So this would be a matter of patching modesetting to do both of these thing=
s?=20
(I also wouldn't mind using the intel/nouveau Xorg drivers, but I got the
impression that modesetting is actually preferred, at least for newer Intel
cards.)

That talk btw says that modesetting supports both &quot;PRIME sync output s=
lave&quot; and
&quot;PRIME sync output master&quot;, which makes me wonder why it is not a=
ble to sync
with itself.  Either there's a bug in that (so I should reassign), or the
underlying DRM lacks some support for something (so this bugreport would be=
 in
the right place).  How could I figure that out?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15077127920.1949fde6c.23397--

--===============1795943511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1795943511==--
