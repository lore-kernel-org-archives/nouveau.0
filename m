From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77003] [NV50] Fan speed to high with Kernel versions
 3.13.x - Nvidia GeForce GTS 240 (NV92)
Date: Thu, 03 Apr 2014 20:26:53 +0000
Message-ID: <bug-77003-8800-H1IXi4gT8z@http.bugs.freedesktop.org/>
References: <bug-77003-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2048693388=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77003-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2048693388==
Content-Type: multipart/alternative; boundary="1396556813.cBd3712.21433"; charset="us-ascii"


--1396556813.cBd3712.21433
Date: Thu, 3 Apr 2014 20:26:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D77003

--- Comment #4 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #3)
> Created attachment 96855 [details]
> vbios.rom
>=20
> Vbtracetool didn't find file "pci/pci.h" during make. So I did create it
> with the nouveau module, hope this is OK instead.

Looks good, thanks!

>=20
> Temp is quite high with 84=C2=B0, isn't it? With Kernel versions < 3.13.x=
 fan
> speed doesn't get up to 6Ks. I'm using Gnome 3 with Liber8, Firefox, ...
> nothing spectacular.

Well, 84=C2=B0C is nothing to be afraid of, especially on old cards. Howeve=
r,
looking at your vbios informed me that when your card is at 60=C2=B0C, the =
fan speed
should be 35% and 100% at 90=C2=B0C.

Could you try to check if manual fan management works perfectly (try 0 -> 1=
00%
in 10 steps) both on the 3.12.9 and 3.13.x?

If this works fine, then I would like you to load nouveau with the following
parameter and send me the kernel log:
debug=3D"PTHERM=3Ddebug"

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1396556813.cBd3712.21433
Date: Thu, 3 Apr 2014 20:26:53 +0000
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
   title=3D"NEW --- - [NV50] Fan speed to high with Kernel versions 3.13.x =
- Nvidia GeForce GTS 240 (NV92)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D77003#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NV50] Fan speed to high with Kernel versions 3.13.x =
- Nvidia GeForce GTS 240 (NV92)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D77003">bug 77003<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;ensi-bourges.fr" title=3D"Martin Peres &lt;martin.peres&#6=
4;ensi-bourges.fr&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href=3D"show_bug.cgi?id=3D77003#c3">comment #3=
</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D96855" name=3D"attach_96855" title=3D"vbios.rom">attachment 96855</=
a> <a href=3D"attachment.cgi?id=3D96855&amp;action=3Dedit" title=3D"vbios.r=
om">[details]</a></span>
&gt; vbios.rom
&gt;=20
&gt; Vbtracetool didn't find file &quot;pci/pci.h&quot; during make. So I d=
id create it
&gt; with the nouveau module, hope this is OK instead.</span >

Looks good, thanks!

<span class=3D"quote">&gt;=20
&gt; Temp is quite high with 84=C2=B0, isn't it? With Kernel versions &lt; =
3.13.x fan
&gt; speed doesn't get up to 6Ks. I'm using Gnome 3 with Liber8, Firefox, .=
..
&gt; nothing spectacular.</span >

Well, 84=C2=B0C is nothing to be afraid of, especially on old cards. Howeve=
r,
looking at your vbios informed me that when your card is at 60=C2=B0C, the =
fan speed
should be 35% and 100% at 90=C2=B0C.

Could you try to check if manual fan management works perfectly (try 0 -&gt=
; 100%
in 10 steps) both on the 3.12.9 and 3.13.x?

If this works fine, then I would like you to load nouveau with the following
parameter and send me the kernel log:
debug=3D&quot;PTHERM=3Ddebug&quot;</pre>
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

--1396556813.cBd3712.21433--

--===============2048693388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2048693388==--
