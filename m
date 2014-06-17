From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78439] [NVC1] Display corruption when DP connector
 is reattached
Date: Tue, 17 Jun 2014 11:05:01 +0000
Message-ID: <bug-78439-8800-RAjxR0bEO9@http.bugs.freedesktop.org/>
References: <bug-78439-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0265845878=="
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


--===============0265845878==
Content-Type: multipart/alternative; boundary="1403003101.3af37F01.30444"; charset="us-ascii"


--1403003101.3af37F01.30444
Date: Tue, 17 Jun 2014 11:05:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78439

--- Comment #18 from Andrius =C5=A0tikonas <andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org> ---
Yes it helps. DP screen is no longer black.

The original issue has diminished too. The corrupted portion of the display=
 is
three times narrower. But I haven't tested whether this patch helps or one =
of
the patches after that "bad revision" 8894f4919bc43f821775db2cfff4b917871b2=
102.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1403003101.3af37F01.30444
Date: Tue, 17 Jun 2014 11:05:01 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439#c18">Commen=
t # 18</a>
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
        <pre>Yes it helps. DP screen is no longer black.

The original issue has diminished too. The corrupted portion of the display=
 is
three times narrower. But I haven't tested whether this patch helps or one =
of
the patches after that &quot;bad revision&quot; 8894f4919bc43f821775db2cfff=
4b917871b2102.</pre>
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

--1403003101.3af37F01.30444--

--===============0265845878==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0265845878==--
