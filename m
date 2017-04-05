From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 100431] nv50: memory corruption due to
 use-after-free of dma_fence
Date: Wed, 05 Apr 2017 11:57:07 +0000
Message-ID: <bug-100431-8800-NP8LrsCtum@http.bugs.freedesktop.org/>
References: <bug-100431-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0294219410=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-100431-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0294219410==
Content-Type: multipart/alternative; boundary="14913934261.BF4Ecc.12970";
 charset="UTF-8"


--14913934261.BF4Ecc.12970
Date: Wed, 5 Apr 2017 11:57:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100431

--- Comment #4 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ard Biesheuvel from comment #3)
> Thanks Ben, the quoted commit applied onto v4.10.7 fixes the problem for =
me.
>=20
> Tested-by: Ard Biesheuvel <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> I take it this will be tagged for -stable?
>=20
> Thanks,
> Ard.

Great!  Thanks for testing.

Yup, I'll be sending Dave a fixes tree for 4.11 (with relevant commits Cc'd
stable) tomorrow.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14913934261.BF4Ecc.12970
Date: Wed, 5 Apr 2017 11:57:06 +0000
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
   title=3D"NEW - nv50: memory corruption due to use-after-free of dma_fenc=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100431#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nv50: memory corruption due to use-after-free of dma_fenc=
e"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100431">bug 10043=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Ard Biesheuvel from <a href=3D"show_bug.cgi?id=3D=
100431#c3">comment #3</a>)
<span class=3D"quote">&gt; Thanks Ben, the quoted commit applied onto v4.10=
.7 fixes the problem for me.
&gt;=20
&gt; Tested-by: Ard Biesheuvel &lt;<a href=3D"mailto:ard.biesheuvel&#64;lin=
aro.org">ard.biesheuvel&#64;linaro.org</a>&gt;
&gt;=20
&gt; I take it this will be tagged for -stable?
&gt;=20
&gt; Thanks,
&gt; Ard.</span >

Great!  Thanks for testing.

Yup, I'll be sending Dave a fixes tree for 4.11 (with relevant commits Cc'd
stable) tomorrow.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14913934261.BF4Ecc.12970--

--===============0294219410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0294219410==--
