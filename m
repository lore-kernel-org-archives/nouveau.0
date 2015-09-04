From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69349] Random image corruptions (in Debian Wheezy
 with Linux 3.2)
Date: Fri, 04 Sep 2015 06:24:45 +0000
Message-ID: <bug-69349-8800-cI8Qtl53jX@http.bugs.freedesktop.org/>
References: <bug-69349-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1078443639=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69349-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1078443639==
Content-Type: multipart/alternative; boundary="1441347885.eeEf2.13425"; charset="UTF-8"


--1441347885.eeEf2.13425
Date: Fri, 4 Sep 2015 06:24:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D69349

--- Comment #7 from Paul Menzel <paulepanter-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #6)
> (In reply to Paul Menzel from comment #5)
> > (In reply to Tobias Klausmann from comment #4)
> > > Is this still a problem with newer software (kernel/xf86-video-nouvea=
u)?
> >=20
> > Yes, I am still able to reproduce this with Debian Jessie/testing, which
> > currently has Linux kernel 3.19.x and `xserver-xorg-video-nouveau`
> > 1:1.0.11-1.
> >=20
> > Suddenly the corruptions start on the left side of the monitor and then=
 I
> > can see how slow the window of uxterm is rendered line by line (takes m=
aybe
> > two seconds). If I do not shut the system down, it=E2=80=99ll eventuall=
y freeze.

This is now with Debian 8.1 (Jessie/stable) and Linux 4.1.1.

> Are there any messages in dmesg when this happens?

Normally there are no messages. In a few times, the following message can be
seen.

    [  663.478750] do_IRQ: 1.160 No irq handler for vector (irq -1)

> I assume this is still with the G98?

Indeed, it=E2=80=99s still with the same card.

```
$ lspci -v -s 04:00.0
04:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce 8400 GS =
Rev.
2] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Micro-Star International Co., Ltd. [MSI] Device 2060
    Flags: bus master, fast devsel, latency 0, IRQ 29
    Memory at fd000000 (32-bit, non-prefetchable) [size=3D16M]
    Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
    Memory at fa000000 (64-bit, non-prefetchable) [size=3D32M]
    I/O ports at ec00 [size=3D128]
    [virtual] Expansion ROM at fc000000 [disabled] [size=3D128K]
    Capabilities: <access denied>
    Kernel driver in use: nouveau
```

> What environment do you use? Gnome? KDE? Redirecting compositor which uses
> GL?

The awesome WM 3.4.15 [1] (no compositing as far as I know) is started with
`exec startx`.

[1] http://awesome.naquadah.org

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1441347885.eeEf2.13425
Date: Fri, 4 Sep 2015 06:24:45 +0000
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
   title=3D"NEW - Random image corruptions (in Debian Wheezy with Linux 3.2=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349#c7">Comment=
 # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Random image corruptions (in Debian Wheezy with Linux 3.2=
)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D69349">bug 69349<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
paulepanter&#64;users.sourceforge.net" title=3D"Paul Menzel &lt;paulepanter=
&#64;users.sourceforge.net&gt;"> <span class=3D"fn">Paul Menzel</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href=3D"show_bug.cgi?id=3D693=
49#c6">comment #6</a>)
<span class=3D"quote">&gt; (In reply to Paul Menzel from <a href=3D"show_bu=
g.cgi?id=3D69349#c5">comment #5</a>)
&gt; &gt; (In reply to Tobias Klausmann from <a href=3D"show_bug.cgi?id=3D6=
9349#c4">comment #4</a>)
&gt; &gt; &gt; Is this still a problem with newer software (kernel/xf86-vid=
eo-nouveau)?
&gt; &gt;=20
&gt; &gt; Yes, I am still able to reproduce this with Debian Jessie/testing=
, which
&gt; &gt; currently has Linux kernel 3.19.x and `xserver-xorg-video-nouveau`
&gt; &gt; 1:1.0.11-1.
&gt; &gt;=20
&gt; &gt; Suddenly the corruptions start on the left side of the monitor an=
d then I
&gt; &gt; can see how slow the window of uxterm is rendered line by line (t=
akes maybe
&gt; &gt; two seconds). If I do not shut the system down, it=E2=80=99ll eve=
ntually freeze.</span >

This is now with Debian 8.1 (Jessie/stable) and Linux 4.1.1.

<span class=3D"quote">&gt; Are there any messages in dmesg when this happen=
s?</span >

Normally there are no messages. In a few times, the following message can be
seen.

    [  663.478750] do_IRQ: 1.160 No irq handler for vector (irq -1)

<span class=3D"quote">&gt; I assume this is still with the G98?</span >

Indeed, it=E2=80=99s still with the same card.

```
$ lspci -v -s 04:00.0
04:00.0 VGA compatible controller: NVIDIA Corporation G98 [GeForce 8400 GS =
Rev.
2] (rev a1) (prog-if 00 [VGA controller])
    Subsystem: Micro-Star International Co., Ltd. [MSI] Device 2060
    Flags: bus master, fast devsel, latency 0, IRQ 29
    Memory at fd000000 (32-bit, non-prefetchable) [size=3D16M]
    Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
    Memory at fa000000 (64-bit, non-prefetchable) [size=3D32M]
    I/O ports at ec00 [size=3D128]
    [virtual] Expansion ROM at fc000000 [disabled] [size=3D128K]
    Capabilities: &lt;access denied&gt;
    Kernel driver in use: nouveau
```

<span class=3D"quote">&gt; What environment do you use? Gnome? KDE? Redirec=
ting compositor which uses
&gt; GL?</span >

The awesome WM 3.4.15 [1] (no compositing as far as I know) is started with
`exec startx`.

[1] <a href=3D"http://awesome.naquadah.org">http://awesome.naquadah.org</a>=
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

--1441347885.eeEf2.13425--

--===============1078443639==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1078443639==--
