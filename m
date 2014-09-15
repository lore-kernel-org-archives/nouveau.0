From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83897] [NVE6] GK106 (GeForce GTX 660): Frequent GPU
	lockups
Date: Mon, 15 Sep 2014 16:41:34 +0000
Message-ID: <bug-83897-8800-2t4K1SEvIW@http.bugs.freedesktop.org/>
References: <bug-83897-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0773621017=="
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


--===============0773621017==
Content-Type: multipart/alternative; boundary="1410799294.1b1daA41.30995"; charset="us-ascii"


--1410799294.1b1daA41.30995
Date: Mon, 15 Sep 2014 16:41:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D83897

--- Comment #5 from freedesk.apriori-w1QkCcy0X+BxKfgMtfWJuA@public.gmane.org ---
=C2=ABgrep "Linux version" *.log=C2=BB. Some of the logs are missing the ve=
rsion message,
though, since hard crashes screw up the journal=E2=80=99s reboot stamp, it =
seems, and I
had to resort to using =C2=ABjournalctl --since $TIME=C2=BB.

nouveau.10.log:Aug 23 12:38:03 wirrsal kernel: Linux version 3.16.1-1-ck
(squishy@ease) (gcc version 4.9.1 (GCC) ) #1 SMP PREEMPT Sat Aug 16 06:54:34
EDT 2014
nouveau.6.log:Jul 12 14:22:42 wirrsal kernel: Linux version 3.15.5-2-ck
(squishy@ease) (gcc version 4.9.0 20140604 (prerelease) (GCC) ) #1 SMP PREE=
MPT
Fri Jul 11 18:05:02 EDT 2014
nouveau.7.log:Jul 25 20:06:16 wirrsal kernel: Linux version 3.15.6-1-ck
(squishy@ease) (gcc version 4.9.0 20140604 (prerelease) (GCC) ) #1 SMP PREE=
MPT
Fri Jul 18 15:54:54 EDT 2014
nouveau.9.log:Aug 18 21:41:41 wirrsal kernel: Linux version 3.16.1-1-ck
(squishy@ease) (gcc version 4.9.1 (GCC) ) #1 SMP PREEMPT Sat Aug 16 06:54:34
EDT 2014

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1410799294.1b1daA41.30995
Date: Mon, 15 Sep 2014 16:41:34 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83897#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6] GK106 (GeForce GTX 660): Frequent GPU lockups"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83897">bug 83897<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesk.apriori&#64;spamgourmet.com" title=3D"freedesk.apriori&#64;spamgou=
rmet.com">freedesk.apriori&#64;spamgourmet.com</a>
</span></b>
        <pre>=C2=ABgrep &quot;Linux version&quot; *.log=C2=BB. Some of the =
logs are missing the version message,
though, since hard crashes screw up the journal=E2=80=99s reboot stamp, it =
seems, and I
had to resort to using =C2=ABjournalctl --since $TIME=C2=BB.

nouveau.10.log:Aug 23 12:38:03 wirrsal kernel: Linux version 3.16.1-1-ck
(squishy&#64;ease) (gcc version 4.9.1 (GCC) ) #1 SMP PREEMPT Sat Aug 16 06:=
54:34
EDT 2014
nouveau.6.log:Jul 12 14:22:42 wirrsal kernel: Linux version 3.15.5-2-ck
(squishy&#64;ease) (gcc version 4.9.0 20140604 (prerelease) (GCC) ) #1 SMP =
PREEMPT
Fri Jul 11 18:05:02 EDT 2014
nouveau.7.log:Jul 25 20:06:16 wirrsal kernel: Linux version 3.15.6-1-ck
(squishy&#64;ease) (gcc version 4.9.0 20140604 (prerelease) (GCC) ) #1 SMP =
PREEMPT
Fri Jul 18 15:54:54 EDT 2014
nouveau.9.log:Aug 18 21:41:41 wirrsal kernel: Linux version 3.16.1-1-ck
(squishy&#64;ease) (gcc version 4.9.1 (GCC) ) #1 SMP PREEMPT Sat Aug 16 06:=
54:34
EDT 2014</pre>
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

--1410799294.1b1daA41.30995--

--===============0773621017==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0773621017==--
