From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] [GM204] GTX 970 + 4GB VRAM fails at secboot
	(v4.6+)
Date: Mon, 21 Nov 2016 06:50:57 +0000
Message-ID: <bug-94990-8800-Bg4fhGktQw@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1412860800=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1412860800==
Content-Type: multipart/alternative; boundary="14797110571.A303Aaa1f.28701";
 charset="UTF-8"


--14797110571.A303Aaa1f.28701
Date: Mon, 21 Nov 2016 06:50:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D94990

--- Comment #95 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Alexandre Courbot from comment #94)
> Created attachment 128093 [details]
> Log with patch 128091
>=20
> Hi Ben,
>=20
> Patch did not do the trick for me (log attached). Confirmed that
> 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch still
> succeeded, so apparently the method is not perfectly correct. Rather
> strangely the printk'd value of 0x100ce0 is 0x00000000...

Yeah, everyone, don't bother trying this.  This register is written by the
secure boot ucode, so the problem remains unsolved.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14797110571.A303Aaa1f.28701
Date: Mon, 21 Nov 2016 06:50:57 +0000
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
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990#c95">Commen=
t # 95</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [GM204] GTX 970 + 4GB VRAM fails at secboot (v4.6+)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D94990">bug 94990<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Alexandre Courbot from <a href=3D"show_bug.cgi?id=
=3D94990#c94">comment #94</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D128093" name=3D"attach_128093" title=3D"Log with patch 128091">atta=
chment 128093</a> <a href=3D"attachment.cgi?id=3D128093&amp;action=3Dedit" =
title=3D"Log with patch 128091">[details]</a></span>
&gt; Log with patch 128091
&gt;=20
&gt; Hi Ben,
&gt;=20
&gt; Patch did not do the trick for me (log attached). Confirmed that
&gt; 0001-nvkm_gpuobj-size-is-smaller-then-nvkm_gpuobj-size-ca.patch still
&gt; succeeded, so apparently the method is not perfectly correct. Rather
&gt; strangely the printk'd value of 0x100ce0 is 0x00000000...</span >

Yeah, everyone, don't bother trying this.  This register is written by the
secure boot ucode, so the problem remains unsolved.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14797110571.A303Aaa1f.28701--

--===============1412860800==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1412860800==--
