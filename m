From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 103217] Recent noveau causes errors with scilab
 5.5.2 on NVIDIA G84GL [Quadro FX 570]
Date: Wed, 11 Oct 2017 14:03:33 +0000
Message-ID: <bug-103217-8800-TOUCInrzlJ@http.bugs.freedesktop.org/>
References: <bug-103217-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1132801916=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-103217-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1132801916==
Content-Type: multipart/alternative; boundary="15077306130.8cDdE6.10038";
 charset="UTF-8"


--15077306130.8cDdE6.10038
Date: Wed, 11 Oct 2017 14:03:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D103217

--- Comment #4 from sergio.callegari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
May be related, may be two independent issues. The way in which the issue
triggers is different:

- with nouveau, scilab complains at start up
- with llvmpipe, scilab does not complain at start up but throws java excep=
tion
as soon as you try to make a plot.

The two have in common some infrastructure code, I guess, so the issue may =
lay
there. Having both nouveau and the software rendering broken for this usage
case at the same time is a bit unfortunate.

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15077306130.8cDdE6.10038
Date: Wed, 11 Oct 2017 14:03:33 +0000
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
   title=3D"NEW - Recent noveau causes errors with scilab 5.5.2 on NVIDIA G=
84GL [Quadro FX 570]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103217#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Recent noveau causes errors with scilab 5.5.2 on NVIDIA G=
84GL [Quadro FX 570]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D103217">bug 10321=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sergio.callegari&#64;gmail.com" title=3D"sergio.callegari&#64;gmail.com">se=
rgio.callegari&#64;gmail.com</a>
</span></b>
        <pre>May be related, may be two independent issues. The way in whic=
h the issue
triggers is different:

- with nouveau, scilab complains at start up
- with llvmpipe, scilab does not complain at start up but throws java excep=
tion
as soon as you try to make a plot.

The two have in common some infrastructure code, I guess, so the issue may =
lay
there. Having both nouveau and the software rendering broken for this usage
case at the same time is a bit unfortunate.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15077306130.8cDdE6.10038--

--===============1132801916==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1132801916==--
