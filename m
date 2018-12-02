From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92961] Xorg freezes (only mouse and ssh are still
 working)
Date: Sun, 02 Dec 2018 23:25:13 +0000
Message-ID: <bug-92961-8800-uEyYKOZpGx@http.bugs.freedesktop.org/>
References: <bug-92961-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0396836175=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92961-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0396836175==
Content-Type: multipart/alternative; boundary="15437931131.77F8C2b.26355"
Content-Transfer-Encoding: 7bit


--15437931131.77F8C2b.26355
Date: Sun, 2 Dec 2018 23:25:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D92961

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Nic Soud=C3=A9e from comment #19)
> Created attachment 142692 [details] [review]
> Handle INTR 0x00800000 in gf100_fifo_intr
>=20
> Attached is a patch I applied to kernel 4.19.5 to desperately thwart my D=
ELL
> E6420 from randomly getting its video busted (very similar symptons as
> Comment #3 of this ticket, and is why I'm posting here). I don't have any
> experience with such low-level programming but I just pretended I knew wh=
at
> I was doing and cut and pasted a condition for that INTR 0x00800000 error
> which pops up every time that catastrophic random event happens.
>=20
> So far, my E6420 is working great despite receiving some of those INTRs,
> thanks to this patch. I am posting this in hopes it might be on the right
> track towards getting this fixed by someone who knows what they're doing.=
..

That's a little surprising. The existing logic will mask out further interr=
upts
by writing a 0 into the relevant bit of 2140 (which is the INTR_EN register,
which controls which intr's get surfaced).

Your logic removes that, which means that you'll keep getting the unknown
intr's, and also you add a read from 258c. That's unlikely to matter though.

However now if we *do* ever get an interrupt for that bit in 2100 after
disabling the bit in 2140, then it'll be stuck forever. I suspect that the =
"&
mask" should be removed at the beginning of that function [and thus the read
from 2140].

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15437931131.77F8C2b.26355
Date: Sun, 2 Dec 2018 23:25:13 +0000
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
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961#c20">Commen=
t # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Xorg freezes (only mouse and ssh are still working)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D92961">bug 92961<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Nic Soud=C3=A9e from <a href=3D"show_bug.cgi?id=
=3D92961#c19">comment #19</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D142692" name=3D"attach_142692" title=3D"Handle INTR 0x00800000 in g=
f100_fifo_intr">attachment 142692</a> <a href=3D"attachment.cgi?id=3D142692=
&amp;action=3Dedit" title=3D"Handle INTR 0x00800000 in gf100_fifo_intr">[de=
tails]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D92961&am=
p;attachment=3D142692'>[review]</a> [review]
&gt; Handle INTR 0x00800000 in gf100_fifo_intr
&gt;=20
&gt; Attached is a patch I applied to kernel 4.19.5 to desperately thwart m=
y DELL
&gt; E6420 from randomly getting its video busted (very similar symptons as
&gt; <a href=3D"show_bug.cgi?id=3D92961#c3">Comment #3</a> of this ticket, =
and is why I'm posting here). I don't have any
&gt; experience with such low-level programming but I just pretended I knew=
 what
&gt; I was doing and cut and pasted a condition for that INTR 0x00800000 er=
ror
&gt; which pops up every time that catastrophic random event happens.
&gt;=20
&gt; So far, my E6420 is working great despite receiving some of those INTR=
s,
&gt; thanks to this patch. I am posting this in hopes it might be on the ri=
ght
&gt; track towards getting this fixed by someone who knows what they're doi=
ng...</span >

That's a little surprising. The existing logic will mask out further interr=
upts
by writing a 0 into the relevant bit of 2140 (which is the INTR_EN register,
which controls which intr's get surfaced).

Your logic removes that, which means that you'll keep getting the unknown
intr's, and also you add a read from 258c. That's unlikely to matter though.

However now if we *do* ever get an interrupt for that bit in 2100 after
disabling the bit in 2140, then it'll be stuck forever. I suspect that the =
&quot;&amp;
mask&quot; should be removed at the beginning of that function [and thus th=
e read
from 2140].</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15437931131.77F8C2b.26355--

--===============0396836175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0396836175==--
