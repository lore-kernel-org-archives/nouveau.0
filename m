From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70972] [NV67] Modesetting failure at 1280x800
Date: Sun, 03 Sep 2017 16:34:08 +0000
Message-ID: <bug-70972-8800-7TQMteHDYo@http.bugs.freedesktop.org/>
References: <bug-70972-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0309860985=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70972-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0309860985==
Content-Type: multipart/alternative; boundary="15044564480.9a84c91.27267";
 charset="UTF-8"


--15044564480.9a84c91.27267
Date: Sun, 3 Sep 2017 16:34:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D70972

--- Comment #41 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
All of the modesetting logic (for pre-G80 chips) lives in

drivers/gpu/drm/nouveau/dispnv04

This is mostly an adaptation of xf86-video-nv to work in the kernel, with s=
ome
IMHO misguided "cleanups" that were applied to some of the incomprehensible
clock/etc calculation code. Unfortunately those are also mixed in with legit
fixes, so it's hard to undo.

Either way, since xf86-video-nv also reputedly can't make 1280x800 work,
reading that source is unlikely to be of much help. However at least the NV=
1A
and NV1F IGP's tend to have their own very special clock calculation logic,=
 so
perhaps that's missing (might look at what e.g. NV4C/NV4E do, as those
allegedly work well).

There are already traces of both the blob and nouveau and how they perform =
the
modesetting (see attachments in this bug). What's largely missing is
identifying what nouveau does differently, and then coming up with a way to=
 fix
it.

You can use 'demmio' from envytools to help analyze the traces
(https://github.com/envytools/envytools).

If you have questions about the tooling or the code, feel free to join in
#nouveau on irc.freenode.net.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15044564480.9a84c91.27267
Date: Sun, 3 Sep 2017 16:34:07 +0000
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
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972#c41">Commen=
t # 41</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Modesetting failure at 1280x800"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70972">bug 70972<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>All of the modesetting logic (for pre-G80 chips) lives in

drivers/gpu/drm/nouveau/dispnv04

This is mostly an adaptation of xf86-video-nv to work in the kernel, with s=
ome
IMHO misguided &quot;cleanups&quot; that were applied to some of the incomp=
rehensible
clock/etc calculation code. Unfortunately those are also mixed in with legit
fixes, so it's hard to undo.

Either way, since xf86-video-nv also reputedly can't make 1280x800 work,
reading that source is unlikely to be of much help. However at least the NV=
1A
and NV1F IGP's tend to have their own very special clock calculation logic,=
 so
perhaps that's missing (might look at what e.g. NV4C/NV4E do, as those
allegedly work well).

There are already traces of both the blob and nouveau and how they perform =
the
modesetting (see attachments in this bug). What's largely missing is
identifying what nouveau does differently, and then coming up with a way to=
 fix
it.

You can use 'demmio' from envytools to help analyze the traces
(<a href=3D"https://github.com/envytools/envytools">https://github.com/envy=
tools/envytools</a>).

If you have questions about the tooling or the code, feel free to join in
#nouveau on irc.freenode.net.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15044564480.9a84c91.27267--

--===============0309860985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0309860985==--
