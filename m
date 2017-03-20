From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99400] [nouveau] garbled rendering with glamor on G71
Date: Mon, 20 Mar 2017 11:13:08 +0000
Message-ID: <bug-99400-8800-Is3fYac4ta@http.bugs.freedesktop.org/>
References: <bug-99400-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1589557446=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99400-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1589557446==
Content-Type: multipart/alternative; boundary="14900083881.CedED9b40.1933";
 charset="UTF-8"


--14900083881.CedED9b40.1933
Date: Mon, 20 Mar 2017 11:13:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99400

--- Comment #25 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

Daily/nightly composes can be found here:

Fedora 26
https://dl.fedoraproject.org/pub/fedora/linux/development/26/Spins/x86_64/i=
so/
https://dl.fedoraproject.org/pub/fedora/linux/development/26/Workstation/x8=
6_64/iso/

Rawhide - Fedora 27
https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Spins/x86=
_64/iso/
https://dl.fedoraproject.org/pub/fedora/linux/development/rawhide/Workstati=
on/x86_64/iso/

...........................................................

How to write LiveDVD ISO image to portable USB flash drive:

e.g.
# dd if=3DFedora*Live*.iso of=3D/dev/disk/by-id/usb-<ID_SERIAL> \
  bs=3D1M iflag=3Ddirect oflag=3Ddirect conv=3Dfdatasync status=3Dprogress

If /dev/sdz represents portable USB flash drive
$ udevadm info -q env -n sdz | grep ID_SERIAL=3D

Using ID_SERIAL known is the exact device that will be used

WARNING: using 'dd' will erase all partitions and -data- on portable USB fl=
ash
drive

Ref.
https://fedoraproject.org/wiki/How_to_create_and_use_Live_USB

..........................................

How to install demonstrative GTK+ widgets:
# dnf install gtk2-devel gtk3-devel

--=20
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.=

--14900083881.CedED9b40.1933
Date: Mon, 20 Mar 2017 11:13:08 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400#c25">Commen=
t # 25</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [nouveau] garbled rendering with glamor on G71"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99400">bug 99400<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pomidorabelisima&#64;gmail.com" title=3D"poma &lt;pomidorabelisima&#64;gmai=
l.com&gt;"> <span class=3D"fn">poma</span></a>
</span></b>
        <pre>
Daily/nightly composes can be found here:

Fedora 26
<a href=3D"https://dl.fedoraproject.org/pub/fedora/linux/development/26/Spi=
ns/x86_64/iso/">https://dl.fedoraproject.org/pub/fedora/linux/development/2=
6/Spins/x86_64/iso/</a>
<a href=3D"https://dl.fedoraproject.org/pub/fedora/linux/development/26/Wor=
kstation/x86_64/iso/">https://dl.fedoraproject.org/pub/fedora/linux/develop=
ment/26/Workstation/x86_64/iso/</a>

Rawhide - Fedora 27
<a href=3D"https://dl.fedoraproject.org/pub/fedora/linux/development/rawhid=
e/Spins/x86_64/iso/">https://dl.fedoraproject.org/pub/fedora/linux/developm=
ent/rawhide/Spins/x86_64/iso/</a>
<a href=3D"https://dl.fedoraproject.org/pub/fedora/linux/development/rawhid=
e/Workstation/x86_64/iso/">https://dl.fedoraproject.org/pub/fedora/linux/de=
velopment/rawhide/Workstation/x86_64/iso/</a>

...........................................................

How to write LiveDVD ISO image to portable USB flash drive:

e.g.
# dd if=3DFedora*Live*.iso of=3D/dev/disk/by-id/usb-&lt;ID_SERIAL&gt; \
  bs=3D1M iflag=3Ddirect oflag=3Ddirect conv=3Dfdatasync status=3Dprogress

If /dev/sdz represents portable USB flash drive
$ udevadm info -q env -n sdz | grep ID_SERIAL=3D

Using ID_SERIAL known is the exact device that will be used

WARNING: using 'dd' will erase all partitions and -data- on portable USB fl=
ash
drive

Ref.
<a href=3D"https://fedoraproject.org/wiki/How_to_create_and_use_Live_USB">h=
ttps://fedoraproject.org/wiki/How_to_create_and_use_Live_USB</a>

..........................................

How to install demonstrative GTK+ widgets:
# dnf install gtk2-devel gtk3-devel</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>=

--14900083881.CedED9b40.1933--

--===============1589557446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1589557446==--
