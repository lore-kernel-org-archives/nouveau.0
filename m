From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98039] KMail crash on starting (nouveau-related)
Date: Sun, 11 Dec 2016 22:48:43 +0000
Message-ID: <bug-98039-8800-XhRnbfrIQu@http.bugs.freedesktop.org/>
References: <bug-98039-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1496375761=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98039-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1496375761==
Content-Type: multipart/alternative; boundary="14814965231.2Fe8.11351";
 charset="UTF-8"


--14814965231.2Fe8.11351
Date: Sun, 11 Dec 2016 22:48:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98039

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Tomasz Pawe=C5=82 Gajc from comment #12)
> (In reply to Ilia Mirkin from comment #11)
> > Tomasz - please don't go around messing about with the bugtracker.
>=20
> Thanks Ilia, for cleaning all the related bugs (yes i did my job carefull=
y,
> and read all the attached logs etc),

At least a bunch were unrelated. It may be hard to tell because you're not
intimately familiar with how nouveau works, as well as the various differen=
ces
across generations.

> so next reporters will create new bugs,
> instead of get clear information like,

Oftentimes bugs look identical, but they turn out to be quite different. I =
want
every bug reporter to open a fresh bug. If it's identical, I'll mark it as a
dup. Integers are cheap, I don't think the fd.o bugtracker is going to run =
out
of id's too soon.

(Sorry, Ren=C3=A9, for all this spam that has been thrust upon you.)

> Mulit-Threading OpenGL is broken in nouveau DRI drivers,=20
> Propsed solutions are:
> * use LLVMpipe DRI driver
> * buy AMD/intel gfx card
> * uninstall Plasma and live in TTY cave

To be clear - access from multiple threads (or multiple GL contexts) isn't =
the
issue - it's simultaneously calling into the driver from multiple threads w=
hich
doesn't work. (The distinction may be subtle, esp to the layman, I'm just b=
eing
pedantic because GL is complicated and has lots of different usage models.)

I'd be happy to put up a statement on nouveau.freedesktop.org about the
situation if you can send me a private email (or one to the ML if you prefe=
r)
with some specifics about what is problematic. Being unfamiliar with the Qt=
/KDE
world, it's not immediately apparent to me.

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14814965231.2Fe8.11351
Date: Sun, 11 Dec 2016 22:48:43 +0000
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
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - KMail crash on starting (nouveau-related)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98039">bug 98039<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Tomasz Pawe=C5=82 Gajc from <a href=3D"show_bug.c=
gi?id=3D98039#c12">comment #12</a>)
<span class=3D"quote">&gt; (In reply to Ilia Mirkin from <a href=3D"show_bu=
g.cgi?id=3D98039#c11">comment #11</a>)
&gt; &gt; Tomasz - please don't go around messing about with the bugtracker.
&gt;=20
&gt; Thanks Ilia, for cleaning all the related bugs (yes i did my job caref=
ully,
&gt; and read all the attached logs etc),</span >

At least a bunch were unrelated. It may be hard to tell because you're not
intimately familiar with how nouveau works, as well as the various differen=
ces
across generations.

<span class=3D"quote">&gt; so next reporters will create new bugs,
&gt; instead of get clear information like,</span >

Oftentimes bugs look identical, but they turn out to be quite different. I =
want
every bug reporter to open a fresh bug. If it's identical, I'll mark it as a
dup. Integers are cheap, I don't think the fd.o bugtracker is going to run =
out
of id's too soon.

(Sorry, Ren=C3=A9, for all this spam that has been thrust upon you.)

<span class=3D"quote">&gt; Mulit-Threading OpenGL is broken in nouveau DRI =
drivers,=20
&gt; Propsed solutions are:
&gt; * use LLVMpipe DRI driver
&gt; * buy AMD/intel gfx card
&gt; * uninstall Plasma and live in TTY cave</span >

To be clear - access from multiple threads (or multiple GL contexts) isn't =
the
issue - it's simultaneously calling into the driver from multiple threads w=
hich
doesn't work. (The distinction may be subtle, esp to the layman, I'm just b=
eing
pedantic because GL is complicated and has lots of different usage models.)

I'd be happy to put up a statement on nouveau.freedesktop.org about the
situation if you can send me a private email (or one to the ML if you prefe=
r)
with some specifics about what is problematic. Being unfamiliar with the Qt=
/KDE
world, it's not immediately apparent to me.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14814965231.2Fe8.11351--

--===============1496375761==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1496375761==--
