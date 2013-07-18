From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Thu, 18 Jul 2013 20:36:02 +0000
Message-ID: <bug-64774-8800-ugMlnLdAy8@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1520971468=="
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


--===============1520971468==
Content-Type: multipart/alternative; boundary="1374179762.55FFA2.16320"; charset="us-ascii"


--1374179762.55FFA2.16320
Date: Thu, 18 Jul 2013 20:36:02 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #8 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

I tested the most recent Fedora 18 kernel update (3.9.9-201.fc18.x86_64), a=
nd
the bug is still there. I enabled Optimus in the BIOS, booted to Linux, tri=
ed
to enable nouveau DVI output, and the kernel crashed immediately.

Then I built a custom kernel based on 3.9.9-201.fc18.x86_64 with the attach=
ed
patch included (as suggested above), and booted with that. Now there's a
problem.. nouveau outputs are not detected, and cannot be enabled, so I don=
't
know if the patch fixes or works around the problem. At least it breaks
something :)=20

There are no obvious nouveau related errors in the dmesg.. attached aswell.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1374179762.55FFA2.16320
Date: Thu, 18 Jul 2013 20:36:02 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c8">Comment=
 # 8</a>
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
I tested the most recent Fedora 18 kernel update (3.9.9-201.fc18.x86_64), a=
nd
the bug is still there. I enabled Optimus in the BIOS, booted to Linux, tri=
ed
to enable nouveau DVI output, and the kernel crashed immediately.

Then I built a custom kernel based on 3.9.9-201.fc18.x86_64 with the attach=
ed
patch included (as suggested above), and booted with that. Now there's a
problem.. nouveau outputs are not detected, and cannot be enabled, so I don=
't
know if the patch fixes or works around the problem. At least it breaks
something :)=20

There are no obvious nouveau related errors in the dmesg.. attached aswell.=
</pre>
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

--1374179762.55FFA2.16320--

--===============1520971468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1520971468==--
