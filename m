From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78439] [NVC1] Display corruption when DP connector
 is reattached
Date: Sat, 14 Jun 2014 23:14:35 +0000
Message-ID: <bug-78439-8800-FiLXW1OQMA@http.bugs.freedesktop.org/>
References: <bug-78439-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0363507947=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-78439-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0363507947==
Content-Type: multipart/alternative; boundary="1402787675.5CBA3A01.11180"; charset="us-ascii"


--1402787675.5CBA3A01.11180
Date: Sat, 14 Jun 2014 23:14:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78439

--- Comment #13 from Andrius =C5=A0tikonas <andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org> ---
I didn't have enough time to finish bisection today but I managed to narrow=
 it
down, so it might already be useful. There are just two untested revisions
left.


Bad revision is 8894f4919bc43f821775db2cfff4b917871b2102
ebd6acbb068b6558735eb80aabce1e7af9e78e1e
55f083c33feb7231c7574a64cd01b0477715a370
Good revision is 13a61757db124b16cef9b8f9b60ff7337a01b398

I will finish bisecting on Monday.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402787675.5CBA3A01.11180
Date: Sat, 14 Jun 2014 23:14:35 +0000
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
   title=3D"NEW --- - [NVC1] Display corruption when DP connector is reatta=
ched"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439#c13">Commen=
t # 13</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVC1] Display corruption when DP connector is reatta=
ched"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439">bug 78439<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
andrius&#64;stikonas.eu" title=3D"Andrius =C5=A0tikonas &lt;andrius&#64;sti=
konas.eu&gt;"> <span class=3D"fn">Andrius =C5=A0tikonas</span></a>
</span></b>
        <pre>I didn't have enough time to finish bisection today but I mana=
ged to narrow it
down, so it might already be useful. There are just two untested revisions
left.


Bad revision is 8894f4919bc43f821775db2cfff4b917871b2102
ebd6acbb068b6558735eb80aabce1e7af9e78e1e
55f083c33feb7231c7574a64cd01b0477715a370
Good revision is 13a61757db124b16cef9b8f9b60ff7337a01b398

I will finish bisecting on Monday.</pre>
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

--1402787675.5CBA3A01.11180--

--===============0363507947==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0363507947==--
