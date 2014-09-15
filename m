From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83897] [NVE6] GK106 (GeForce GTX 660): Frequent GPU
	lockups
Date: Mon, 15 Sep 2014 16:35:55 +0000
Message-ID: <bug-83897-8800-FdST7g7BMi@http.bugs.freedesktop.org/>
References: <bug-83897-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0807530659=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83897-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0807530659==
Content-Type: multipart/alternative; boundary="1410798954.87aA01.29218"; charset="us-ascii"


--1410798954.87aA01.29218
Date: Mon, 15 Sep 2014 16:35:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D83897

--- Comment #4 from freedesk.apriori-w1QkCcy0X+BxKfgMtfWJuA@public.gmane.org ---
Created attachment 106332
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D106332&action=3Dedit
grep nouveau *.log|grep -C 15 "fault"

Output for =C2=ABgrep nouveau *.log|grep -C 15 "fault"=C2=BB on a few colle=
cted logs of
the freezes described above.

This is for various kernel versions, I=E2=80=99ll follow up a table with th=
e relevant
uname output for each logfile.

If there=E2=80=99s anything interesting in there that needs more than 15 li=
nes of
context, let me know.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1410798954.87aA01.29218
Date: Mon, 15 Sep 2014 16:35:54 +0000
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
   title=3D"NEW --- - [NVE6] GK106 (GeForce GTX 660): Frequent GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83897#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] GK106 (GeForce GTX 660): Frequent GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83897">bug 83897<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesk.apriori&#64;spamgourmet.com" title=3D"freedesk.apriori&#64;spamgou=
rmet.com">freedesk.apriori&#64;spamgourmet.com</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D106332=
" name=3D"attach_106332" title=3D"grep nouveau *.log|grep -C 15 &quot;fault=
&quot;">attachment 106332</a> <a href=3D"attachment.cgi?id=3D106332&amp;act=
ion=3Dedit" title=3D"grep nouveau *.log|grep -C 15 &quot;fault&quot;">[deta=
ils]</a></span>
grep nouveau *.log|grep -C 15 &quot;fault&quot;

Output for =C2=ABgrep nouveau *.log|grep -C 15 &quot;fault&quot;=C2=BB on a=
 few collected logs of
the freezes described above.

This is for various kernel versions, I=E2=80=99ll follow up a table with th=
e relevant
uname output for each logfile.

If there=E2=80=99s anything interesting in there that needs more than 15 li=
nes of
context, let me know.</pre>
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

--1410798954.87aA01.29218--

--===============0807530659==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0807530659==--
