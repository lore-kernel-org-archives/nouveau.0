From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70510] Xorg crash on KDE init
Date: Thu, 20 Feb 2014 12:30:51 +0000
Message-ID: <bug-70510-8800-suklK36DcP@http.bugs.freedesktop.org/>
References: <bug-70510-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1703974701=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70510-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1703974701==
Content-Type: multipart/alternative; boundary="1392899451.FDAa2.15826"; charset="us-ascii"


--1392899451.FDAa2.15826
Date: Thu, 20 Feb 2014 12:30:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70510

Hilmar Preu=C3=9Fe <hille42-S0/GAf8tV78@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hille42-S0/GAf8tV78@public.gmane.org

--- Comment #19 from Hilmar Preu=C3=9Fe <hille42-S0/GAf8tV78@public.gmane.org> ---
I /think/ I look @the same problem, during a different operation. I try to
display an image larger than the screen using "display" (from imagemagick).=
 The
gdb backtrace from the core dump looks very similar just before it crashes:

#12 nouveau_exa_upload_to_screen (pdpix=3D0xb86cb578, x=3D0, y=3D0, w=3D400=
0, h=3D16,=20
    src=3D0xb87b5268 "", src_pitch=3D16000) at ../../src/nouveau_exa.c:389
        pScrn =3D <optimized out>
        pNv =3D 0xb84516c0
        dst_pitch =3D 16000
        tmp_pitch =3D 16000
        cpp =3D 4
        i =3D <optimized out>
        bo =3D 0xb87da000
        dst =3D <optimized out>
        ret =3D 256000
        __func__ =3D "nouveau_exa_upload_to_screen"

(full bt will be uploaded). The display program does not scale down the ima=
ge
to screen resolution but displays the picture @original resolution and offe=
rs a
thumbnail to select the part of the image to display.

I initially noticed this problem on debian stable (nouveau 1.0.1), I upgrad=
ed
to nouveau 1.0.10, the bt now looks different, but the crash still happens.

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1392899451.FDAa2.15826
Date: Thu, 20 Feb 2014 12:30:51 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/" />
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:hille42&#=
64;web.de" title=3D"Hilmar Preu=C3=9Fe &lt;hille42&#64;web.de&gt;"> <span c=
lass=3D"fn">Hilmar Preu=C3=9Fe</span></a>
</span> changed
              <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Xorg crash on KDE init"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70510">bug 70510<=
/a>
        <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>hille42&#64;web.de
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Xorg crash on KDE init"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70510#c19">Commen=
t # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - Xorg crash on KDE init"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70510">bug 70510<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hille42&#64;web.de" title=3D"Hilmar Preu=C3=9Fe &lt;hille42&#64;web.de&gt;"=
> <span class=3D"fn">Hilmar Preu=C3=9Fe</span></a>
</span></b>
        <pre>I /think/ I look &#64;the same problem, during a different ope=
ration. I try to
display an image larger than the screen using &quot;display&quot; (from ima=
gemagick). The
gdb backtrace from the core dump looks very similar just before it crashes:

#12 nouveau_exa_upload_to_screen (pdpix=3D0xb86cb578, x=3D0, y=3D0, w=3D400=
0, h=3D16,=20
    src=3D0xb87b5268 &quot;&quot;, src_pitch=3D16000) at ../../src/nouveau_=
exa.c:389
        pScrn =3D &lt;optimized out&gt;
        pNv =3D 0xb84516c0
        dst_pitch =3D 16000
        tmp_pitch =3D 16000
        cpp =3D 4
        i =3D &lt;optimized out&gt;
        bo =3D 0xb87da000
        dst =3D &lt;optimized out&gt;
        ret =3D 256000
        __func__ =3D &quot;nouveau_exa_upload_to_screen&quot;

(full bt will be uploaded). The display program does not scale down the ima=
ge
to screen resolution but displays the picture &#64;original resolution and =
offers a
thumbnail to select the part of the image to display.

I initially noticed this problem on debian stable (nouveau 1.0.1), I upgrad=
ed
to nouveau 1.0.10, the bt now looks different, but the crash still happens.=
</pre>
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

--1392899451.FDAa2.15826--

--===============1703974701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1703974701==--
