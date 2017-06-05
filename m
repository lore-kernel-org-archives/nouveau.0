From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101184] [NVE6] [bisected] Panic on boot with GK106
Date: Mon, 05 Jun 2017 12:55:03 +0000
Message-ID: <bug-101184-8800-10SZZ3EHZ2@http.bugs.freedesktop.org/>
References: <bug-101184-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1408134803=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101184-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1408134803==
Content-Type: multipart/alternative; boundary="14966673020.5bddaE.20100";
 charset="UTF-8"


--14966673020.5bddaE.20100
Date: Mon, 5 Jun 2017 12:55:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101184

--- Comment #7 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ben Skeggs from comment #6)
> Created attachment 131704 [details] [review]
> test fix
>=20
> Can you give this patch a try please?
>=20
> I'm not 100% convinced this is the issue here, but I'd like to rule it
> in/out.  I have identical hardware to a couple of the other reporters of
> this issue, but have been completely unable to reproduce for unknown reas=
ons.

I can reproduce the issue and I never got the crash with this patch, but I =
also
only tried a few times. Maybe if you ask others with that issue to try it o=
ut
you get enough confirmations?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14966673020.5bddaE.20100
Date: Mon, 5 Jun 2017 12:55:02 +0000
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
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6] [bisected] Panic on boot with GK106"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101184">bug 10118=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(In reply to Ben Skeggs from <a href=3D"show_bug.cgi?id=3D1011=
84#c6">comment #6</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D131704" name=3D"attach_131704" title=3D"test fix">attachment 131704=
</a> <a href=3D"attachment.cgi?id=3D131704&amp;action=3Dedit" title=3D"test=
 fix">[details]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=
=3D101184&amp;attachment=3D131704'>[review]</a> [review]
&gt; test fix
&gt;=20
&gt; Can you give this patch a try please?
&gt;=20
&gt; I'm not 100% convinced this is the issue here, but I'd like to rule it
&gt; in/out.  I have identical hardware to a couple of the other reporters =
of
&gt; this issue, but have been completely unable to reproduce for unknown r=
easons.</span >

I can reproduce the issue and I never got the crash with this patch, but I =
also
only tried a few times. Maybe if you ask others with that issue to try it o=
ut
you get enough confirmations?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14966673020.5bddaE.20100--

--===============1408134803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1408134803==--
