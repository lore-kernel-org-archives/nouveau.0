From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70212] glxinfo triggers assert in cso_release_all
 after 3f0627c2ad6
Date: Sun, 20 Oct 2013 14:52:12 +0000
Message-ID: <bug-70212-8800-l0iCiWTxi8@http.bugs.freedesktop.org/>
References: <bug-70212-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1743858399=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70212-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1743858399==
Content-Type: multipart/alternative; boundary="1382280732.D8E1Dd03.19271"; charset="us-ascii"


--1382280732.D8E1Dd03.19271
Date: Sun, 20 Oct 2013 14:52:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70212

--- Comment #4 from exc <exclusive_tm-JGs/UdohzUI@public.gmane.org> ---
It's because value returned by nv50_screen_get_shader_param with
param=3DPIPE_SHADER_CAP_MAX_TEXTURE_SAMPLERS is greater than PIPE_MAX_SAMPL=
ERS.
Setting either of them to another fixes the problem, dunno which is right.=
=20

git blame outputs:

% git blame src/gallium/drivers/nouveau/nv50/nv50_screen.c -L 251,252
f5bfe54a src/gallium/drivers/nv50/nv50_screen.c (Marek Ol=C5=A1=C3=A1k 2011=
-09-27
22:22:06 +0200 251)    case PIPE_SHADER_CAP_MAX_TEXTURE_SAMPLERS:
f5bfe54a src/gallium/drivers/nv50/nv50_screen.c (Marek Ol=C5=A1=C3=A1k 2011=
-09-27
22:22:06 +0200 252)       return 32;

% git blame src/gallium/include/pipe/p_state.h -L 60,60
da893403 (Brian 2008-04-08 21:43:36 -0600 60) #define PIPE_MAX_SAMPLERS=20=
=20=20=20=20=20=20=20
16

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1382280732.D8E1Dd03.19271
Date: Sun, 20 Oct 2013 14:52:12 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED --- - glxinfo triggers assert in cso_release_all after=
 3f0627c2ad6"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70212#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED --- - glxinfo triggers assert in cso_release_all after=
 3f0627c2ad6"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70212">bug 70212<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
exclusive_tm&#64;mail.ru" title=3D"exc &lt;exclusive_tm&#64;mail.ru&gt;"> <=
span class=3D"fn">exc</span></a>
</span></b>
        <pre>It's because value returned by nv50_screen_get_shader_param wi=
th
param=3DPIPE_SHADER_CAP_MAX_TEXTURE_SAMPLERS is greater than PIPE_MAX_SAMPL=
ERS.
Setting either of them to another fixes the problem, dunno which is right.=
=20

git blame outputs:

% git blame src/gallium/drivers/nouveau/nv50/nv50_screen.c -L 251,252
f5bfe54a src/gallium/drivers/nv50/nv50_screen.c (Marek Ol=C5=A1=C3=A1k 2011=
-09-27
22:22:06 +0200 251)    case PIPE_SHADER_CAP_MAX_TEXTURE_SAMPLERS:
f5bfe54a src/gallium/drivers/nv50/nv50_screen.c (Marek Ol=C5=A1=C3=A1k 2011=
-09-27
22:22:06 +0200 252)       return 32;

% git blame src/gallium/include/pipe/p_state.h -L 60,60
da893403 (Brian 2008-04-08 21:43:36 -0600 60) #define PIPE_MAX_SAMPLERS=20=
=20=20=20=20=20=20=20
16</pre>
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

--1382280732.D8E1Dd03.19271--

--===============1743858399==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1743858399==--
