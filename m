From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Sun, 19 May 2013 21:10:30 +0000
Message-ID: <bug-64774-8800-cKEVdI52jB@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0964021069=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64774-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0964021069==
Content-Type: multipart/alternative; boundary="1368997830.aB2F1.7146"; charset="us-ascii"


--1368997830.aB2F1.7146
Date: Sun, 19 May 2013 21:10:30 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #4 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

Ok, here goes:

Reading symbols from
/usr/lib/modules/3.8.11-200.fc18.x86_64/kernel/drivers/gpu/drm/nouveau/nouv=
eau.ko...(no
debugging symbols found)...done.
Missing separate debuginfos, use: debuginfo-install
kernel-3.8.11-200.fc18.x86_64

(gdb) disassemble nvc0_vm_map_sg
Dump of assembler code for function nvc0_vm_map_sg:
   0x0000000000023b20 <+0>:    callq  0x23b25 <nvc0_vm_map_sg+5>
   0x0000000000023b25 <+5>:    push   %rbp
   0x0000000000023b26 <+6>:    mov    %rsp,%rbp
   0x0000000000023b29 <+9>:    push   %r15
   0x0000000000023b2b <+11>:    push   %r14
   0x0000000000023b2d <+13>:    push   %r13
   0x0000000000023b2f <+15>:    mov    %rsi,%r13
   0x0000000000023b32 <+18>:    push   %r12
   0x0000000000023b34 <+20>:    push   %rbx
   0x0000000000023b35 <+21>:    lea    0x0(,%rcx,8),%ebx
   0x0000000000023b3c <+28>:    sub    $0x38,%rsp
   0x0000000000023b40 <+32>:    mov    0x30(%rdi),%esi
   0x0000000000023b43 <+35>:    mov    %rdx,-0x40(%rbp)
   0x0000000000023b47 <+39>:    mov    %rdi,-0x38(%rbp)
   0x0000000000023b4b <+43>:    mov    %r9,-0x48(%rbp)
   0x0000000000023b4f <+47>:    lea    -0x1(%r8),%edx
   0x0000000000023b53 <+51>:    mov    %esi,%eax
   0x0000000000023b55 <+53>:    and    $0x10,%eax
   0x0000000000023b58 <+56>:    cmp    $0x1,%eax
   0x0000000000023b5b <+59>:    sbb    %eax,%eax
   0x0000000000023b5d <+61>:    and    $0xfffffffe,%eax
   0x0000000000023b60 <+64>:    add    $0x7,%eax

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1368997830.aB2F1.7146
Date: Sun, 19 May 2013 21:10:30 +0000
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
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW --- - nouveau GF108 kernel crash in optimus mode when enabl=
ing external display output"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774">bug 64774<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pasik&#64;iki.fi" title=3D"Pasi K=C3=A4rkk=C3=A4inen &lt;pasik&#64;iki.fi&g=
t;"> <span class=3D"fn">Pasi K=C3=A4rkk=C3=A4inen</span></a>
</span></b>
        <pre>
Ok, here goes:

Reading symbols from
/usr/lib/modules/3.8.11-200.fc18.x86_64/kernel/drivers/gpu/drm/nouveau/nouv=
eau.ko...(no
debugging symbols found)...done.
Missing separate debuginfos, use: debuginfo-install
kernel-3.8.11-200.fc18.x86_64

(gdb) disassemble nvc0_vm_map_sg
Dump of assembler code for function nvc0_vm_map_sg:
   0x0000000000023b20 &lt;+0&gt;:    callq  0x23b25 &lt;nvc0_vm_map_sg+5&gt;
   0x0000000000023b25 &lt;+5&gt;:    push   %rbp
   0x0000000000023b26 &lt;+6&gt;:    mov    %rsp,%rbp
   0x0000000000023b29 &lt;+9&gt;:    push   %r15
   0x0000000000023b2b &lt;+11&gt;:    push   %r14
   0x0000000000023b2d &lt;+13&gt;:    push   %r13
   0x0000000000023b2f &lt;+15&gt;:    mov    %rsi,%r13
   0x0000000000023b32 &lt;+18&gt;:    push   %r12
   0x0000000000023b34 &lt;+20&gt;:    push   %rbx
   0x0000000000023b35 &lt;+21&gt;:    lea    0x0(,%rcx,8),%ebx
   0x0000000000023b3c &lt;+28&gt;:    sub    $0x38,%rsp
   0x0000000000023b40 &lt;+32&gt;:    mov    0x30(%rdi),%esi
   0x0000000000023b43 &lt;+35&gt;:    mov    %rdx,-0x40(%rbp)
   0x0000000000023b47 &lt;+39&gt;:    mov    %rdi,-0x38(%rbp)
   0x0000000000023b4b &lt;+43&gt;:    mov    %r9,-0x48(%rbp)
   0x0000000000023b4f &lt;+47&gt;:    lea    -0x1(%r8),%edx
   0x0000000000023b53 &lt;+51&gt;:    mov    %esi,%eax
   0x0000000000023b55 &lt;+53&gt;:    and    $0x10,%eax
   0x0000000000023b58 &lt;+56&gt;:    cmp    $0x1,%eax
   0x0000000000023b5b &lt;+59&gt;:    sbb    %eax,%eax
   0x0000000000023b5d &lt;+61&gt;:    and    $0xfffffffe,%eax
   0x0000000000023b60 &lt;+64&gt;:    add    $0x7,%eax</pre>
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

--1368997830.aB2F1.7146--

--===============0964021069==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0964021069==--
