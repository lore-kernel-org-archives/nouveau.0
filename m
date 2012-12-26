From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 50121] [Regression] Since kernel v3.5 several cards
 fail to resume, introduced by: 'convert to exec engine,
 and improve channel sync'
Date: Wed, 26 Dec 2012 17:11:40 +0000
Message-ID: <bug-50121-8800-MBgzZ65Ww7@http.bugs.freedesktop.org/>
References: <bug-50121-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1777847386=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-50121-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1777847386==
Content-Type: multipart/alternative; boundary="1356541900.bd5Bccf73.11853"; charset="us-ascii"


--1356541900.bd5Bccf73.11853
Date: Wed, 26 Dec 2012 17:11:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D50121

--- Comment #42 from Rapha=C3=ABl Droz <gibboris-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
perfect!
the last patch did the trick (tested with vanilla 3.7).

I hibernated several times, even with a running instance of glxgears.
No problem anymore.

On my side the startup time is not especially long.

thanks

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1356541900.bd5Bccf73.11853
Date: Wed, 26 Dec 2012 17:11:40 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [Regression] Since kernel v3.5 several cards fail to =
resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50121#c42">Commen=
t # 42</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [Regression] Since kernel v3.5 several cards fail to =
resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D50121">bug 50121<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
gibboris&#64;gmail.com" title=3D"Rapha=C3=ABl Droz &lt;gibboris&#64;gmail.c=
om&gt;"> <span class=3D"fn">Rapha=C3=ABl Droz</span></a>
</span></b>
        <pre>perfect!
the last patch did the trick (tested with vanilla 3.7).

I hibernated several times, even with a running instance of glxgears.
No problem anymore.

On my side the startup time is not especially long.

thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
=20=20=20=20=20=20
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356541900.bd5Bccf73.11853--

--===============1777847386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1777847386==--
