From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64904] [BISECTED] nouveau,
 nv50: External VGA not detected anymore
Date: Sat, 25 May 2013 08:12:38 +0000
Message-ID: <bug-64904-8800-vv8IIvzdw0@http.bugs.freedesktop.org/>
References: <bug-64904-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1542019773=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64904-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1542019773==
Content-Type: multipart/alternative; boundary="1369469558.E2E81.7308"; charset="us-ascii"


--1369469558.E2E81.7308
Date: Sat, 25 May 2013 08:12:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64904

--- Comment #5 from Gerhard Br=C3=A4unlich <wippbox-hi6Y0CQ0nG0@public.gmane.org> ---
(In reply to comment #4)
> Created attachment 79775 [details] [review]
> Increase the delay during dac sense
>=20
> Take a look at the patch to clear any confusion. It should apply cleanly =
on
> top of the 3.9 branch

OK thank you! I don't have my thinkpad with me at the moment. But I will te=
st
the patch tomorrow.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1369469558.E2E81.7308
Date: Sat, 25 May 2013 08:12:38 +0000
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
   title=3D"NEW --- - [BISECTED] nouveau, nv50: External VGA not detected a=
nymore"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64904#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [BISECTED] nouveau, nv50: External VGA not detected a=
nymore"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64904">bug 64904<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wippbox&#64;gmx.net" title=3D"Gerhard Br=C3=A4unlich &lt;wippbox&#64;gmx.ne=
t&gt;"> <span class=3D"fn">Gerhard Br=C3=A4unlich</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D64904#c4">comment #4=
</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D79775" name=3D"attach_79775" title=3D"Increase the delay during dac=
 sense">attachment 79775</a> <a href=3D"attachment.cgi?id=3D79775&amp;actio=
n=3Dedit" title=3D"Increase the delay during dac sense">[details]</a></span=
> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D64904&amp;attachment=3D7=
9775'>[review]</a> [review]
&gt; Increase the delay during dac sense
&gt;=20
&gt; Take a look at the patch to clear any confusion. It should apply clean=
ly on
&gt; top of the 3.9 branch</span >

OK thank you! I don't have my thinkpad with me at the moment. But I will te=
st
the patch tomorrow.</pre>
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

--1369469558.E2E81.7308--

--===============1542019773==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1542019773==--
