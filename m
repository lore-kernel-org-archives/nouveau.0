From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100228] [NV137] unknown chipset (137000a1)
Date: Thu, 16 Mar 2017 17:12:44 +0000
Message-ID: <bug-100228-8800-ecCnvas9hm@http.bugs.freedesktop.org/>
References: <bug-100228-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1575970838=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100228-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1575970838==
Content-Type: multipart/alternative; boundary="14896843640.d4644AfE.21430";
 charset="UTF-8"


--14896843640.d4644AfE.21430
Date: Thu, 16 Mar 2017 17:12:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100228

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
This is expected. None of the software you listed supports your GPU.

With the latest released kernel (4.10), you can easily write a patch that w=
ill
add support. The reason it has not been integrated is that I believe we're
still waiting for a blob mmiotrace (and I don't appear to remember the pass=
word
for the mmio.dumps-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org account to check - others do though) to make s=
ure
that there are no odd differences in setup.

An example of such a patch is available at
https://www.spinics.net/lists/dri-devel/msg132664.html .

However this won't get you acceleration - just modesetting. If you want
acceleration, you also need the drm-next tree (targeted at Linux 4.12) as w=
ell
as the associated firmware from nvidia.

Then you'd need a version of xf86-video-nouveau that supports GP10x - the
current codebase doesn't, but it should, again, be a trivial patch, just ne=
eds
testing.

You'll likely also need mesa from git, as the 17.0 release doesn't have som=
e of
the relevant logic.

[Long story short - it's not quite there yet.]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14896843640.d4644AfE.21430
Date: Thu, 16 Mar 2017 17:12:44 +0000
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
   title=3D"NEW - [NV137] unknown chipset (137000a1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV137] unknown chipset (137000a1)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100228">bug 10022=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>This is expected. None of the software you listed supports you=
r GPU.

With the latest released kernel (4.10), you can easily write a patch that w=
ill
add support. The reason it has not been integrated is that I believe we're
still waiting for a blob mmiotrace (and I don't appear to remember the pass=
word
for the <a href=3D"mailto:mmio.dumps&#64;gmail.com">mmio.dumps&#64;gmail.co=
m</a> account to check - others do though) to make sure
that there are no odd differences in setup.

An example of such a patch is available at
<a href=3D"https://www.spinics.net/lists/dri-devel/msg132664.html">https://=
www.spinics.net/lists/dri-devel/msg132664.html</a> .

However this won't get you acceleration - just modesetting. If you want
acceleration, you also need the drm-next tree (targeted at Linux 4.12) as w=
ell
as the associated firmware from nvidia.

Then you'd need a version of xf86-video-nouveau that supports GP10x - the
current codebase doesn't, but it should, again, be a trivial patch, just ne=
eds
testing.

You'll likely also need mesa from git, as the 17.0 release doesn't have som=
e of
the relevant logic.

[Long story short - it's not quite there yet.]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14896843640.d4644AfE.21430--

--===============1575970838==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1575970838==--
