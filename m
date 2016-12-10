From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98582] nouveau on a GM108 fails to resume properly
 from suspension
Date: Sat, 10 Dec 2016 23:17:53 +0000
Message-ID: <bug-98582-8800-OqtJaFXS1a@http.bugs.freedesktop.org/>
References: <bug-98582-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1081588063=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98582-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1081588063==
Content-Type: multipart/alternative; boundary="14814118730.8aD2CbaE1.27550";
 charset="UTF-8"


--14814118730.8aD2CbaE1.27550
Date: Sat, 10 Dec 2016 23:17:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98582

--- Comment #10 from hoboprimate-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
(In reply to Peter Wu from comment #9)
> Possibly a duplicate of bug 98398, can you try the ACPICA patches at
> https://bugs.acpica.org/show_bug.cgi?id=3D1333#c45

Sorry for late replying, but applying the 3 patches in compiled kernel vers=
ion
4.9 fixes the problem.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14814118730.8aD2CbaE1.27550
Date: Sat, 10 Dec 2016 23:17:53 +0000
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
   title=3D"NEW - nouveau on a GM108 fails to resume properly from suspensi=
on"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98582#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - nouveau on a GM108 fails to resume properly from suspensi=
on"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98582">bug 98582<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hoboprimate&#64;gmail.com" title=3D"hoboprimate&#64;gmail.com">hoboprimate&=
#64;gmail.com</a>
</span></b>
        <pre>(In reply to Peter Wu from <a href=3D"show_bug.cgi?id=3D98582#=
c9">comment #9</a>)
<span class=3D"quote">&gt; Possibly a duplicate of <a class=3D"bz_bug_link=
=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - Acer Aspire V7-582PG (Haswell, GTX 750M) fails to po=
wer off GPU with runtime PM"
   href=3D"show_bug.cgi?id=3D98398">bug 98398</a>, can you try the ACPICA p=
atches at
&gt; <a href=3D"https://bugs.acpica.org/show_bug.cgi?id=3D1333#c45">https:/=
/bugs.acpica.org/show_bug.cgi?id=3D1333#c45</a></span >

Sorry for late replying, but applying the 3 patches in compiled kernel vers=
ion
4.9 fixes the problem.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14814118730.8aD2CbaE1.27550--

--===============1081588063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1081588063==--
