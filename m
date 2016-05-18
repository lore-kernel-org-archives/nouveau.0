From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93887] [NV96] Amilo Xi 3650: G96M [GeForce 9600M
 GT]: HDMI monitor stays black after s2ram
Date: Wed, 18 May 2016 10:48:27 +0000
Message-ID: <bug-93887-8800-0IPmlo3yAi@http.bugs.freedesktop.org/>
References: <bug-93887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1420752173=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1420752173==
Content-Type: multipart/alternative; boundary="14635685070.ffFfd8ca.23521";
 charset="UTF-8"


--14635685070.ffFfd8ca.23521
Date: Wed, 18 May 2016 10:48:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D93887

--- Comment #45 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Well, before the fixes get incorporated to mainline, I first have to find o=
ut
what the fixes are, and that could take really any amount of time. In any c=
ase,
I=E2=80=99ll post patches here for you to test if I find anything.

I had a quick look last time, and got some MMIOtraces from my laptop=E2=80=
=99s G96 to
compare, but that=E2=80=99s about it. I won=E2=80=99t have much free time u=
ntil July, but I=E2=80=99ll
give it a try from time to time.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14635685070.ffFfd8ca.23521
Date: Wed, 18 May 2016 10:48:27 +0000
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
   title=3D"NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monit=
or stays black after s2ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93887#c45">Commen=
t # 45</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV96] Amilo Xi 3650: G96M [GeForce 9600M GT]: HDMI monit=
or stays black after s2ram"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D93887">bug 93887<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>Well, before the fixes get incorporated to mainline, I first h=
ave to find out
what the fixes are, and that could take really any amount of time. In any c=
ase,
I=E2=80=99ll post patches here for you to test if I find anything.

I had a quick look last time, and got some MMIOtraces from my laptop=E2=80=
=99s G96 to
compare, but that=E2=80=99s about it. I won=E2=80=99t have much free time u=
ntil July, but I=E2=80=99ll
give it a try from time to time.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14635685070.ffFfd8ca.23521--

--===============1420752173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1420752173==--
