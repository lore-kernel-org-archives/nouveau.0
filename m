From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 101665] lspci blocks forever with a GP107M
Date: Mon, 13 Nov 2017 18:39:53 +0000
Message-ID: <bug-101665-8800-3n97BQuvZe@http.bugs.freedesktop.org/>
References: <bug-101665-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1399517026=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-101665-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1399517026==
Content-Type: multipart/alternative; boundary="15105983931.af9Dae.10783";
 charset="UTF-8"


--15105983931.af9Dae.10783
Date: Mon, 13 Nov 2017 18:39:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D101665

Etienne URBAH <eurbah-GANU6spQydw@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |eurbah-GANU6spQydw@public.gmane.org

--- Comment #4 from Etienne URBAH <eurbah-GANU6spQydw@public.gmane.org> ---
I am trying to use 'nouveau' with GP107M [GeForce GTX 1050 Ti Mobile].

With Linux Kernel 4.13.0-16 from Ubuntu 17.10 Artful, 'lspci' systematically
makes immediately 1 CPU freeze.

Therefore, I am testing Linux kernels from
http://kernel.ubuntu.com/~kernel-ppa/mainline

With Linux kernel 4.14.0-rc7, this issue does NOT show up :

$ lspci -nn -v -s 1:0
01:00.0 3D controller [0302]: NVIDIA Corporation GP107M [GeForce GTX 1050 Ti
Mobile] [10de:1c8c] (rev a1)
        Subsystem: Micro-Star International Co., Ltd. [MSI] GP107M [GeForce=
 GTX
1050 Ti Mobile] [1462:11c8]
        Flags: bus master, fast devsel, latency 0, IRQ 134
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at df000000 [disabled] [size=3D512K]
        Capabilities: <access denied>
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

With Linux kernel 4.14.0-rc8, 'lspci' systematically makes immediately the
whole computer freeze.

With Linux kernel 4.14.0 (released yesterday), 'lspci' systematically fails=
 to
answer, and makes the whole computer freeze after some time.

So, there is probably a regression.

I have also reported this issue at
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1729736

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15105983931.af9Dae.10783
Date: Mon, 13 Nov 2017 18:39:53 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:eurbah&#6=
4;free.fr" title=3D"Etienne URBAH &lt;eurbah&#64;free.fr&gt;"> <span class=
=3D"fn">Etienne URBAH</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101665">bug 10166=
5</a>
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
           <td>eurbah&#64;free.fr
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101665#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - lspci blocks forever with a GP107M"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D101665">bug 10166=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eurbah&#64;free.fr" title=3D"Etienne URBAH &lt;eurbah&#64;free.fr&gt;"> <sp=
an class=3D"fn">Etienne URBAH</span></a>
</span></b>
        <pre>I am trying to use 'nouveau' with GP107M [GeForce GTX 1050 Ti =
Mobile].

With Linux Kernel 4.13.0-16 from Ubuntu 17.10 Artful, 'lspci' systematically
makes immediately 1 CPU freeze.

Therefore, I am testing Linux kernels from
<a href=3D"http://kernel.ubuntu.com/~kernel-ppa/mainline">http://kernel.ubu=
ntu.com/~kernel-ppa/mainline</a>

With Linux kernel 4.14.0-rc7, this issue does NOT show up :

$ lspci -nn -v -s 1:0
01:00.0 3D controller [0302]: NVIDIA Corporation GP107M [GeForce GTX 1050 Ti
Mobile] [10de:1c8c] (rev a1)
        Subsystem: Micro-Star International Co., Ltd. [MSI] GP107M [GeForce=
 GTX
1050 Ti Mobile] [1462:11c8]
        Flags: bus master, fast devsel, latency 0, IRQ 134
        Memory at de000000 (32-bit, non-prefetchable) [size=3D16M]
        Memory at c0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at d0000000 (64-bit, prefetchable) [size=3D32M]
        I/O ports at e000 [size=3D128]
        Expansion ROM at df000000 [disabled] [size=3D512K]
        Capabilities: &lt;access denied&gt;
        Kernel driver in use: nouveau
        Kernel modules: nvidiafb, nouveau

With Linux kernel 4.14.0-rc8, 'lspci' systematically makes immediately the
whole computer freeze.

With Linux kernel 4.14.0 (released yesterday), 'lspci' systematically fails=
 to
answer, and makes the whole computer freeze after some time.

So, there is probably a regression.

I have also reported this issue at
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1729736">ht=
tps://bugs.launchpad.net/ubuntu/+source/linux/+bug/1729736</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15105983931.af9Dae.10783--

--===============1399517026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1399517026==--
