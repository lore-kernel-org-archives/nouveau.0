From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99289] Display freezes after "gr: TRAP ch 6"
Date: Thu, 05 Jan 2017 20:00:45 +0000
Message-ID: <bug-99289-8800-ewdm0nmubn@http.bugs.freedesktop.org/>
References: <bug-99289-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0665729095=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99289-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0665729095==
Content-Type: multipart/alternative; boundary="14836464450.FbB5a07f6.1540";
 charset="UTF-8"


--14836464450.FbB5a07f6.1540
Date: Thu, 5 Jan 2017 20:00:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99289

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
To answer your immediate question about firmware, you can get blob firmware=
 by
following the insturctions at

https://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware

to the letter. Unfortunately I think that linux 4.9 wants some of these to =
be
renamed, but there's a patch to fix it to look for the "old" names as well:

https://github.com/skeggsb/linux/commit/e137040e0d0376b404fc5155eba44ea0712=
6e3bd.patch

Should be included in a later 4.9.x release.

However I'm only aware of the blob firmware fixing issues for some GTX 660
owners.

nofbaccel=3D1 is unlikely to be of much help - that disables acceleration o=
f the
fbdev device for your terminals.

Note that there are additional patches in Linux 4.10-rc1+ which are likely =
to
improve stability, such as

https://github.com/skeggsb/linux/commit/b27add13f500469127afdf011dbcc9c649e=
16e54.patch

and you might also want this one, although it'll be a little annoying to ap=
ply
to upstream tree:

https://github.com/skeggsb/nouveau/commit/b3816f34944ad4824d345b98c323a3071=
0f492d4.patch

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14836464450.FbB5a07f6.1540
Date: Thu, 5 Jan 2017 20:00:45 +0000
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
   title=3D"NEW - Display freezes after &quot;gr: TRAP ch 6&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99289#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Display freezes after &quot;gr: TRAP ch 6&quot;"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99289">bug 99289<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>To answer your immediate question about firmware, you can get =
blob firmware by
following the insturctions at

<a href=3D"https://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware=
">https://nouveau.freedesktop.org/wiki/VideoAcceleration/#firmware</a>

to the letter. Unfortunately I think that linux 4.9 wants some of these to =
be
renamed, but there's a patch to fix it to look for the &quot;old&quot; name=
s as well:

<a href=3D"https://github.com/skeggsb/linux/commit/e137040e0d0376b404fc5155=
eba44ea07126e3bd.patch">https://github.com/skeggsb/linux/commit/e137040e0d0=
376b404fc5155eba44ea07126e3bd.patch</a>

Should be included in a later 4.9.x release.

However I'm only aware of the blob firmware fixing issues for some GTX 660
owners.

nofbaccel=3D1 is unlikely to be of much help - that disables acceleration o=
f the
fbdev device for your terminals.

Note that there are additional patches in Linux 4.10-rc1+ which are likely =
to
improve stability, such as

<a href=3D"https://github.com/skeggsb/linux/commit/b27add13f500469127afdf01=
1dbcc9c649e16e54.patch">https://github.com/skeggsb/linux/commit/b27add13f50=
0469127afdf011dbcc9c649e16e54.patch</a>

and you might also want this one, although it'll be a little annoying to ap=
ply
to upstream tree:

<a href=3D"https://github.com/skeggsb/nouveau/commit/b3816f34944ad4824d345b=
98c323a30710f492d4.patch">https://github.com/skeggsb/nouveau/commit/b3816f3=
4944ad4824d345b98c323a30710f492d4.patch</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14836464450.FbB5a07f6.1540--

--===============0665729095==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0665729095==--
