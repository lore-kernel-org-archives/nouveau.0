From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Sat, 27 May 2017 14:26:32 +0000
Message-ID: <bug-89664-8800-vDcuytDdZS@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0913259043=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89664-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0913259043==
Content-Type: multipart/alternative; boundary="14958951921.7bAF198.447";
 charset="UTF-8"


--14958951921.7bAF198.447
Date: Sat, 27 May 2017 14:26:32 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #32 from Miko=C5=82aj =C5=9Awi=C4=85tek <mikolaj.swiatek@gmail.=
com> ---
(In reply to Ben Skeggs from comment #31)
> (In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from comment #30)
> > Created attachment 131522 [details]
> > nouveau master, trace
> >=20
> > Module built from bskeggs/nouveau master, booted with "log_buf_len=3D8M
> > drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace,i2c=3Dtrace,bios=3Dtrace".
>=20
> According to the log messages here, this output isn't from the code on my
> master branch.  Perhaps another version of the module got loaded instead?

Yep, apparently I forgot to regenerate initramfs. Sorry for the confusion,
seems that you were right and it was actually bug 100676.

With using the correct module, both displays work fine in single-user mode,=
 but
trying to start an X session results in a kernel BUG in ttm_bo_vm_fault, wh=
ich
I guess should be reported elsewhere.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14958951921.7bAF198.447
Date: Sat, 27 May 2017 14:26:32 +0000
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
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c32">Commen=
t # 32</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664">bug 89664<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikolaj.swiatek&#64;gmail.com" title=3D"Miko=C5=82aj =C5=9Awi=C4=85tek &lt;=
mikolaj.swiatek&#64;gmail.com&gt;"> <span class=3D"fn">Miko=C5=82aj =C5=9Aw=
i=C4=85tek</span></a>
</span></b>
        <pre>(In reply to Ben Skeggs from <a href=3D"show_bug.cgi?id=3D8966=
4#c31">comment #31</a>)
<span class=3D"quote">&gt; (In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from=
 <a href=3D"show_bug.cgi?id=3D89664#c30">comment #30</a>)
&gt; &gt; Created <span class=3D""><a href=3D"attachment.cgi?id=3D131522" n=
ame=3D"attach_131522" title=3D"nouveau master, trace">attachment 131522</a>=
 <a href=3D"attachment.cgi?id=3D131522&amp;action=3Dedit" title=3D"nouveau =
master, trace">[details]</a></span>
&gt; &gt; nouveau master, trace
&gt; &gt;=20
&gt; &gt; Module built from bskeggs/nouveau master, booted with &quot;log_b=
uf_len=3D8M
&gt; &gt; drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace,i2c=3Dtrace,bios=3D=
trace&quot;.
&gt;=20
&gt; According to the log messages here, this output isn't from the code on=
 my
&gt; master branch.  Perhaps another version of the module got loaded inste=
ad?</span >

Yep, apparently I forgot to regenerate initramfs. Sorry for the confusion,
seems that you were right and it was actually <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gp104 - messy(random green and/or missing pixel lines) th=
en no output at and after boot"
   href=3D"show_bug.cgi?id=3D100676">bug 100676</a>.

With using the correct module, both displays work fine in single-user mode,=
 but
trying to start an X session results in a kernel BUG in ttm_bo_vm_fault, wh=
ich
I guess should be reported elsewhere.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14958951921.7bAF198.447--

--===============0913259043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0913259043==--
