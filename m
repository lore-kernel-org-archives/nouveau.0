From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107016] Gpio error only from kernel higher as 4.x
 (k2000m; 0x0e73b0a2; version 80.07.40.00.02)
Date: Mon, 25 Jun 2018 03:08:12 +0000
Message-ID: <bug-107016-8800-FZ14K9FJ80@http.bugs.freedesktop.org/>
References: <bug-107016-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1022301233=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-107016-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1022301233==
Content-Type: multipart/alternative; boundary="15298960910.E0CA17.23004"
Content-Transfer-Encoding: 7bit


--15298960910.E0CA17.23004
Date: Mon, 25 Jun 2018 03:08:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107016

--- Comment #7 from atirage21 <tothsoft-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to atirage21 from comment #4)
> (In reply to Karol Herbst from comment #3)
> > can you print the output of "nvapeek 0x20340 0x8" please?
>=20
> Please send me exatly guide how, because command "nvapeek 0x20340 0x8" not
> found.

Output from mmiotrace:
R 4 127.904981 11 0xd8309624 0x203406e 0x0 0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15298960910.E0CA17.23004
Date: Mon, 25 Jun 2018 03:08:11 +0000
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
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Gpio error only from kernel higher as 4.x (k2000m; 0=
x0e73b0a2; version 80.07.40.00.02)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107016">bug 10701=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tothsoft&#64;gmail.com" title=3D"atirage21 &lt;tothsoft&#64;gmail.com&gt;">=
 <span class=3D"fn">atirage21</span></a>
</span></b>
        <pre>(In reply to atirage21 from <a href=3D"show_bug.cgi?id=3D10701=
6#c4">comment #4</a>)
<span class=3D"quote">&gt; (In reply to Karol Herbst from <a href=3D"show_b=
ug.cgi?id=3D107016#c3">comment #3</a>)
&gt; &gt; can you print the output of &quot;nvapeek 0x20340 0x8&quot; pleas=
e?
&gt;=20
&gt; Please send me exatly guide how, because command &quot;nvapeek 0x20340=
 0x8&quot; not
&gt; found.</span >

Output from mmiotrace:
R 4 127.904981 11 0xd8309624 0x203406e 0x0 0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15298960910.E0CA17.23004--

--===============1022301233==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1022301233==--
