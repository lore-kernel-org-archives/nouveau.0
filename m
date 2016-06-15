From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89664] Nouveau fails to enter KMS with the Gigabyte
 G1 Gaming GTX970
Date: Wed, 15 Jun 2016 14:46:01 +0000
Message-ID: <bug-89664-8800-FjRzDXzUPd@http.bugs.freedesktop.org/>
References: <bug-89664-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0745218364=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89664-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0745218364==
Content-Type: multipart/alternative; boundary="14660019612.30C7.2202";
 charset="UTF-8"


--14660019612.30C7.2202
Date: Wed, 15 Jun 2016 14:46:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D89664

--- Comment #14 from Ehsan Azar <dashesy-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I had the exact same issue with GM107:

```
ehsan@machine:~$ lspci -nn | grep -i vga
03:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107GL [Quadro
K620] [10de:13bb] (rev a2)
```

Adding `nouveau.config=3DNvForcePost=3D1` to the kernel command line fixed =
it for
me too, thanks Omar. This is `Ubuntu 16.04 LTS` with kernel version
`4.4.0-24-generic #43-Ubuntu SMP Wed Jun 8 19:27:37 UTC 2016 x86_64 x86_64
x86_64 GNU/Linux`

Even the colored striped bars look similar, and I hear a noise I think might
have to do with incorrect frequency setting for the monitor.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14660019612.30C7.2202
Date: Wed, 15 Jun 2016 14:46:01 +0000
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
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664#c14">Commen=
t # 14</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Nouveau fails to enter KMS with the Gigabyte G1 Gaming GT=
X970"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D89664">bug 89664<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dashesy&#64;gmail.com" title=3D"Ehsan Azar &lt;dashesy&#64;gmail.com&gt;"> =
<span class=3D"fn">Ehsan Azar</span></a>
</span></b>
        <pre>I had the exact same issue with GM107:

```
ehsan&#64;machine:~$ lspci -nn | grep -i vga
03:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM107GL [Quadro
K620] [10de:13bb] (rev a2)
```

Adding `nouveau.config=3DNvForcePost=3D1` to the kernel command line fixed =
it for
me too, thanks Omar. This is `Ubuntu 16.04 LTS` with kernel version
`4.4.0-24-generic #43-Ubuntu SMP Wed Jun 8 19:27:37 UTC 2016 x86_64 x86_64
x86_64 GNU/Linux`

Even the colored striped bars look similar, and I hear a noise I think might
have to do with incorrect frequency setting for the monitor.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14660019612.30C7.2202--

--===============0745218364==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0745218364==--
