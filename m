From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78439] [NVC1] Display corruption when DP connector
 is reattached
Date: Mon, 16 Jun 2014 11:56:13 +0000
Message-ID: <bug-78439-8800-enZuRwekV3@http.bugs.freedesktop.org/>
References: <bug-78439-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1747165239=="
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


--===============1747165239==
Content-Type: multipart/alternative; boundary="1402919773.68d5C1.26484"; charset="us-ascii"


--1402919773.68d5C1.26484
Date: Mon, 16 Jun 2014 11:56:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D78439

--- Comment #14 from Andrius =C5=A0tikonas <andrius-4ZmsDwijFH7sq35pWSNszA@public.gmane.org> ---
55f083c33feb7231c7574a64cd01b0477715a370 is the first bad commit which makes
the problem worse.
    drm/nouveau/disp/dp: maintain link in response to hpd signal

    This previously worked for the most part due to userspace doing a
    modeset in response to HPD interrupts.  This will allow us to
    properly handle cases where sync is lost for other reasons, or if
    userspace isn't caring.

Also, I noticed that the original problem is only present if just DP screen=
 is
active. If I have both DP and LVDS screens active then unplugging and plugg=
ing
back DP cable does not result in display corruption.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1402919773.68d5C1.26484
Date: Mon, 16 Jun 2014 11:56:13 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D78439#c14">Commen=
t # 14</a>
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
        <pre>55f083c33feb7231c7574a64cd01b0477715a370 is the first bad comm=
it which makes
the problem worse.
    drm/nouveau/disp/dp: maintain link in response to hpd signal

    This previously worked for the most part due to userspace doing a
    modeset in response to HPD interrupts.  This will allow us to
    properly handle cases where sync is lost for other reasons, or if
    userspace isn't caring.

Also, I noticed that the original problem is only present if just DP screen=
 is
active. If I have both DP and LVDS screens active then unplugging and plugg=
ing
back DP cable does not result in display corruption.</pre>
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

--1402919773.68d5C1.26484--

--===============1747165239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1747165239==--
