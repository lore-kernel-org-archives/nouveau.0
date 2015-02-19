From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87819] [NVAC] EQ overflowing
Date: Thu, 19 Feb 2015 09:17:35 +0000
Message-ID: <bug-87819-8800-PboJVAA2jj@http.bugs.freedesktop.org/>
References: <bug-87819-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1659291872=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87819-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1659291872==
Content-Type: multipart/alternative; boundary="1424337455.77eFdF21.22334"; charset="UTF-8"


--1424337455.77eFdF21.22334
Date: Thu, 19 Feb 2015 09:17:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D87819

--- Comment #21 from Stuart Longland <stuartl-3e+Fe6x+Dsh6S/UX/emfpkB+6BGkLq7r@public.gmane.org> ---
(In reply to Pierre Moreau from comment #20)
> (In reply to Stuart Longland from comment #17)
> > So far, so good.  I've been tinkering for an hour and haven't yet trigg=
ered
> > the EQ overflow.
>=20
> Good to hear! :)
>=20
> > Whatever went upstream between 3.18 and 3.19 seems to be doing the tric=
k.
>=20
> There have some patches specific for NVAA/AC cards - see commits
> [=E2=80=A6] but it was fixing an issue
> where the laptop will hang during Nouveau's initialisation of the card.

Ahh, I think I've had that bug too.  Basically I'd power the laptop on and =
the
machine would get as far as loading drivers then hang.  I had it on my TODO
list to eventually track down which driver, but lately I've noticed this has
stopped happening.

So slowly we're getting the upper hand in this fight.

It's a pity that Nvidia don't direct more resources to supporting the Nouve=
au
driver.  I've vowed to never buy an Nvidia card again due to their poor sup=
port
of their cards.  (I don't consider a proprietary driver as "support", more a
cop-out and a support head-ache.)

It's thanks to teams like Nouveau that I can make reasonable use of the two
Nvidia-based systems I have at all.
For this, I thank-you.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1424337455.77eFdF21.22334
Date: Thu, 19 Feb 2015 09:17:35 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87819#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVAC] EQ overflowing"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D87819">bug 87819<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stuartl&#64;longlandclan.yi.org" title=3D"Stuart Longland &lt;stuartl&#64;l=
onglandclan.yi.org&gt;"> <span class=3D"fn">Stuart Longland</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href=3D"show_bug.cgi?id=3D8=
7819#c20">comment #20</a>)
<span class=3D"quote">&gt; (In reply to Stuart Longland from <a href=3D"sho=
w_bug.cgi?id=3D87819#c17">comment #17</a>)
&gt; &gt; So far, so good.  I've been tinkering for an hour and haven't yet=
 triggered
&gt; &gt; the EQ overflow.
&gt;=20
&gt; Good to hear! :)
&gt;=20
&gt; &gt; Whatever went upstream between 3.18 and 3.19 seems to be doing th=
e trick.
&gt;=20
&gt; There have some patches specific for NVAA/AC cards - see commits
&gt; [=E2=80=A6] but it was fixing an issue
&gt; where the laptop will hang during Nouveau's initialisation of the card=
.</span >

Ahh, I think I've had that bug too.  Basically I'd power the laptop on and =
the
machine would get as far as loading drivers then hang.  I had it on my TODO
list to eventually track down which driver, but lately I've noticed this has
stopped happening.

So slowly we're getting the upper hand in this fight.

It's a pity that Nvidia don't direct more resources to supporting the Nouve=
au
driver.  I've vowed to never buy an Nvidia card again due to their poor sup=
port
of their cards.  (I don't consider a proprietary driver as &quot;support&qu=
ot;, more a
cop-out and a support head-ache.)

It's thanks to teams like Nouveau that I can make reasonable use of the two
Nvidia-based systems I have at all.
For this, I thank-you.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424337455.77eFdF21.22334--

--===============1659291872==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1659291872==--
