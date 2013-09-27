From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64772] [NVC1] nouveau GF108 kernel errors and
 graphics corruption when enabling second output
Date: Fri, 27 Sep 2013 16:55:37 +0000
Message-ID: <bug-64772-8800-wa35HjgpFF@http.bugs.freedesktop.org/>
References: <bug-64772-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0921422902=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64772-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0921422902==
Content-Type: multipart/alternative; boundary="1380300937.e25a1.15353"; charset="us-ascii"


--1380300937.e25a1.15353
Date: Fri, 27 Sep 2013 16:55:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64772

--- Comment #3 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

Running Fedora 19 with latest updates and linux 3.11.1-200.fc19.x86_64 and =
it
seems to work better now.=20

I can successfully enable second DVI output, and there's no corruption anym=
ore,
the graphics on the second DVI display look OK now.

So that issue seems to be fixed!

I still get this in dmesg though:
[  353.398552] nouveau E[      VM][0000:01:00.0] failed to create 0x0400000=
0,
-28
[  353.398556] nouveau E[      VM][0000:01:00.0] failed to create 0x0200000=
0,
-28

But it doesn't seem fatal..

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1380300937.e25a1.15353
Date: Fri, 27 Sep 2013 16:55:37 +0000
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
   title=3D"NEW --- - [NVC1] nouveau GF108 kernel errors and graphics corru=
ption when enabling second output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64772#c3">Comment=
 # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVC1] nouveau GF108 kernel errors and graphics corru=
ption when enabling second output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64772">bug 64772<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pasik&#64;iki.fi" title=3D"Pasi K=C3=A4rkk=C3=A4inen &lt;pasik&#64;iki.fi&g=
t;"> <span class=3D"fn">Pasi K=C3=A4rkk=C3=A4inen</span></a>
</span></b>
        <pre>
Running Fedora 19 with latest updates and linux 3.11.1-200.fc19.x86_64 and =
it
seems to work better now.=20

I can successfully enable second DVI output, and there's no corruption anym=
ore,
the graphics on the second DVI display look OK now.

So that issue seems to be fixed!

I still get this in dmesg though:
[  353.398552] nouveau E[      VM][0000:01:00.0] failed to create 0x0400000=
0,
-28
[  353.398556] nouveau E[      VM][0000:01:00.0] failed to create 0x0200000=
0,
-28

But it doesn't seem fatal..</pre>
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

--1380300937.e25a1.15353--

--===============0921422902==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0921422902==--
