From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78439] [NVC1] Display corruption when DP connector
 is reattached
Date: Wed, 21 May 2014 09:39:37 +0000
Message-ID: <bug-78439-8800-tjA26S5OYN@http.bugs.freedesktop.org/>
References: <bug-78439-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0270553226=="
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


--===============0270553226==
Content-Type: multipart/alternative; boundary="1400665176.EF7CfA1.19779"; charset="us-ascii"


--1400665176.EF7CfA1.19779
Date: Wed, 21 May 2014 09:39:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78439

--- Comment #4 from Andrius =C5=A0tikonas <andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org> ---
I can't test with suspend to RAM. My laptop only partially suspends and the=
n it
is stuck in that state.

I tried it with suspend to disk. The laptop also fails to suspend, however =
this
time it aborts the suspend and returns to the working state with no screen
corruption. Moreover, the corruption is completely gone till the next reboo=
t,
i.e. I can reattach connector and the display is still fine.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1400665176.EF7CfA1.19779
Date: Wed, 21 May 2014 09:39:36 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439#c4">Comment=
 # 4</a>
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
        <pre>I can't test with suspend to RAM. My laptop only partially sus=
pends and then it
is stuck in that state.

I tried it with suspend to disk. The laptop also fails to suspend, however =
this
time it aborts the suspend and returns to the working state with no screen
corruption. Moreover, the corruption is completely gone till the next reboo=
t,
i.e. I can reattach connector and the display is still fine.</pre>
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

--1400665176.EF7CfA1.19779--

--===============0270553226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0270553226==--
