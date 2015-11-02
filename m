From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Mon, 02 Nov 2015 09:14:05 +0000
Message-ID: <bug-70354-8800-0mwpX1mb5M@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0866444205=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0866444205==
Content-Type: multipart/alternative; boundary="1446455645.C0511.6268"; charset="UTF-8"


--1446455645.C0511.6268
Date: Mon, 2 Nov 2015 09:14:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D70354

--- Comment #82 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Julien Isorce from comment #81)
> Hi, here is the output of: sudo lspci -nnv -d 10de:0fe4
> 01:00.0 3D controller [0302]: NVIDIA Corporation GK107M [GeForce GT 750M]
> [10de:0fe4] (rev a1)
> 	Subsystem: Samsung Electronics Co Ltd Device [144d:c740]
>=20
> As I do not see any difference adding "options nouveau config=3DWar00C800=
_0=3D1"
> /etc/modprobe.d/nouveau-kms.conf, is there a command or log to checke if =
it
> is really set ?

You should see the following print:

nvkm_info(&pmu->subdev, "hw bug workaround enabled\n");

in your kernel log. You need to be running Linux 4.3-rcN for that code to e=
xist
in the driver (or a driver built from Ben's repo).

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1446455645.C0511.6268
Date: Mon, 2 Nov 2015 09:14:05 +0000
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
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354#c82">Commen=
t # 82</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn=
't help"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D70354">bug 70354<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Julien Isorce from <a href=3D"show_bug.cgi?id=3D7=
0354#c81">comment #81</a>)
<span class=3D"quote">&gt; Hi, here is the output of: sudo lspci -nnv -d 10=
de:0fe4
&gt; 01:00.0 3D controller [0302]: NVIDIA Corporation GK107M [GeForce GT 75=
0M]
&gt; [10de:0fe4] (rev a1)
&gt; 	Subsystem: Samsung Electronics Co Ltd Device [144d:c740]
&gt;=20
&gt; As I do not see any difference adding &quot;options nouveau config=3DW=
ar00C800_0=3D1&quot;
&gt; /etc/modprobe.d/nouveau-kms.conf, is there a command or log to checke =
if it
&gt; is really set ?</span >

You should see the following print:

nvkm_info(&amp;pmu-&gt;subdev, &quot;hw bug workaround enabled\n&quot;);

in your kernel log. You need to be running Linux 4.3-rcN for that code to e=
xist
in the driver (or a driver built from Ben's repo).</pre>
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

--1446455645.C0511.6268--

--===============0866444205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0866444205==--
