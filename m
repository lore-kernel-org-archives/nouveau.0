From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97620] [REGRESSION,
 bisected] KMS can't initialize GeForce GTX 460 after commit
 a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816
Date: Sat, 28 Jan 2017 20:38:59 +0000
Message-ID: <bug-97620-8800-wlQraLw7ks@http.bugs.freedesktop.org/>
References: <bug-97620-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1001831403=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97620-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1001831403==
Content-Type: multipart/alternative; boundary="14856359392.Ca45C.18423";
 charset="UTF-8"


--14856359392.Ca45C.18423
Date: Sat, 28 Jan 2017 20:38:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97620

--- Comment #34 from Carl Lucas <carl.lucas-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #33)
> Could someone see if https://patchwork.freedesktop.org/patch/135772/
> improves the situation?

Yes it does - I was able to boot just fine.

I did have to add #include <subdev/vga.h> though, for nvkm_rdvgac().

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14856359392.Ca45C.18423
Date: Sat, 28 Jan 2017 20:38:59 +0000
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
   title=3D"NEW - [REGRESSION, bisected] KMS can't initialize GeForce GTX 4=
60 after commit a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620#c34">Commen=
t # 34</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION, bisected] KMS can't initialize GeForce GTX 4=
60 after commit a6a0f67ca7aae2e6bec7ebf55d1e4853dc220816"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97620">bug 97620<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
carl.lucas&#64;gmail.com" title=3D"Carl Lucas &lt;carl.lucas&#64;gmail.com&=
gt;"> <span class=3D"fn">Carl Lucas</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D976=
20#c33">comment #33</a>)
<span class=3D"quote">&gt; Could someone see if <a href=3D"https://patchwor=
k.freedesktop.org/patch/135772/">https://patchwork.freedesktop.org/patch/13=
5772/</a>
&gt; improves the situation?</span >

Yes it does - I was able to boot just fine.

I did have to add #include &lt;subdev/vga.h&gt; though, for nvkm_rdvgac().<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14856359392.Ca45C.18423--

--===============1001831403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1001831403==--
