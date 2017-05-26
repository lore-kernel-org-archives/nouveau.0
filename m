From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Fri, 26 May 2017 02:51:00 +0000
Message-ID: <bug-89664-8800-iDjB1keAne@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1723285079=="
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


--===============1723285079==
Content-Type: multipart/alternative; boundary="14957670600.f55f5ccA0.13797";
 charset="UTF-8"


--14957670600.f55f5ccA0.13797
Date: Fri, 26 May 2017 02:51:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #28 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from comment #27)
> (In reply to Ben Skeggs from comment #25)
> > (In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from comment #24)
> > > (In reply to Ilia Mirkin from comment #23)
> > > > Have a look at bug #100676. Is it the same issue? (Please test the =
patches
> > > > that were provided there.)
> > >=20
> > > I don't *think* it's the exact same issue. The screen photo in that r=
eport
> > > is similar to what I see, though my text output is completely
> > > unintelligible, rather than just slightly corrupted. The reason I tho=
ught it
> > > was this bug was that the log messages about unknown connectors and f=
ailing
> > > to create encoders are identical with Omar's in my case.
> > >=20
> > > In any event, I've built the kernel module from Ben's tree and it did=
n't
> > > change anything at all, same behaviour.
> >=20
> > Can I see your kernel log output from that please?  Bonus points if you=
 boot
> > with "log_buf_len=3D8M nouveau.debug=3Dtrace".
>=20
> Tried to do it that way, but it somehow resulted in so much output that I
> couldn't even see the boot log with journalctl. I guess the kernel ring
> buffer fills up and  the beginning gets overwritten before journald can r=
ead
> it? Not an expert at debugging kernel modules by any stretch, so let me k=
now
> if I'm missing something obvious here.
>=20
> In the meantime, uploaded a run with nouveau.debug=3Ddebug.

I can't tell 100% for sure from that, but, there's *strong* evidence there =
to
suggest that yes, you are indeed seeing the bug Ilia mentioned.  You can
probably work around it in the meantime by plugging one of your displays in=
to
another connector, or by trying the tree suggested in the other bug.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14957670600.f55f5ccA0.13797
Date: Fri, 26 May 2017 02:51:00 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c28">Commen=
t # 28</a>
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
ow_bug.cgi?id=3D89664#c27">comment #27</a>)
<span class=3D"quote">&gt; (In reply to Ben Skeggs from <a href=3D"show_bug=
.cgi?id=3D89664#c25">comment #25</a>)
&gt; &gt; (In reply to Miko=C5=82aj =C5=9Awi=C4=85tek from <a href=3D"show_=
bug.cgi?id=3D89664#c24">comment #24</a>)
&gt; &gt; &gt; (In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D8=
9664#c23">comment #23</a>)
&gt; &gt; &gt; &gt; Have a look at <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gp104 - messy(random green and/or missing pixel lines) th=
en no output at and after boot"
   href=3D"show_bug.cgi?id=3D100676">bug #100676</a>. Is it the same issue?=
 (Please test the patches
&gt; &gt; &gt; &gt; that were provided there.)
&gt; &gt; &gt;=20
&gt; &gt; &gt; I don't *think* it's the exact same issue. The screen photo =
in that report
&gt; &gt; &gt; is similar to what I see, though my text output is completely
&gt; &gt; &gt; unintelligible, rather than just slightly corrupted. The rea=
son I thought it
&gt; &gt; &gt; was this bug was that the log messages about unknown connect=
ors and failing
&gt; &gt; &gt; to create encoders are identical with Omar's in my case.
&gt; &gt; &gt;=20
&gt; &gt; &gt; In any event, I've built the kernel module from Ben's tree a=
nd it didn't
&gt; &gt; &gt; change anything at all, same behaviour.
&gt; &gt;=20
&gt; &gt; Can I see your kernel log output from that please?  Bonus points =
if you boot
&gt; &gt; with &quot;log_buf_len=3D8M nouveau.debug=3Dtrace&quot;.
&gt;=20
&gt; Tried to do it that way, but it somehow resulted in so much output tha=
t I
&gt; couldn't even see the boot log with journalctl. I guess the kernel ring
&gt; buffer fills up and  the beginning gets overwritten before journald ca=
n read
&gt; it? Not an expert at debugging kernel modules by any stretch, so let m=
e know
&gt; if I'm missing something obvious here.
&gt;=20
&gt; In the meantime, uploaded a run with nouveau.debug=3Ddebug.</span >

I can't tell 100% for sure from that, but, there's *strong* evidence there =
to
suggest that yes, you are indeed seeing the bug Ilia mentioned.  You can
probably work around it in the meantime by plugging one of your displays in=
to
another connector, or by trying the tree suggested in the other bug.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14957670600.f55f5ccA0.13797--

--===============1723285079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1723285079==--
