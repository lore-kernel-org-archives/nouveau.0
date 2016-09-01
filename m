From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97568] read pixels of MSAAx8 surface stretched
 horizontally/vertically
Date: Thu, 01 Sep 2016 19:53:33 +0000
Message-ID: <bug-97568-8800-VvfmnZLDdp@http.bugs.freedesktop.org/>
References: <bug-97568-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0840170169=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97568-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0840170169==
Content-Type: multipart/alternative; boundary="14727596130.5D87c9788.15398";
 charset="UTF-8"


--14727596130.5D87c9788.15398
Date: Thu, 1 Sep 2016 19:53:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97568

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
As I mentioned on IRC, I strongly believe this is due to the following issu=
e:

https://trello.com/c/jzBpfrzL/134-resolve-on-transfer-map-upscale-on-transf=
er-unmap

Basically we're supposed to do a resolve on transfer_map, return the resolv=
ed
image, and if any of it is changed, copy back at unmap time while up-scalin=
g.

We do none of that right now, and 8x MSAA is laid out in a 4x2 grid for each
pixel, so it makes sense that the output would be "scaled up" that way.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14727596130.5D87c9788.15398
Date: Thu, 1 Sep 2016 19:53:33 +0000
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
   title=3D"NEW - read pixels of MSAAx8 surface stretched horizontally/vert=
ically"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97568#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - read pixels of MSAAx8 surface stretched horizontally/vert=
ically"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97568">bug 97568<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>As I mentioned on IRC, I strongly believe this is due to the f=
ollowing issue:

<a href=3D"https://trello.com/c/jzBpfrzL/134-resolve-on-transfer-map-upscal=
e-on-transfer-unmap">https://trello.com/c/jzBpfrzL/134-resolve-on-transfer-=
map-upscale-on-transfer-unmap</a>

Basically we're supposed to do a resolve on transfer_map, return the resolv=
ed
image, and if any of it is changed, copy back at unmap time while up-scalin=
g.

We do none of that right now, and 8x MSAA is laid out in a 4x2 grid for each
pixel, so it makes sense that the output would be &quot;scaled up&quot; tha=
t way.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14727596130.5D87c9788.15398--

--===============0840170169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0840170169==--
