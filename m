From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 39010] better handling of large pixmaps
Date: Tue, 20 Aug 2013 01:43:50 +0000
Message-ID: <bug-39010-8800-xr3Z7SibgY@http.bugs.freedesktop.org/>
References: <bug-39010-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0052114426=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-39010-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0052114426==
Content-Type: multipart/alternative; boundary="1376963030.2fC5FB1.30083"; charset="us-ascii"


--1376963030.2fC5FB1.30083
Date: Tue, 20 Aug 2013 01:43:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D39010

--- Comment #7 from Gy=C3=B6rgy Ball=C3=B3 <ballogy-HLx8PRj2pn30Br+ELjv3iA@public.gmane.org> ---
It is still a problem with the following components:
- linux 3.10.7
- libdrm 2.4.46
- xf86-video-nouveau 1.0.9

Could someone review the patch from the nouveau team?

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1376963030.2fC5FB1.30083
Date: Tue, 20 Aug 2013 01:43:50 +0000
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
   title=3D"NEW --- - better handling of large pixmaps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D39010#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - better handling of large pixmaps"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D39010">bug 39010<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ballogy&#64;freestart.hu" title=3D"Gy=C3=B6rgy Ball=C3=B3 &lt;ballogy&#64;f=
reestart.hu&gt;"> <span class=3D"fn">Gy=C3=B6rgy Ball=C3=B3</span></a>
</span></b>
        <pre>It is still a problem with the following components:
- linux 3.10.7
- libdrm 2.4.46
- xf86-video-nouveau 1.0.9

Could someone review the patch from the nouveau team?</pre>
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

--1376963030.2fC5FB1.30083--

--===============0052114426==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0052114426==--
