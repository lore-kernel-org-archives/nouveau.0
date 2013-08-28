From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50375] [NV1A] KMS/fbcon accel failing after
 scrolling/tty switch
Date: Wed, 28 Aug 2013 17:31:09 +0000
Message-ID: <bug-50375-8800-6nVuFpvAlS@http.bugs.freedesktop.org/>
References: <bug-50375-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1263792231=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50375-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1263792231==
Content-Type: multipart/alternative; boundary="1377711069.d6Cf401.20022"; charset="us-ascii"


--1377711069.d6Cf401.20022
Date: Wed, 28 Aug 2013 17:31:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D50375

--- Comment #5 from Bruno <bonbons67-H4aWS73dXupiYsDpGMXq6A@public.gmane.org> ---
(In reply to comment #4)
> Created attachment 84758 [details] [review]
> patch to treat nv1a as pre-nv17
>=20
> Generationally, NV1A is pre-NV17. However in a bunch of places in the
> nouveau code, this wasn't recognized. I believe this patch should help, at
> least with something. Mind trying it out? Should apply on top of a git-ish
> kernel (but probably doesn't really matter).

This patch gets the signal to the monitor.

Tested-by: Bruno Pr=C3=A9mont <bonbons-ud5FBsm0p/xEiooADzr8i9i2O/JbrIOy@public.gmane.org>

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1377711069.d6Cf401.20022
Date: Wed, 28 Aug 2013 17:31:09 +0000
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
   title=3D"NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty sw=
itch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50375#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV1A] KMS/fbcon accel failing after scrolling/tty sw=
itch"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50375">bug 50375<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bonbons67&#64;internet.lu" title=3D"Bruno &lt;bonbons67&#64;internet.lu&gt;=
"> <span class=3D"fn">Bruno</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D50375#c4">comment #4=
</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D84758" name=3D"attach_84758" title=3D"patch to treat nv1a as pre-nv=
17">attachment 84758</a> <a href=3D"attachment.cgi?id=3D84758&amp;action=3D=
edit" title=3D"patch to treat nv1a as pre-nv17">[details]</a></span> <a hre=
f=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D50375&amp;attachment=3D84758'>[r=
eview]</a> [review]
&gt; patch to treat nv1a as pre-nv17
&gt;=20
&gt; Generationally, NV1A is pre-NV17. However in a bunch of places in the
&gt; nouveau code, this wasn't recognized. I believe this patch should help=
, at
&gt; least with something. Mind trying it out? Should apply on top of a git=
-ish
&gt; kernel (but probably doesn't really matter).</span >

This patch gets the signal to the monitor.

Tested-by: Bruno Pr=C3=A9mont &lt;<a href=3D"mailto:bonbons&#64;linux-vserv=
er.org">bonbons&#64;linux-vserver.org</a>&gt;</pre>
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

--1377711069.d6Cf401.20022--

--===============1263792231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1263792231==--
