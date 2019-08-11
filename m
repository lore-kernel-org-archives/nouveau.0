From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 111371] [NV04] bios OOB on kernel driver
 initialization
Date: Sun, 11 Aug 2019 16:35:37 +0000
Message-ID: <bug-111371-8800-5x3M9qd7r3@http.bugs.freedesktop.org/>
References: <bug-111371-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0602773524=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-111371-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0602773524==
Content-Type: multipart/alternative; boundary="15655413362.DbA4D.12411"
Content-Transfer-Encoding: 7bit


--15655413362.DbA4D.12411
Date: Sun, 11 Aug 2019 16:35:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111371

--- Comment #5 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Could you try retrieving the image using nvagetbios and uploading it? I'm
curious what's in it, perhaps our "is this a valid image" logic needs fixin=
g.
Or perhaps it's bogus data -- not 100% surprising for a NV4. We definitely =
do
have some examples of NV4 vbios's though, and in the past people have
successfully booted NV4 boards with nouveau (and filed bugs about things mu=
ch
later having issues, like the ddx or GL accel - you can search for them).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15655413362.DbA4D.12411
Date: Sun, 11 Aug 2019 16:35:36 +0000
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
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV04] bios OOB on kernel driver initialization"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111371">bug 11137=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Could you try retrieving the image using nvagetbios and upload=
ing it? I'm
curious what's in it, perhaps our &quot;is this a valid image&quot; logic n=
eeds fixing.
Or perhaps it's bogus data -- not 100% surprising for a NV4. We definitely =
do
have some examples of NV4 vbios's though, and in the past people have
successfully booted NV4 boards with nouveau (and filed bugs about things mu=
ch
later having issues, like the ddx or GL accel - you can search for them).</=
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

--15655413362.DbA4D.12411--

--===============0602773524==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0602773524==--
