From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Mon, 22 May 2017 22:18:38 +0000
Message-ID: <bug-89664-8800-j21o3SIdw6@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1759160723=="
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


--===============1759160723==
Content-Type: multipart/alternative; boundary="14954915171.caFc8C7.6670";
 charset="UTF-8"


--14954915171.caFc8C7.6670
Date: Mon, 22 May 2017 22:18:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #25 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from comment #24)
> (In reply to Ilia Mirkin from comment #23)
> > Have a look at bug #100676. Is it the same issue? (Please test the patc=
hes
> > that were provided there.)
>=20
> I don't *think* it's the exact same issue. The screen photo in that report
> is similar to what I see, though my text output is completely
> unintelligible, rather than just slightly corrupted. The reason I thought=
 it
> was this bug was that the log messages about unknown connectors and faili=
ng
> to create encoders are identical with Omar's in my case.
>=20
> In any event, I've built the kernel module from Ben's tree and it didn't
> change anything at all, same behaviour.

Can I see your kernel log output from that please?  Bonus points if you boot
with "log_buf_len=3D8M nouveau.debug=3Dtrace".

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14954915171.caFc8C7.6670
Date: Mon, 22 May 2017 22:18:37 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c25">Commen=
t # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664">bug 89664<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from <a href=3D"sh=
ow_bug.cgi?id=3D89664#c24">comment #24</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D89664#c23">comment #23</a>)
&gt; &gt; Have a look at <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gp104 - messy(random green and/or missing pixel lines) th=
en no output at and after boot"
   href=3D"show_bug.cgi?id=3D100676">bug #100676</a>. Is it the same issue?=
 (Please test the patches
&gt; &gt; that were provided there.)
&gt;=20
&gt; I don't *think* it's the exact same issue. The screen photo in that re=
port
&gt; is similar to what I see, though my text output is completely
&gt; unintelligible, rather than just slightly corrupted. The reason I thou=
ght it
&gt; was this bug was that the log messages about unknown connectors and fa=
iling
&gt; to create encoders are identical with Omar's in my case.
&gt;=20
&gt; In any event, I've built the kernel module from Ben's tree and it didn=
't
&gt; change anything at all, same behaviour.</span >

Can I see your kernel log output from that please?  Bonus points if you boot
with &quot;log_buf_len=3D8M nouveau.debug=3Dtrace&quot;.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14954915171.caFc8C7.6670--

--===============1759160723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1759160723==--
