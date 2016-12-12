From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99033] [NV67] Incomplete implementation of OpenGL 2.1
Date: Mon, 12 Dec 2016 21:06:37 +0000
Message-ID: <bug-99033-8800-CnNVjSEmlh@http.bugs.freedesktop.org/>
References: <bug-99033-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0745850565=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99033-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0745850565==
Content-Type: multipart/alternative; boundary="14815767970.2d5fd979b.16795";
 charset="UTF-8"


--14815767970.2d5fd979b.16795
Date: Mon, 12 Dec 2016 21:06:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99033

--- Comment #7 from Ilya Indigo <13ilya-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
> Looking at the OpenGL 2.1 specification, I haven=E2=80=99t been able to f=
ind any extension, that was promoted to a core feature in OpenGL <=3D 2.1, =
that is not implemented by Nouveau.

If this card is able to support later expansion, which should be implemente=
d to
the later video card, which shows a list of nvidia, why not add them to this
card?

> could you tell us which extensions are actually needed? I am sure you can=
 understand, that we can't simply implement all of the missing ones in a wi=
nk of an eye, so we have to prefer the important ones.

I thought, if in Mesa for nouveau declared support for OpenGL 4.1 at least,=
 the
increasingly younger expansion should be implemented already, just dependin=
g on
the graphics card will connect them to a different set?

Or something I do not understand, and for each GPU you write from scratch e=
very
extension?

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14815767970.2d5fd979b.16795
Date: Mon, 12 Dec 2016 21:06:37 +0000
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
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] Incomplete implementation of OpenGL 2.1"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99033">bug 99033<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
13ilya&#64;gmail.com" title=3D"Ilya Indigo &lt;13ilya&#64;gmail.com&gt;"> <=
span class=3D"fn">Ilya Indigo</span></a>
</span></b>
        <pre><span class=3D"quote">&gt; Looking at the OpenGL 2.1 specifica=
tion, I haven=E2=80=99t been able to find any extension, that was promoted =
to a core feature in OpenGL &lt;=3D 2.1, that is not implemented by Nouveau=
.</span >

If this card is able to support later expansion, which should be implemente=
d to
the later video card, which shows a list of nvidia, why not add them to this
card?

<span class=3D"quote">&gt; could you tell us which extensions are actually =
needed? I am sure you can understand, that we can't simply implement all of=
 the missing ones in a wink of an eye, so we have to prefer the important o=
nes.</span >

I thought, if in Mesa for nouveau declared support for OpenGL 4.1 at least,=
 the
increasingly younger expansion should be implemented already, just dependin=
g on
the graphics card will connect them to a different set?

Or something I do not understand, and for each GPU you write from scratch e=
very
extension?</pre>
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

--14815767970.2d5fd979b.16795--

--===============0745850565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0745850565==--
