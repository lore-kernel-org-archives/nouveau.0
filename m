From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97438] Running a lot of Firefox instances causes
 kernel page fault.
Date: Sun, 26 Feb 2017 11:24:49 +0000
Message-ID: <bug-97438-8800-PfWRKuyn7M@http.bugs.freedesktop.org/>
References: <bug-97438-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0896517286=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97438-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0896517286==
Content-Type: multipart/alternative; boundary="14881082893.ED180Fe.403";
 charset="UTF-8"


--14881082893.ED180Fe.403
Date: Sun, 26 Feb 2017 11:24:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97438

--- Comment #10 from Maris Nartiss <maris.nartiss-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Ben Skeggs from comment #7)
> Give this[1] patch a try, it might be relevant.
>=20
> [1]
> https://github.com/skeggsb/nouveau/commit/
> 8135089922f84c4ef7b47aeaa707490a2ee29a1d

I experienced a few crashes with similarly looking backtraces with lots of =
FF
and KDE5 Okular et al. windows open. Applied this patch to kernel 4.9.6 and
since then haven't had any issues. Although I had no reliable way how repro=
duce
the crash to 100% confirm patch's effectiveness, at least the patch seems to
not cause any bad side effects.

Tested on ~AMD64 Gentoo with G98M [Quadro NVS 160M]

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14881082893.ED180Fe.403
Date: Sun, 26 Feb 2017 11:24:49 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Running a lot of Firefox instances causes kernel pag=
e fault."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438#c10">Commen=
t # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Running a lot of Firefox instances causes kernel pag=
e fault."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97438">bug 97438<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
maris.nartiss&#64;gmail.com" title=3D"Maris Nartiss &lt;maris.nartiss&#64;g=
mail.com&gt;"> <span class=3D"fn">Maris Nartiss</span></a>
</span></b>
        <pre>(In reply to Ben Skeggs from <a href=3D"show_bug.cgi?id=3D9743=
8#c7">comment #7</a>)
<span class=3D"quote">&gt; Give this[1] patch a try, it might be relevant.
&gt;=20
&gt; [1]
&gt; <a href=3D"https://github.com/skeggsb/nouveau/commit/">https://github.=
com/skeggsb/nouveau/commit/</a>
&gt; 8135089922f84c4ef7b47aeaa707490a2ee29a1d</span >

I experienced a few crashes with similarly looking backtraces with lots of =
FF
and KDE5 Okular et al. windows open. Applied this patch to kernel 4.9.6 and
since then haven't had any issues. Although I had no reliable way how repro=
duce
the crash to 100% confirm patch's effectiveness, at least the patch seems to
not cause any bad side effects.

Tested on ~AMD64 Gentoo with G98M [Quadro NVS 160M]</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14881082893.ED180Fe.403--

--===============0896517286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0896517286==--
