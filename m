From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64774] nouveau GF108 kernel crash in optimus mode
 when enabling external display output
Date: Sun, 19 May 2013 21:12:56 +0000
Message-ID: <bug-64774-8800-qwyx7pFGcv@http.bugs.freedesktop.org/>
References: <bug-64774-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0385028635=="
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


--===============0385028635==
Content-Type: multipart/alternative; boundary="1368997976.dAF11.7473"; charset="us-ascii"


--1368997976.dAF11.7473
Date: Sun, 19 May 2013 21:12:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

https://bugs.freedesktop.org/show_bug.cgi?id=3D64774

--- Comment #5 from Pasi K=C3=A4rkk=C3=A4inen <pasik-X3B1VOXEql0@public.gmane.org> ---

here's the whole function:

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
   0x0000000000023b63 <+67>:    test   %r8d,%r8d
   0x0000000000023b66 <+70>:    je     0x23c16 <nvc0_vm_map_sg+246>
   0x0000000000023b6c <+76>:    mov    %rax,%rcx
   0x0000000000023b6f <+79>:    lea    0x4(%rbx),%eax
   0x0000000000023b72 <+82>:    lea    0x8(,%rdx,8),%rdx
   0x0000000000023b7a <+90>:    xor    %r15d,%r15d
   0x0000000000023b7d <+93>:    shl    $0x20,%rcx
   0x0000000000023b81 <+97>:    mov    %eax,-0x5c(%rbp)
   0x0000000000023b84 <+100>:    mov    %r13,%rax
   0x0000000000023b87 <+103>:    mov    %rcx,-0x50(%rbp)
   0x0000000000023b8b <+107>:    mov    %r15,%r13
   0x0000000000023b8e <+110>:    mov    %rdx,-0x58(%rbp)
   0x0000000000023b92 <+114>:    mov    %rax,%r15
   0x0000000000023b95 <+117>:    jmp    0x23ba7 <nvc0_vm_map_sg+135>
   0x0000000000023b97 <+119>:    nopw   0x0(%rax,%rax,1)
   0x0000000000023ba0 <+128>:    mov    -0x38(%rbp),%rdx
   0x0000000000023ba4 <+132>:    mov    0x30(%rdx),%esi
   0x0000000000023ba7 <+135>:    mov    -0x48(%rbp),%rcx
   0x0000000000023bab <+139>:    mov    %r15,%rdi
   0x0000000000023bae <+142>:    mov    (%rcx,%r13,1),%rax
   0x0000000000023bb2 <+146>:    shr    $0x8,%rax
   0x0000000000023bb6 <+150>:    mov    %rax,%rdx
   0x0000000000023bb9 <+153>:    or     $0x3,%rax
   0x0000000000023bbd <+157>:    or     $0x1,%rdx
   0x0000000000023bc1 <+161>:    and    $0x4,%esi
   0x0000000000023bc4 <+164>:    lea    0x0(%r13,%rbx,1),%esi
   0x0000000000023bc9 <+169>:    cmovne %rax,%rdx
   0x0000000000023bcd <+173>:    mov    -0x40(%rbp),%rax
   0x0000000000023bd1 <+177>:    mov    0xd8(%rax),%r14d
   0x0000000000023bd8 <+184>:    shl    $0x24,%r14
   0x0000000000023bdc <+188>:    or     -0x50(%rbp),%r14
   0x0000000000023be0 <+192>:    or     %rdx,%r14
   0x0000000000023be3 <+195>:    mov    (%r15),%rdx
   0x0000000000023be6 <+198>:    mov    0x8(%rdx),%r10
   0x0000000000023bea <+202>:    mov    %r14d,%edx
   0x0000000000023bed <+205>:    callq  *0x48(%r10)
   0x0000000000023bf1 <+209>:    mov    (%r15),%rdx
   0x0000000000023bf4 <+212>:    mov    -0x5c(%rbp),%esi
   0x0000000000023bf7 <+215>:    mov    %r15,%rdi
   0x0000000000023bfa <+218>:    mov    0x8(%rdx),%r10
   0x0000000000023bfe <+222>:    mov    %r14,%rdx
   0x0000000000023c01 <+225>:    add    %r13d,%esi
   0x0000000000023c04 <+228>:    shr    $0x20,%rdx
   0x0000000000023c08 <+232>:    add    $0x8,%r13
   0x0000000000023c0c <+236>:    callq  *0x48(%r10)
   0x0000000000023c10 <+240>:    cmp    -0x58(%rbp),%r13
   0x0000000000023c14 <+244>:    jne    0x23ba0 <nvc0_vm_map_sg+128>
   0x0000000000023c16 <+246>:    add    $0x38,%rsp
   0x0000000000023c1a <+250>:    pop    %rbx
   0x0000000000023c1b <+251>:    pop    %r12
   0x0000000000023c1d <+253>:    pop    %r13
   0x0000000000023c1f <+255>:    pop    %r14
   0x0000000000023c21 <+257>:    pop    %r15
   0x0000000000023c23 <+259>:    pop    %rbp
   0x0000000000023c24 <+260>:    retq=20=20=20
End of assembler dump.
(gdb)

--=20
You are receiving this mail because:
You are the assignee for the bug.

--1368997976.dAF11.7473
Date: Sun, 19 May 2013 21:12:56 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D64774#c5">Comment=
 # 5</a>
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
here's the whole function:

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
   0x0000000000023b60 &lt;+64&gt;:    add    $0x7,%eax
   0x0000000000023b63 &lt;+67&gt;:    test   %r8d,%r8d
   0x0000000000023b66 &lt;+70&gt;:    je     0x23c16 &lt;nvc0_vm_map_sg+246=
&gt;
   0x0000000000023b6c &lt;+76&gt;:    mov    %rax,%rcx
   0x0000000000023b6f &lt;+79&gt;:    lea    0x4(%rbx),%eax
   0x0000000000023b72 &lt;+82&gt;:    lea    0x8(,%rdx,8),%rdx
   0x0000000000023b7a &lt;+90&gt;:    xor    %r15d,%r15d
   0x0000000000023b7d &lt;+93&gt;:    shl    $0x20,%rcx
   0x0000000000023b81 &lt;+97&gt;:    mov    %eax,-0x5c(%rbp)
   0x0000000000023b84 &lt;+100&gt;:    mov    %r13,%rax
   0x0000000000023b87 &lt;+103&gt;:    mov    %rcx,-0x50(%rbp)
   0x0000000000023b8b &lt;+107&gt;:    mov    %r15,%r13
   0x0000000000023b8e &lt;+110&gt;:    mov    %rdx,-0x58(%rbp)
   0x0000000000023b92 &lt;+114&gt;:    mov    %rax,%r15
   0x0000000000023b95 &lt;+117&gt;:    jmp    0x23ba7 &lt;nvc0_vm_map_sg+13=
5&gt;
   0x0000000000023b97 &lt;+119&gt;:    nopw   0x0(%rax,%rax,1)
   0x0000000000023ba0 &lt;+128&gt;:    mov    -0x38(%rbp),%rdx
   0x0000000000023ba4 &lt;+132&gt;:    mov    0x30(%rdx),%esi
   0x0000000000023ba7 &lt;+135&gt;:    mov    -0x48(%rbp),%rcx
   0x0000000000023bab &lt;+139&gt;:    mov    %r15,%rdi
   0x0000000000023bae &lt;+142&gt;:    mov    (%rcx,%r13,1),%rax
   0x0000000000023bb2 &lt;+146&gt;:    shr    $0x8,%rax
   0x0000000000023bb6 &lt;+150&gt;:    mov    %rax,%rdx
   0x0000000000023bb9 &lt;+153&gt;:    or     $0x3,%rax
   0x0000000000023bbd &lt;+157&gt;:    or     $0x1,%rdx
   0x0000000000023bc1 &lt;+161&gt;:    and    $0x4,%esi
   0x0000000000023bc4 &lt;+164&gt;:    lea    0x0(%r13,%rbx,1),%esi
   0x0000000000023bc9 &lt;+169&gt;:    cmovne %rax,%rdx
   0x0000000000023bcd &lt;+173&gt;:    mov    -0x40(%rbp),%rax
   0x0000000000023bd1 &lt;+177&gt;:    mov    0xd8(%rax),%r14d
   0x0000000000023bd8 &lt;+184&gt;:    shl    $0x24,%r14
   0x0000000000023bdc &lt;+188&gt;:    or     -0x50(%rbp),%r14
   0x0000000000023be0 &lt;+192&gt;:    or     %rdx,%r14
   0x0000000000023be3 &lt;+195&gt;:    mov    (%r15),%rdx
   0x0000000000023be6 &lt;+198&gt;:    mov    0x8(%rdx),%r10
   0x0000000000023bea &lt;+202&gt;:    mov    %r14d,%edx
   0x0000000000023bed &lt;+205&gt;:    callq  *0x48(%r10)
   0x0000000000023bf1 &lt;+209&gt;:    mov    (%r15),%rdx
   0x0000000000023bf4 &lt;+212&gt;:    mov    -0x5c(%rbp),%esi
   0x0000000000023bf7 &lt;+215&gt;:    mov    %r15,%rdi
   0x0000000000023bfa &lt;+218&gt;:    mov    0x8(%rdx),%r10
   0x0000000000023bfe &lt;+222&gt;:    mov    %r14,%rdx
   0x0000000000023c01 &lt;+225&gt;:    add    %r13d,%esi
   0x0000000000023c04 &lt;+228&gt;:    shr    $0x20,%rdx
   0x0000000000023c08 &lt;+232&gt;:    add    $0x8,%r13
   0x0000000000023c0c &lt;+236&gt;:    callq  *0x48(%r10)
   0x0000000000023c10 &lt;+240&gt;:    cmp    -0x58(%rbp),%r13
   0x0000000000023c14 &lt;+244&gt;:    jne    0x23ba0 &lt;nvc0_vm_map_sg+12=
8&gt;
   0x0000000000023c16 &lt;+246&gt;:    add    $0x38,%rsp
   0x0000000000023c1a &lt;+250&gt;:    pop    %rbx
   0x0000000000023c1b &lt;+251&gt;:    pop    %r12
   0x0000000000023c1d &lt;+253&gt;:    pop    %r13
   0x0000000000023c1f &lt;+255&gt;:    pop    %r14
   0x0000000000023c21 &lt;+257&gt;:    pop    %r15
   0x0000000000023c23 &lt;+259&gt;:    pop    %rbp
   0x0000000000023c24 &lt;+260&gt;:    retq=20=20=20
End of assembler dump.
(gdb)</pre>
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

--1368997976.dAF11.7473--

--===============0385028635==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0385028635==--
