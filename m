From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 104156] NVIDIA Corporation G96 [GeForce 9500 GT]
 (rev a1) issue finding GPIO
Date: Tue, 12 Dec 2017 21:56:33 +0000
Message-ID: <bug-104156-8800-ujAewjbUoW@http.bugs.freedesktop.org/>
References: <bug-104156-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0227939956=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-104156-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0227939956==
Content-Type: multipart/alternative; boundary="15131157920.30B1.3849";
 charset="UTF-8"


--15131157920.30B1.3849
Date: Tue, 12 Dec 2017 21:56:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D104156

--- Comment #7 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Jonathan from comment #6)
> (In reply to Ilia Mirkin from comment #3)
> > IIRC I had the same issue with my G96. Should be in the vbios repo.
>=20
> File has been attached. (twice by mistake)

Yeah, as far as I can tell from that, we're not doing anything wrong here.=
=20
Your VBIOS' connector table points to a GPIO table entry that doesn't exist.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15131157920.30B1.3849
Date: Tue, 12 Dec 2017 21:56:32 +0000
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
   title=3D"NEW - NVIDIA Corporation G96 [GeForce 9500 GT] (rev a1) issue f=
inding GPIO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104156#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - NVIDIA Corporation G96 [GeForce 9500 GT] (rev a1) issue f=
inding GPIO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D104156">bug 10415=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Jonathan from <a href=3D"show_bug.cgi?id=3D104156=
#c6">comment #6</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D104156#c3">comment #3</a>)
&gt; &gt; IIRC I had the same issue with my G96. Should be in the vbios rep=
o.
&gt;=20
&gt; File has been attached. (twice by mistake)</span >

Yeah, as far as I can tell from that, we're not doing anything wrong here.=
=20
Your VBIOS' connector table points to a GPIO table entry that doesn't exist=
.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15131157920.30B1.3849--

--===============0227939956==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0227939956==--
