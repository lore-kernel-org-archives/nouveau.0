From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Tue, 01 Oct 2013 16:34:25 +0000
Message-ID: <bug-64774-8800-eRXwiZUWOP@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1331558900=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1331558900==
Content-Type: multipart/alternative; boundary="1380645265.dAfCE2.26840"; charset="us-ascii"


--1380645265.dAfCE2.26840
Date: Tue, 1 Oct 2013 16:34:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #24 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

Some comments here.. this bug is still being discussed on the mailing lists,
and Ben Skeggs said he'll take a look at the kernel side fixes soon.

Also good to know: I'm able to reliably reproduce this kernel crash with Fe=
dora
18 userspace/xorg, but not with Fedora 19 userspace/xorg.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1380645265.dAfCE2.26840
Date: Tue, 1 Oct 2013 16:34:25 +0000
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
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c24">Commen=
t # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774">bug 64774<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pasik&#64;iki.fi" title=3D"Pasi K=C3=A4rkk=C3=A4inen &lt;pasik&#64;iki.fi&g=
t;"> <span class=3D"fn">Pasi K=C3=A4rkk=C3=A4inen</span></a>
</span></b>
        <pre>
Some comments here.. this bug is still being discussed on the mailing lists,
and Ben Skeggs said he'll take a look at the kernel side fixes soon.

Also good to know: I'm able to reliably reproduce this kernel crash with Fe=
dora
18 userspace/xorg, but not with Fedora 19 userspace/xorg.</pre>
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

--1380645265.dAfCE2.26840--

--===============1331558900==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1331558900==--
