From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82527] xset dpms force {off, standby,
 suspend} returns after ~20 seconds (GeForce 8400 GS)
Date: Wed, 13 Aug 2014 07:53:44 +0000
Message-ID: <bug-82527-8800-oGzE1qCO6m@http.bugs.freedesktop.org/>
References: <bug-82527-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1303945251=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82527-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1303945251==
Content-Type: multipart/alternative; boundary="1407916424.Ab43DDD1.7159"; charset="us-ascii"


--1407916424.Ab43DDD1.7159
Date: Wed, 13 Aug 2014 07:53:44 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D82527

--- Comment #2 from Martin V=C3=A4th <martin-hvkNLsi7f8w@public.gmane.org> ---
Created attachment 104544
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D104544&action=3Dedit
boot.log

With kernel 3-17 (boot log attached) there is indeed a change:

Now the monitor does not react at all on "xset dpms force off".

The monitor is connected over DVI

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1407916424.Ab43DDD1.7159
Date: Wed, 13 Aug 2014 07:53:44 +0000
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
   title=3D"NEW --- - xset dpms force {off,standby,suspend} returns after ~=
20 seconds (GeForce 8400 GS)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82527#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - xset dpms force {off,standby,suspend} returns after ~=
20 seconds (GeForce 8400 GS)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D82527">bug 82527<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin&#64;mvath.de" title=3D"Martin V=C3=A4th &lt;martin&#64;mvath.de&gt;"=
> <span class=3D"fn">Martin V=C3=A4th</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D104544=
" name=3D"attach_104544" title=3D"boot.log">attachment 104544</a> <a href=
=3D"attachment.cgi?id=3D104544&amp;action=3Dedit" title=3D"boot.log">[detai=
ls]</a></span>
boot.log

With kernel 3-17 (boot log attached) there is indeed a change:

Now the monitor does not react at all on &quot;xset dpms force off&quot;.

The monitor is connected over DVI</pre>
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

--1407916424.Ab43DDD1.7159--

--===============1303945251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1303945251==--
