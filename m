From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 17 Jan 2014 10:41:57 +0000
Message-ID: <bug-73358-8800-oVuNIwIBrq@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0107140324=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0107140324==
Content-Type: multipart/alternative; boundary="1389955316.DbdaFddF1.11800"; charset="us-ascii"


--1389955316.DbdaFddF1.11800
Date: Fri, 17 Jan 2014 10:41:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D73358

--- Comment #21 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I'm having a hard time reproducing this. The libpepflashplayer.so used to c=
rash
reliably but it won't now. Furthermore, I changed the first patch to use
fprintf(stderr, instead of printf( but the compiler gives some warnings.

  CC       nv30_state_validate.lo
nv30/nv30_state_validate.c: In function =E2=80=98nv30_validate_fb=E2=80=99:
nv30/nv30_state_validate.c:99:11: warning: passing argument 1 of =E2=80=98p=
rintf=E2=80=99 from
incompatible pointer type [enabled by default]
           util_format_name(p_format), p_format, rt_format, hw_format);
           ^
In file included from ./nv30/nv30_screen.h:4:0,
                 from ./nv30/nv30_context.h:7,
                 from nv30/nv30_state_validate.c:32:
/usr/include/stdio.h:362:12: note: expected =E2=80=98const char * restrict=
=E2=80=99 but
argument is of type =E2=80=98struct _IO_FILE *=E2=80=99
 extern int printf (const char *__restrict __format, ...);
            ^
  CC       nv30_clear.lo
nv30/nv30_clear.c: In function =E2=80=98nv30_clear_render_target=E2=80=99:
nv30/nv30_clear.c:128:4: warning: format =E2=80=98%x=E2=80=99 expects argum=
ent of type
=E2=80=98unsigned int=E2=80=99, but argument 4 has type =E2=80=98const char=
 *=E2=80=99 [-Wformat=3D]
    util_format_name(ps->format), ps->format, rt_format, hw_format);
    ^
nv30/nv30_clear.c:128:4: warning: too many arguments for format
[-Wformat-extra-args]

It compiles and runs, but I'm not getting output on the terminal.

I did this as well:

[gebruiker@delta mesa]$ cd mesa
[gebruiker@delta mesa]$ export LD_LIBRARY_PATH=3D./lib/gallium/:$LD_LIBRARY=
_PATH
[gebruiker@delta mesa]$ export LIBGL_DRIVERS_PATH=3D./lib/gallium/
[gebruiker@delta mesa]$ glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
nv30_validate_fb: p_format 2, rt_format 105, hw 5
=EF=BF=BD(=EF=BF=BD=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=EF=BF=
=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=
=EF=BF=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD[gebruiker@delta mesa]$=20

I do not get this output with either chromium or firefox. I guess the garba=
ge
output has something to do with the above warnings?

FWIW, I downloaded mesa git and moved to 10.0.2 as requested.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1389955316.DbdaFddF1.11800
Date: Fri, 17 Jan 2014 10:41:56 +0000
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
   title=3D"NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_=
ERROR"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D73358#c21">Commen=
t # 21</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_=
ERROR"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D73358">bug 73358<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ronald645&#64;gmail.com" title=3D"Ronald &lt;ronald645&#64;gmail.com&gt;"> =
<span class=3D"fn">Ronald</span></a>
</span></b>
        <pre>I'm having a hard time reproducing this. The libpepflashplayer=
.so used to crash
reliably but it won't now. Furthermore, I changed the first patch to use
fprintf(stderr, instead of printf( but the compiler gives some warnings.

  CC       nv30_state_validate.lo
nv30/nv30_state_validate.c: In function =E2=80=98nv30_validate_fb=E2=80=99:
nv30/nv30_state_validate.c:99:11: warning: passing argument 1 of =E2=80=98p=
rintf=E2=80=99 from
incompatible pointer type [enabled by default]
           util_format_name(p_format), p_format, rt_format, hw_format);
           ^
In file included from ./nv30/nv30_screen.h:4:0,
                 from ./nv30/nv30_context.h:7,
                 from nv30/nv30_state_validate.c:32:
/usr/include/stdio.h:362:12: note: expected =E2=80=98const char * restrict=
=E2=80=99 but
argument is of type =E2=80=98struct _IO_FILE *=E2=80=99
 extern int printf (const char *__restrict __format, ...);
            ^
  CC       nv30_clear.lo
nv30/nv30_clear.c: In function =E2=80=98nv30_clear_render_target=E2=80=99:
nv30/nv30_clear.c:128:4: warning: format =E2=80=98%x=E2=80=99 expects argum=
ent of type
=E2=80=98unsigned int=E2=80=99, but argument 4 has type =E2=80=98const char=
 *=E2=80=99 [-Wformat=3D]
    util_format_name(ps-&gt;format), ps-&gt;format, rt_format, hw_format);
    ^
nv30/nv30_clear.c:128:4: warning: too many arguments for format
[-Wformat-extra-args]

It compiles and runs, but I'm not getting output on the terminal.

I did this as well:

[gebruiker&#64;delta mesa]$ cd mesa
[gebruiker&#64;delta mesa]$ export LD_LIBRARY_PATH=3D./lib/gallium/:$LD_LIB=
RARY_PATH
[gebruiker&#64;delta mesa]$ export LIBGL_DRIVERS_PATH=3D./lib/gallium/
[gebruiker&#64;delta mesa]$ glxgears
Running synchronized to the vertical refresh.  The framerate should be
approximately the same as the monitor refresh rate.
nv30_validate_fb: p_format 2, rt_format 105, hw 5
=EF=BF=BD(=EF=BF=BD=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=EF=BF=
=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD=
=EF=BF=BDI[=EF=BF=BD=EF=BF=BDI[=EF=BF=BD[gebruiker&#64;delta mesa]$=20

I do not get this output with either chromium or firefox. I guess the garba=
ge
output has something to do with the above warnings?

FWIW, I downloaded mesa git and moved to 10.0.2 as requested.</pre>
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

--1389955316.DbdaFddF1.11800--

--===============0107140324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0107140324==--
