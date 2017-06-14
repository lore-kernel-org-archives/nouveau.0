From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101368] Nouveau regression GT218M in Kernel 4.11
	Won't Boot
Date: Wed, 14 Jun 2017 00:31:08 +0000
Message-ID: <bug-101368-8800-20VWvW1nw7@http.bugs.freedesktop.org/>
References: <bug-101368-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0215692206=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101368-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0215692206==
Content-Type: multipart/alternative; boundary="14974002680.aDCA.8987";
 charset="UTF-8"


--14974002680.aDCA.8987
Date: Wed, 14 Jun 2017 00:31:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101368

--- Comment #8 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I investigated an issue a while back that I believe is likely the same as w=
hat
you're experiencing.  I'm, unfortunately, not able to reproduce properly (l=
ong
story) on any hardware I own.

I've identified a few issues that could result in what you're seeing, howev=
er,
I have no idea why they've suddenly become a problem in 4.11.  There doesn't
seem to be an obvious commit that's the culprit here, so I can't be sure an=
y of
the issues I found will actually resolve the problem.

If you would you be able to bisect between 4.10 and 4.11, and determine the
exact commit where this starts happening, that'd be a big help.  It's
potentially not even a nouveau commit that's triggered this.

Thanks,
Ben.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14974002680.aDCA.8987
Date: Wed, 14 Jun 2017 00:31:08 +0000
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
   title=3D"NEW - Nouveau regression GT218M in Kernel 4.11 Won't Boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101368#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau regression GT218M in Kernel 4.11 Won't Boot"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101368">bug 10136=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
skeggsb&#64;gmail.com" title=3D"Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> =
<span class=3D"fn">Ben Skeggs</span></a>
</span></b>
        <pre>I investigated an issue a while back that I believe is likely =
the same as what
you're experiencing.  I'm, unfortunately, not able to reproduce properly (l=
ong
story) on any hardware I own.

I've identified a few issues that could result in what you're seeing, howev=
er,
I have no idea why they've suddenly become a problem in 4.11.  There doesn't
seem to be an obvious commit that's the culprit here, so I can't be sure an=
y of
the issues I found will actually resolve the problem.

If you would you be able to bisect between 4.10 and 4.11, and determine the
exact commit where this starts happening, that'd be a big help.  It's
potentially not even a nouveau commit that's triggered this.

Thanks,
Ben.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14974002680.aDCA.8987--

--===============0215692206==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0215692206==--
