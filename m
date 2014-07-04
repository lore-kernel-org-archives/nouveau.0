From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high under kernel
	3.15
Date: Fri, 04 Jul 2014 08:48:09 +0000
Message-ID: <bug-80901-8800-4P0kKL0PuT@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0836962808=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0836962808==
Content-Type: multipart/alternative; boundary="1404463688.1CBa1.21815"; charset="us-ascii"


--1404463688.1CBa1.21815
Date: Fri, 4 Jul 2014 08:48:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D80901

--- Comment #11 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
Thanks for all this information. It seems like NVIDIA changed the default
minimum temperature before increasing the fan speed
(http://code.woboq.org/linux/linux/drivers/gpu/drm/nouveau/core/subdev/ther=
m/fan.c.html#195).

Based on your information, I would guess it is set to 60=C2=B0C instead of =
the 40=C2=B0C
I saw on some card. It is very possible that they set a different value per
chipset.

I'll check again with a recent version of the blob what is the default
temperature at which the fan speed starts being increased but I don't think=
 the
fix should be to bump the value (that I will set to the minimum value I fou=
nd
across the boards). The proper fix would be to let users change this value =
in
sysfs.

I'll keep the bug open as a reminder but my time is very limited this summe=
r.
If you feel like writing the patch (in nouveau_hwmon.c), I would gladly rev=
iew
it!

Thanks for reporting :)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1404463688.1CBa1.21815
Date: Fri, 4 Jul 2014 08:48:08 +0000
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
   title=3D"NEW --- - [NVCF] PWM fan speed too high under kernel 3.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80901#c11">Commen=
t # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - [NVCF] PWM fan speed too high under kernel 3.15"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D80901">bug 80901<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
martin.peres&#64;ensi-bourges.fr" title=3D"Martin Peres &lt;martin.peres&#6=
4;ensi-bourges.fr&gt;"> <span class=3D"fn">Martin Peres</span></a>
</span></b>
        <pre>Thanks for all this information. It seems like NVIDIA changed =
the default
minimum temperature before increasing the fan speed
(<a href=3D"http://code.woboq.org/linux/linux/drivers/gpu/drm/nouveau/core/=
subdev/therm/fan.c.html#195">http://code.woboq.org/linux/linux/drivers/gpu/=
drm/nouveau/core/subdev/therm/fan.c.html#195</a>).

Based on your information, I would guess it is set to 60=C2=B0C instead of =
the 40=C2=B0C
I saw on some card. It is very possible that they set a different value per
chipset.

I'll check again with a recent version of the blob what is the default
temperature at which the fan speed starts being increased but I don't think=
 the
fix should be to bump the value (that I will set to the minimum value I fou=
nd
across the boards). The proper fix would be to let users change this value =
in
sysfs.

I'll keep the bug open as a reminder but my time is very limited this summe=
r.
If you feel like writing the patch (in nouveau_hwmon.c), I would gladly rev=
iew
it!

Thanks for reporting :)</pre>
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

--1404463688.1CBa1.21815--

--===============0836962808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0836962808==--
