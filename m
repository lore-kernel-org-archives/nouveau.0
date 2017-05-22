From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Mon, 22 May 2017 18:47:39 +0000
Message-ID: <bug-89664-8800-gpe2twR26W@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0659148319=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89664-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0659148319==
Content-Type: multipart/alternative; boundary="14954788590.8bEb6ae76.8181";
 charset="UTF-8"


--14954788590.8bEb6ae76.8181
Date: Mon, 22 May 2017 18:47:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #24 from Miko=C5=82aj =C5=9Awi=C4=85tek <mikolaj.swiatek@gmail.=
com> ---
(In reply to Ilia Mirkin from comment #23)
> Have a look at bug #100676. Is it the same issue? (Please test the patches
> that were provided there.)

I don't *think* it's the exact same issue. The screen photo in that report =
is
similar to what I see, though my text output is completely unintelligible,
rather than just slightly corrupted. The reason I thought it was this bug w=
as
that the log messages about unknown connectors and failing to create encode=
rs
are identical with Omar's in my case.

In any event, I've built the kernel module from Ben's tree and it didn't ch=
ange
anything at all, same behaviour.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14954788590.8bEb6ae76.8181
Date: Mon, 22 May 2017 18:47:39 +0000
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
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664">bug 89664<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mikolaj.swiatek&#64;gmail.com" title=3D"Miko=C5=82aj =C5=9Awi=C4=85tek &lt;=
mikolaj.swiatek&#64;gmail.com&gt;"> <span class=3D"fn">Miko=C5=82aj =C5=9Aw=
i=C4=85tek</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D896=
64#c23">comment #23</a>)
<span class=3D"quote">&gt; Have a look at <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - gp104 - messy(random green and/or missing pixel lines) th=
en no output at and after boot"
   href=3D"show_bug.cgi?id=3D100676">bug #100676</a>. Is it the same issue?=
 (Please test the patches
&gt; that were provided there.)</span >

I don't *think* it's the exact same issue. The screen photo in that report =
is
similar to what I see, though my text output is completely unintelligible,
rather than just slightly corrupted. The reason I thought it was this bug w=
as
that the log messages about unknown connectors and failing to create encode=
rs
are identical with Omar's in my case.

In any event, I've built the kernel module from Ben's tree and it didn't ch=
ange
anything at all, same behaviour.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14954788590.8bEb6ae76.8181--

--===============0659148319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0659148319==--
