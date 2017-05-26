From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Fri, 26 May 2017 15:14:36 +0000
Message-ID: <bug-89664-8800-EpTmH2gMUL@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1109617169=="
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


--===============1109617169==
Content-Type: multipart/alternative; boundary="14958116751.1e0F5C9.17827";
 charset="UTF-8"


--14958116751.1e0F5C9.17827
Date: Fri, 26 May 2017 15:14:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #29 from Miko=C5=82aj =C5=9Awi=C4=85tek <mikolaj.swiatek@gmail.=
com> ---
(In reply to Ben Skeggs from comment #28)
> (In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from comment #27)
> > (In reply to Ben Skeggs from comment #25)
> > > (In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from comment #24)
> > > > (In reply to Ilia Mirkin from comment #23)
> > > > > Have a look at bug #100676. Is it the same issue? (Please test th=
e patches
> > > > > that were provided there.)
> > > >=20
> > > > I don't *think* it's the exact same issue. The screen photo in that=
 report
> > > > is similar to what I see, though my text output is completely
> > > > unintelligible, rather than just slightly corrupted. The reason I t=
hought it
> > > > was this bug was that the log messages about unknown connectors and=
 failing
> > > > to create encoders are identical with Omar's in my case.
> > > >=20
> > > > In any event, I've built the kernel module from Ben's tree and it d=
idn't
> > > > change anything at all, same behaviour.
> > >=20
> > > Can I see your kernel log output from that please?  Bonus points if y=
ou boot
> > > with "log_buf_len=3D8M nouveau.debug=3Dtrace".
> >=20
> > Tried to do it that way, but it somehow resulted in so much output that=
 I
> > couldn't even see the boot log with journalctl. I guess the kernel ring
> > buffer fills up and  the beginning gets overwritten before journald can=
 read
> > it? Not an expert at debugging kernel modules by any stretch, so let me=
 know
> > if I'm missing something obvious here.
> >=20
> > In the meantime, uploaded a run with nouveau.debug=3Ddebug.
>=20
> I can't tell 100% for sure from that, but, there's *strong* evidence there
> to suggest that yes, you are indeed seeing the bug Ilia mentioned.  You c=
an
> probably work around it in the meantime by plugging one of your displays
> into another connector, or by trying the tree suggested in the other bug.

Well, for bug 100676 you suggest using your master branch, which I'm already
doing. Still, based on that report, I tried booting with "log_buf_len=3D8M
drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace,i2c=3Dtrace,bios=3Dtrace", wh=
ich gave
legible output, attaching log in the hope that it helps.=20

Can't really use a different connector for reasons, so for the time being I=
'm
stuck using nvidia's driver.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14958116751.1e0F5C9.17827
Date: Fri, 26 May 2017 15:14:35 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c29">Commen=
t # 29</a>
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
4#c28">comment #28</a>)
<span class=3D"quote">&gt; (In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from=
 <a href=3D"show_bug.cgi?id=3D89664#c27">comment #27</a>)
&gt; &gt; (In reply to Ben Skeggs from <a href=3D"show_bug.cgi?id=3D89664#c=
25">comment #25</a>)
&gt; &gt; &gt; (In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from <a href=3D"=
show_bug.cgi?id=3D89664#c24">comment #24</a>)
&gt; &gt; &gt; &gt; (In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?i=
d=3D89664#c23">comment #23</a>)
&gt; &gt; &gt; &gt; &gt; Have a look at <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gp104 - messy(random green and/or missing pixel lines) th=
en no output at and after boot"
   href=3D"show_bug.cgi?id=3D100676">bug #100676</a>. Is it the same issue?=
 (Please test the patches
&gt; &gt; &gt; &gt; &gt; that were provided there.)
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; I don't *think* it's the exact same issue. The screen p=
hoto in that report
&gt; &gt; &gt; &gt; is similar to what I see, though my text output is comp=
letely
&gt; &gt; &gt; &gt; unintelligible, rather than just slightly corrupted. Th=
e reason I thought it
&gt; &gt; &gt; &gt; was this bug was that the log messages about unknown co=
nnectors and failing
&gt; &gt; &gt; &gt; to create encoders are identical with Omar's in my case.
&gt; &gt; &gt; &gt;=20
&gt; &gt; &gt; &gt; In any event, I've built the kernel module from Ben's t=
ree and it didn't
&gt; &gt; &gt; &gt; change anything at all, same behaviour.
&gt; &gt; &gt;=20
&gt; &gt; &gt; Can I see your kernel log output from that please?  Bonus po=
ints if you boot
&gt; &gt; &gt; with &quot;log_buf_len=3D8M nouveau.debug=3Dtrace&quot;.
&gt; &gt;=20
&gt; &gt; Tried to do it that way, but it somehow resulted in so much outpu=
t that I
&gt; &gt; couldn't even see the boot log with journalctl. I guess the kerne=
l ring
&gt; &gt; buffer fills up and  the beginning gets overwritten before journa=
ld can read
&gt; &gt; it? Not an expert at debugging kernel modules by any stretch, so =
let me know
&gt; &gt; if I'm missing something obvious here.
&gt; &gt;=20
&gt; &gt; In the meantime, uploaded a run with nouveau.debug=3Ddebug.
&gt;=20
&gt; I can't tell 100% for sure from that, but, there's *strong* evidence t=
here
&gt; to suggest that yes, you are indeed seeing the bug Ilia mentioned.  Yo=
u can
&gt; probably work around it in the meantime by plugging one of your displa=
ys
&gt; into another connector, or by trying the tree suggested in the other b=
ug.</span >

Well, for <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gp104 - messy(random green and/or missing pixel lines) th=
en no output at and after boot"
   href=3D"show_bug.cgi?id=3D100676">bug 100676</a> you suggest using your =
master branch, which I'm already
doing. Still, based on that report, I tried booting with &quot;log_buf_len=
=3D8M
drm.debug=3D0x14 nouveau.debug=3Ddisp=3Dtrace,i2c=3Dtrace,bios=3Dtrace&quot=
;, which gave
legible output, attaching log in the hope that it helps.=20

Can't really use a different connector for reasons, so for the time being I=
'm
stuck using nvidia's driver.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14958116751.1e0F5C9.17827--

--===============1109617169==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1109617169==--
