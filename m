From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98506] Pagefault in gf100_vm_flush
Date: Sun, 30 Oct 2016 17:37:40 +0000
Message-ID: <bug-98506-8800-TVtMsUHIhg@http.bugs.freedesktop.org/>
References: <bug-98506-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0213594731=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-98506-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0213594731==
Content-Type: multipart/alternative; boundary="14778490602.c9dFf.31867";
 charset="UTF-8"


--14778490602.c9dFf.31867
Date: Sun, 30 Oct 2016 17:37:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98506

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Karol, can you load up nouveau.ko and run "disassemble gf100_vm_flush" (to
completion) and include that?

All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:   38 e1                   cmp    %ah,%cl
   2:   a9 00 00 ff 00          test   $0xff0000,%eax
   7:   74 cb                   je     0xffffffffffffffd4
   9:   48 81 fb ff 93 35 77    cmp    $0x773593ff,%rbx
  10:   0f 87 ae 00 00 00       ja     0xc4
  16:   49 8b 84 24 80 00 00    mov    0x80(%r12),%rax
  1d:   00=20
  1e:   31 db                   xor    %ebx,%ebx
  20:   48 8d b0 b8 0c 10 00    lea    0x100cb8(%rax),%rsi
  27:   49 8b 46 10             mov    0x10(%r14),%rax
  2b:*  48 8b b8 90 00 00 00    mov    0x90(%rax),%rdi          <-- trapping
instruction
  32:   48 c1 ef 08             shr    $0x8,%rdi
  36:   e8 68 6f 38 e1          callq  0xffffffffe1386fa3
  3b:   49                      rex.WB
  3c:   8b                      .byte 0x8b
  3d:   84 24 80                test   %ah,(%rax,%rax,4)

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:   48 8b b8 90 00 00 00    mov    0x90(%rax),%rdi
   7:   48 c1 ef 08             shr    $0x8,%rdi
   b:   e8 68 6f 38 e1          callq  0xffffffffe1386f78
  10:   49                      rex.WB
  11:   8b                      .byte 0x8b
  12:   84 24 80                test   %ah,(%rax,%rax,4)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14778490602.c9dFf.31867
Date: Sun, 30 Oct 2016 17:37:40 +0000
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
   title=3D"NEW - Pagefault in gf100_vm_flush"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98506#c1">Comment=
 # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Pagefault in gf100_vm_flush"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98506">bug 98506<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
imirkin&#64;alum.mit.edu" title=3D"Ilia Mirkin &lt;imirkin&#64;alum.mit.edu=
&gt;"> <span class=3D"fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Karol, can you load up nouveau.ko and run &quot;disassemble gf=
100_vm_flush&quot; (to
completion) and include that?

All code
=3D=3D=3D=3D=3D=3D=3D=3D
   0:   38 e1                   cmp    %ah,%cl
   2:   a9 00 00 ff 00          test   $0xff0000,%eax
   7:   74 cb                   je     0xffffffffffffffd4
   9:   48 81 fb ff 93 35 77    cmp    $0x773593ff,%rbx
  10:   0f 87 ae 00 00 00       ja     0xc4
  16:   49 8b 84 24 80 00 00    mov    0x80(%r12),%rax
  1d:   00=20
  1e:   31 db                   xor    %ebx,%ebx
  20:   48 8d b0 b8 0c 10 00    lea    0x100cb8(%rax),%rsi
  27:   49 8b 46 10             mov    0x10(%r14),%rax
  2b:*  48 8b b8 90 00 00 00    mov    0x90(%rax),%rdi          &lt;-- trap=
ping
instruction
  32:   48 c1 ef 08             shr    $0x8,%rdi
  36:   e8 68 6f 38 e1          callq  0xffffffffe1386fa3
  3b:   49                      rex.WB
  3c:   8b                      .byte 0x8b
  3d:   84 24 80                test   %ah,(%rax,%rax,4)

Code starting with the faulting instruction
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
   0:   48 8b b8 90 00 00 00    mov    0x90(%rax),%rdi
   7:   48 c1 ef 08             shr    $0x8,%rdi
   b:   e8 68 6f 38 e1          callq  0xffffffffe1386f78
  10:   49                      rex.WB
  11:   8b                      .byte 0x8b
  12:   84 24 80                test   %ah,(%rax,%rax,4)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14778490602.c9dFf.31867--

--===============0213594731==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0213594731==--
