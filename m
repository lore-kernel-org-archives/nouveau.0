From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83550] [NVA5] Monitor not restored after resume
 [regression] [bisected]
Date: Fri, 19 Sep 2014 16:51:30 +0000
Message-ID: <bug-83550-8800-z5iH8a5ZW4@http.bugs.freedesktop.org/>
References: <bug-83550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0517853271=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0517853271==
Content-Type: multipart/alternative; boundary="1411145490.8c36E72.25214"; charset="us-ascii"


--1411145490.8c36E72.25214
Date: Fri, 19 Sep 2014 16:51:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D83550

--- Comment #6 from Ortwin Gl=C3=BCck <odi-L693kI9kcNY@public.gmane.org> ---
Created attachment 106560
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D106560&action=3Dedit
log from first bad commit

This is the debug output of a boot/suspend/resume cycle of first bad commit
415f12efc1b2308411b2cbc3e82666b3db8a7758 with nouveau.debug=3Dtrace,PDISP=
=3Dspam

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1411145490.8c36E72.25214
Date: Fri, 19 Sep 2014 16:51:30 +0000
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
   title=3D"NEW --- - [NVA5] Monitor not restored after resume [regression]=
 [bisected]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83550#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVA5] Monitor not restored after resume [regression]=
 [bisected]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D83550">bug 83550<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
odi&#64;odi.ch" title=3D"Ortwin Gl=C3=BCck &lt;odi&#64;odi.ch&gt;"> <span c=
lass=3D"fn">Ortwin Gl=C3=BCck</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D106560=
" name=3D"attach_106560" title=3D"log from first bad commit">attachment 106=
560</a> <a href=3D"attachment.cgi?id=3D106560&amp;action=3Dedit" title=3D"l=
og from first bad commit">[details]</a></span>
log from first bad commit

This is the debug output of a boot/suspend/resume cycle of first bad commit
415f12efc1b2308411b2cbc3e82666b3db8a7758 with nouveau.debug=3Dtrace,PDISP=
=3Dspam</pre>
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

--1411145490.8c36E72.25214--

--===============0517853271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0517853271==--
