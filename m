From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90569] [NV67] GUI freezes after startup of Ubuntu
 15.04. on Aspire 7520p [BUG: unable to handle kernel paging request at
 f84c8000]
Date: Sat, 01 Aug 2015 12:21:14 +0000
Message-ID: <bug-90569-8800-0sGwltpH3T@http.bugs.freedesktop.org/>
References: <bug-90569-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1545987558=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90569-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1545987558==
Content-Type: multipart/alternative; boundary="1438431674.C3B171.8979"; charset="UTF-8"


--1438431674.C3B171.8979
Date: Sat, 1 Aug 2015 12:21:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D90569

--- Comment #5 from Jedet Ilrihm <jedet-Mmb7MZpHnFY@public.gmane.org> ---
Hi Ilia,

I tried to create a kernel-version with the applied patch, but I had several
problems:
1. this https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1460768 bug
occurred
2. such a bug occurred:
-----------------------
Note: Writing hsi_event.9
Warn: meta author : no refentry/info/author=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
hsi_get_channel_id_by_name
Note: meta author : see http://docbook.sf.net/el/author=20=20=20=20=20=20=
=20=20=20=20=20
hsi_get_channel_id_by_name
Warn: meta author : no author data, so inserted a fixme=20=20=20=20=20=20=
=20=20=20=20=20
hsi_get_channel_id_by_name
Note: Writing hsi_get_channel_id_by_name.9
gzip -f Documentation/DocBook/man/*.9
make[3]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
debian/ruleset/targets/doc.mk:34: recipe for target
'debian/stamp/install/linux-doc-3.19.8-ckt2' failed
make[2]: *** [debian/stamp/install/linux-doc-3.19.8-ckt2] Error 2
make[2]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
debian/ruleset/common/targets.mk:357: recipe for target
'debian/stamp/do-install-indep' failed
make[1]: *** [debian/stamp/do-install-indep] Error 2
make[1]: *** Auf noch nicht beendete Prozesse wird gewartet =E2=80=A6
make[3]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
=3D=3D=3D=3D=3D=3D making target debian/stamp/BIN/linux-image-3.19.8-ckt2-d=
bg [new prereqs:
do-pre-bin-arch pre-linux-image-3.19.8-ckt2-dbg]=3D=3D=3D=3D=3D=3D

=3D=3D=3D=3D=3D=3D making target debian/stamp/dep-binary-arch [new prereqs:=
 pre-bin-arch
linux-headers-3.19.8-ckt2 linux-image-3.19.8-ckt2 linux-image-3.19.8-ckt2-d=
bg
linux-uml-3.19.8-ckt2]=3D=3D=3D=3D=3D=3D
make[2]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
make[1]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
dpkg-buildpackage: Fehler: Fehler-Exitstatus von fakeroot debian/rules bina=
ry
war 2
debian/ruleset/targets/common.mk:401: recipe for target
'debian/stamp/build/buildpackage' failed
make: *** [debian/stamp/build/buildpackage] Error 2
h@h:/media/h/C_SSD/kernel2/linux-source-3.19.0$=20
-----------------------

I think I tried to apply this patch up to 5 times, but it didn't worked.

Could you please provide a working kernel-version with the applied patch? At
least that would be very helpful. I have no ideas how I should proceed
otherwise. It's like I'm trying something and it is always a dead end. By t=
he
way, the compile needed 11 hours and to see that it didn't work afterwards =
is
very frustrating.

I hope you can help me with that and I will be able to apply a kernel-versi=
on
with the applied patch.

Thanks in advance
Best regards
Jedet

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1438431674.C3B171.8979
Date: Sat, 1 Aug 2015 12:21:14 +0000
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
   title=3D"NEW - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspi=
re 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90569#c5">Comment=
 # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [NV67] GUI freezes after startup of Ubuntu 15.04. on Aspi=
re 7520p [BUG: unable to handle kernel paging request at f84c8000]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D90569">bug 90569<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
jedet&#64;gmx.de" title=3D"Jedet Ilrihm &lt;jedet&#64;gmx.de&gt;"> <span cl=
ass=3D"fn">Jedet Ilrihm</span></a>
</span></b>
        <pre>Hi Ilia,

I tried to create a kernel-version with the applied patch, but I had several
problems:
1. this <a href=3D"https://bugs.launchpad.net/ubuntu/+source/linux/+bug/146=
0768">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1460768</a> bug
occurred
2. such a bug occurred:
-----------------------
Note: Writing hsi_event.9
Warn: meta author : no refentry/info/author=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
hsi_get_channel_id_by_name
Note: meta author : see <a href=3D"http://docbook.sf.net/el/author">http://=
docbook.sf.net/el/author</a>=20=20=20=20=20=20=20=20=20=20=20
hsi_get_channel_id_by_name
Warn: meta author : no author data, so inserted a fixme=20=20=20=20=20=20=
=20=20=20=20=20
hsi_get_channel_id_by_name
Note: Writing hsi_get_channel_id_by_name.9
gzip -f Documentation/DocBook/man/*.9
make[3]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
debian/ruleset/targets/doc.mk:34: recipe for target
'debian/stamp/install/linux-doc-3.19.8-ckt2' failed
make[2]: *** [debian/stamp/install/linux-doc-3.19.8-ckt2] Error 2
make[2]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
debian/ruleset/common/targets.mk:357: recipe for target
'debian/stamp/do-install-indep' failed
make[1]: *** [debian/stamp/do-install-indep] Error 2
make[1]: *** Auf noch nicht beendete Prozesse wird gewartet =E2=80=A6
make[3]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
=3D=3D=3D=3D=3D=3D making target debian/stamp/BIN/linux-image-3.19.8-ckt2-d=
bg [new prereqs:
do-pre-bin-arch pre-linux-image-3.19.8-ckt2-dbg]=3D=3D=3D=3D=3D=3D

=3D=3D=3D=3D=3D=3D making target debian/stamp/dep-binary-arch [new prereqs:=
 pre-bin-arch
linux-headers-3.19.8-ckt2 linux-image-3.19.8-ckt2 linux-image-3.19.8-ckt2-d=
bg
linux-uml-3.19.8-ckt2]=3D=3D=3D=3D=3D=3D
make[2]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
make[1]: Leaving directory '/media/h/C_SSD/kernel2/linux-source-3.19.0'
dpkg-buildpackage: Fehler: Fehler-Exitstatus von fakeroot debian/rules bina=
ry
war 2
debian/ruleset/targets/common.mk:401: recipe for target
'debian/stamp/build/buildpackage' failed
make: *** [debian/stamp/build/buildpackage] Error 2
h&#64;h:/media/h/C_SSD/kernel2/linux-source-3.19.0$=20
-----------------------

I think I tried to apply this patch up to 5 times, but it didn't worked.

Could you please provide a working kernel-version with the applied patch? At
least that would be very helpful. I have no ideas how I should proceed
otherwise. It's like I'm trying something and it is always a dead end. By t=
he
way, the compile needed 11 hours and to see that it didn't work afterwards =
is
very frustrating.

I hope you can help me with that and I will be able to apply a kernel-versi=
on
with the applied patch.

Thanks in advance
Best regards
Jedet</pre>
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

--1438431674.C3B171.8979--

--===============1545987558==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1545987558==--
