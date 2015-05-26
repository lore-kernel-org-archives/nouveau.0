From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Tue, 26 May 2015 14:39:46 +0000
Message-ID: <bug-90626-8800-YixWnQEaTv@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1576040224=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1576040224==
Content-Type: multipart/alternative; boundary="1432651185.fBd6DDE2.996"; charset="UTF-8"


--1432651185.fBd6DDE2.996
Date: Tue, 26 May 2015 14:39:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90626

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Ren=C3=A9 from comment #3)
> Alright, trying to break it down regarding HP ZBook 15 and the nouveau
> driver:
> - I'm currently on 3.16.7 and have a working nouveau driver. I will provi=
de
> the needed attachments for exactly that one.
> - Kernel 3.18: This is last working kernel I found.
> - Kernel 3.19: The issue #89047 git introduced, which I could reproduce, =
and
> which has been apparently fixed by Ben in commit
> 4195f40685a5f2783b4decece13ed740b61ee038. I mentioned it just to ensure t=
his
> report here is not the same issue to not mark it duplicate.
> - Kernel 4.1 RC4: This is a kernel definitely containing the fix committed
> above and therefore the next stage to be tested for me. In kernel 4.1 RC4=
 I
> get the problem reported here, which is different from that in issue #890=
47.

Right, I realize it's a different issue... but could have been caused by the
same commit :)

Assuming nothing obvious comes to mind when you post the other info, doing a
bisect between 3.18 and 3.19 will be the surest way to get this resolved.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1432651185.fBd6DDE2.996
Date: Tue, 26 May 2015 14:39:45 +0000
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
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;=3D 4.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90626">bug 90626<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Ren=C3=A9 from <a href=3D"show_bug.cgi?id=3D90626=
#c3">comment #3</a>)
<span class=3D"quote">&gt; Alright, trying to break it down regarding HP ZB=
ook 15 and the nouveau
&gt; driver:
&gt; - I'm currently on 3.16.7 and have a working nouveau driver. I will pr=
ovide
&gt; the needed attachments for exactly that one.
&gt; - Kernel 3.18: This is last working kernel I found.
&gt; - Kernel 3.19: The issue #89047 git introduced, which I could reproduc=
e, and
&gt; which has been apparently fixed by Ben in commit
&gt; 4195f40685a5f2783b4decece13ed740b61ee038. I mentioned it just to ensur=
e this
&gt; report here is not the same issue to not mark it duplicate.
&gt; - Kernel 4.1 RC4: This is a kernel definitely containing the fix commi=
tted
&gt; above and therefore the next stage to be tested for me. In kernel 4.1 =
RC4 I
&gt; get the problem reported here, which is different from that in issue #=
89047.</span >

Right, I realize it's a different issue... but could have been caused by the
same commit :)

Assuming nothing obvious comes to mind when you post the other info, doing a
bisect between 3.18 and 3.19 will be the surest way to get this resolved.</=
pre>
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

--1432651185.fBd6DDE2.996--

--===============1576040224==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1576040224==--
