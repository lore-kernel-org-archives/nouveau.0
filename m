From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Fri, 07 Mar 2014 21:17:54 +0000
Message-ID: <bug-70354-8800-hYRSzYxnEN@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2117788048=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2117788048==
Content-Type: multipart/alternative; boundary="1394227074.2b3a1D4a2.11956"; charset="us-ascii"


--1394227074.2b3a1D4a2.11956
Date: Fri, 7 Mar 2014 21:17:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70354

--- Comment #23 from Richard <rich-2ZpFXoJyzMtkMtayTlHv3w@public.gmane.org> ---
Same issue on a Lenovo Y510P. Tried compiling the module from Ben's git sou=
rces
in comment 17 on a 3.13.5 kernel, but it complains:

/hidden_tmp/nouveau/drm/core/subdev/mxm/base.c:109:2: error: implicit
declaration of function =E2=80=98acpi_evaluate_dsm=E2=80=99
[-Werror=3Dimplicit-function-declaration]

grep -R acpi_evaluate_dsm /usr/src/linux/* comes up with nothing, so I'm
guessing this function disappeared?

Also tried simply applying the patch (link in comment 17) to a copy of my
source tree, and I seem to be missing (at least) the
"engine/graph/fuc/hubnv108.fuc5.h" file in my source tree.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1394227074.2b3a1D4a2.11956
Date: Fri, 7 Mar 2014 21:17:54 +0000
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
   title=3D"NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw d=
oesn't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354#c23">Commen=
t # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw d=
oesn't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354">bug 70354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
rich&#64;warfaresdl.com" title=3D"Richard &lt;rich&#64;warfaresdl.com&gt;">=
 <span class=3D"fn">Richard</span></a>
</span></b>
        <pre>Same issue on a Lenovo Y510P. Tried compiling the module from =
Ben's git sources
in <a href=3D"show_bug.cgi?id=3D70354#c17">comment 17</a> on a 3.13.5 kerne=
l, but it complains:

/hidden_tmp/nouveau/drm/core/subdev/mxm/base.c:109:2: error: implicit
declaration of function =E2=80=98acpi_evaluate_dsm=E2=80=99
[-Werror=3Dimplicit-function-declaration]

grep -R acpi_evaluate_dsm /usr/src/linux/* comes up with nothing, so I'm
guessing this function disappeared?

Also tried simply applying the patch (link in <a href=3D"show_bug.cgi?id=3D=
70354#c17">comment 17</a>) to a copy of my
source tree, and I seem to be missing (at least) the
&quot;engine/graph/fuc/hubnv108.fuc5.h&quot; file in my source tree.</pre>
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

--1394227074.2b3a1D4a2.11956--

--===============2117788048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2117788048==--
