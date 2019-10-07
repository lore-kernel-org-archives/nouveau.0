From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 110714] Xorg crashes randomly because of memory leak
Date: Mon, 07 Oct 2019 14:32:28 +0000
Message-ID: <bug-110714-8800-w0UbpGqcOB@http.bugs.freedesktop.org/>
References: <bug-110714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0935344803=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-110714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0935344803==
Content-Type: multipart/alternative; boundary="15704587481.1819F5C5.928"
Content-Transfer-Encoding: 7bit


--15704587481.1819F5C5.928
Date: Mon, 7 Oct 2019 14:32:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110714

--- Comment #23 from Andrey Sychev <developer-5URONGGNgjI@public.gmane.org> ---
I can confirm that bug still persists.

My OS: Debian (Buster)
Desktop: Xfce
Apps on which crash happens: Meld (frequently, but not every time). Libre
office (rare)

In attepmt to fix crush
I have downloaded and installed

https://launchpad.net/ubuntu/+source/xorg-server/2:1.20.5+git20190820-0ubun=
tu3

but this does not help.

I can say that in my case crash does not happens after first message:

glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage

Crash happens only after several similar messages.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15704587481.1819F5C5.928
Date: Mon, 7 Oct 2019 14:32:28 +0000
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
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Xorg crashes randomly because of memory leak"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110714">bug 11071=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
developer&#64;bk.ru" title=3D"Andrey Sychev &lt;developer&#64;bk.ru&gt;"> <=
span class=3D"fn">Andrey Sychev</span></a>
</span></b>
        <pre>I can confirm that bug still persists.

My OS: Debian (Buster)
Desktop: Xfce
Apps on which crash happens: Meld (frequently, but not every time). Libre
office (rare)

In attepmt to fix crush
I have downloaded and installed

<a href=3D"https://launchpad.net/ubuntu/+source/xorg-server/2:1.20.5+git201=
90820-0ubuntu3">https://launchpad.net/ubuntu/+source/xorg-server/2:1.20.5+g=
it20190820-0ubuntu3</a>

but this does not help.

I can say that in my case crash does not happens after first message:

glamor0: GL error: GL_OUT_OF_MEMORY in glTexSubImage

Crash happens only after several similar messages.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15704587481.1819F5C5.928--

--===============0935344803==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============0935344803==--
