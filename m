From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99584] XVMC on nv43 class card broken with recent
 mesa + kernel.
Date: Sun, 26 Mar 2017 03:43:01 +0000
Message-ID: <bug-99584-8800-9x2XTjx3Nu@http.bugs.freedesktop.org/>
References: <bug-99584-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2070899477=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99584-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2070899477==
Content-Type: multipart/alternative; boundary="14904997810.3cc8E.9767";
 charset="UTF-8"


--14904997810.3cc8E.9767
Date: Sun, 26 Mar 2017 03:43:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99584

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so the NV4A actually runs into a different issue - the MPEG class can o=
nly
take linear memory, but the PCI GART is paged. So it can't deal the CMD/DATA
bo's. When moving those to VRAM (in mesa), the NV4A is fine. I plugged a NV=
42
in with much worse results. On boot I get:

https://hastebin.com/datuzivebu.sql

[   10.110345] nouveau 0000:04:00.0: mpeg: ch -1 [unknown] 03100023 ffffffff
00000001 ffffffff
[   10.191580] nouveau 0000:04:00.0: mpeg: MSRCH 0xffffffff

And just all kinds of fail. This is with some local patches to print the ex=
tra
stuff out. Feels like it's not getting powered on (all those 0xffffffff's) =
in
MC.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14904997810.3cc8E.9767
Date: Sun, 26 Mar 2017 03:43:01 +0000
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
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - XVMC on nv43 class card broken with recent mesa + kernel."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99584">bug 99584<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so the NV4A actually runs into a different issue - the MPE=
G class can only
take linear memory, but the PCI GART is paged. So it can't deal the CMD/DATA
bo's. When moving those to VRAM (in mesa), the NV4A is fine. I plugged a NV=
42
in with much worse results. On boot I get:

<a href=3D"https://hastebin.com/datuzivebu.sql">https://hastebin.com/datuzi=
vebu.sql</a>

[   10.110345] nouveau 0000:04:00.0: mpeg: ch -1 [unknown] 03100023 ffffffff
00000001 ffffffff
[   10.191580] nouveau 0000:04:00.0: mpeg: MSRCH 0xffffffff

And just all kinds of fail. This is with some local patches to print the ex=
tra
stuff out. Feels like it's not getting powered on (all those 0xffffffff's) =
in
MC.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14904997810.3cc8E.9767--

--===============2070899477==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============2070899477==--
