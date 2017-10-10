From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 102381] [REGRESSION] GK107GLM fails to perform
 runtime resume on W530
Date: Tue, 10 Oct 2017 20:38:59 +0000
Message-ID: <bug-102381-8800-OBq1Qi1qZP@http.bugs.freedesktop.org/>
References: <bug-102381-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0533954252=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-102381-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0533954252==
Content-Type: multipart/alternative; boundary="15076679391.0d25f9ADe.2589";
 charset="UTF-8"


--15076679391.0d25f9ADe.2589
Date: Tue, 10 Oct 2017 20:38:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102381

--- Comment #1 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
I can confirm the issue on 4.14.0-rc3, with a Haswell + GK107 setup (MacBook
Pro 11,3). And someone else reported the same issue, still with a GK107 in a
different ThinkPad here: https://bugzilla.kernel.org/show_bug.cgi?id=3D1971=
03

@Lyude: Did you had any time to try to bisect it? Otherwise, I might give i=
t a
try over the weekend, or early next week.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15076679391.0d25f9ADe.2589
Date: Tue, 10 Oct 2017 20:38:59 +0000
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
   title=3D"NEW - [REGRESSION] GK107GLM fails to perform runtime resume on =
W530"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102381#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [REGRESSION] GK107GLM fails to perform runtime resume on =
W530"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102381">bug 10238=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pierre.morrow&#64;free.fr" title=3D"Pierre Moreau &lt;pierre.morrow&#64;fre=
e.fr&gt;"> <span class=3D"fn">Pierre Moreau</span></a>
</span></b>
        <pre>I can confirm the issue on 4.14.0-rc3, with a Haswell + GK107 =
setup (MacBook
Pro 11,3). And someone else reported the same issue, still with a GK107 in a
different ThinkPad here: <a href=3D"https://bugzilla.kernel.org/show_bug.cg=
i?id=3D197103">https://bugzilla.kernel.org/show_bug.cgi?id=3D197103</a>

&#64;Lyude: Did you had any time to try to bisect it? Otherwise, I might gi=
ve it a
try over the weekend, or early next week.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15076679391.0d25f9ADe.2589--

--===============0533954252==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0533954252==--
