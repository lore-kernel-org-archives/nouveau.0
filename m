From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 98506] Pagefault in gf100_vm_flush
Date: Sun, 30 Oct 2016 17:41:16 +0000
Message-ID: <bug-98506-8800-0RidYdWwH9@http.bugs.freedesktop.org/>
References: <bug-98506-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1187122307=="
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


--===============1187122307==
Content-Type: multipart/alternative; boundary="14778492750.34CeDde2d.32087";
 charset="UTF-8"


--14778492750.34CeDde2d.32087
Date: Sun, 30 Oct 2016 17:41:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D98506

--- Comment #2 from Karol Herbst <karolherbst-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(gdb) disassemble gf100_vm_flush
Dump of assembler code for function gf100_vm_flush:
   0x0000000000050f60 <+0>:     push   %rbp
   0x0000000000050f61 <+1>:     mov    %rsp,%rbp
   0x0000000000050f64 <+4>:     push   %r15
   0x0000000000050f66 <+6>:     push   %r14
   0x0000000000050f68 <+8>:     push   %r13
   0x0000000000050f6a <+10>:    mov    %rdi,%r13
   0x0000000000050f6d <+13>:    push   %r12
   0x0000000000050f6f <+15>:    push   %rbx
   0x0000000000050f70 <+16>:    sub    $0x18,%rsp
   0x0000000000050f74 <+20>:    mov    0xb0(%rdi),%edx
   0x0000000000050f7a <+26>:    mov    (%rdi),%rax
   0x0000000000050f7d <+29>:    cmp    $0x1,%edx
   0x0000000000050f80 <+32>:    mov    0x10(%rax),%r12
   0x0000000000050f84 <+36>:    sbb    %ebx,%ebx
   0x0000000000050f86 <+38>:    add    $0x20,%rax
   0x0000000000050f8a <+42>:    mov    %rax,%rdi
   0x0000000000050f8d <+45>:    mov    %rax,-0x40(%rbp)
   0x0000000000050f91 <+49>:    and    $0xfffffffc,%ebx
   0x0000000000050f94 <+52>:    callq  0x50f99 <gf100_vm_flush+57>
   0x0000000000050f99 <+57>:    mov    0x60(%r13),%r14
   0x0000000000050f9d <+61>:    lea    0x60(%r13),%rax
   0x0000000000050fa1 <+65>:    add    $0x5,%ebx
   0x0000000000050fa4 <+68>:    or     $0x80000000,%ebx
   0x0000000000050faa <+74>:    mov    %rax,-0x30(%rbp)
   0x0000000000050fae <+78>:    mov    %ebx,-0x34(%rbp)
   0x0000000000050fb1 <+81>:    cmp    %rax,%r14
   0x0000000000050fb4 <+84>:    je     0x510a9 <gf100_vm_flush+329>
   0x0000000000050fba <+90>:    mov    0x198(%r12),%r13
   0x0000000000050fc2 <+98>:    xor    %ebx,%ebx
   0x0000000000050fc4 <+100>:   mov    %r13,%rdi
   0x0000000000050fc7 <+103>:   callq  0x50fcc <gf100_vm_flush+108>
   0x0000000000050fcc <+108>:   mov    %rax,%r15
   0x0000000000050fcf <+111>:   jmp    0x50feb <gf100_vm_flush+139>
   0x0000000000050fd1 <+113>:   mov    %r13,%rdi
   0x0000000000050fd4 <+116>:   callq  0x50fd9 <gf100_vm_flush+121>
   0x0000000000050fd9 <+121>:   sub    %r15,%rax
   0x0000000000050fdc <+124>:   mov    %rax,%rbx
   0x0000000000050fdf <+127>:   cmp    $0x773593ff,%rax
   0x0000000000050fe5 <+133>:   ja     0x510c1 <gf100_vm_flush+353>
   0x0000000000050feb <+139>:   mov    0x80(%r12),%rax
   0x0000000000050ff3 <+147>:   lea    0x100c80(%rax),%rdi
   0x0000000000050ffa <+154>:   callq  0x50fff <gf100_vm_flush+159>
   0x0000000000050fff <+159>:   test   $0xff0000,%eax
   0x0000000000051004 <+164>:   je     0x50fd1 <gf100_vm_flush+113>
   0x0000000000051006 <+166>:   cmp    $0x773593ff,%rbx
   0x000000000005100d <+173>:   ja     0x510c1 <gf100_vm_flush+353>
   0x0000000000051013 <+179>:   mov    0x80(%r12),%rax
   0x000000000005101b <+187>:   xor    %ebx,%ebx
   0x000000000005101d <+189>:   lea    0x100cb8(%rax),%rsi
   0x0000000000051024 <+196>:   mov    0x10(%r14),%rax
   0x0000000000051028 <+200>:   mov    0x90(%rax),%rdi
   0x000000000005102f <+207>:   shr    $0x8,%rdi
   0x0000000000051033 <+211>:   callq  0x51038 <gf100_vm_flush+216>
   0x0000000000051038 <+216>:   mov    0x80(%r12),%rax
   0x0000000000051040 <+224>:   mov    -0x34(%rbp),%edi
   0x0000000000051043 <+227>:   lea    0x100cbc(%rax),%rsi
   0x000000000005104a <+234>:   callq  0x5104f <gf100_vm_flush+239>
   0x000000000005104f <+239>:   mov    0x198(%r12),%r13
   0x0000000000051057 <+247>:   mov    %r13,%rdi
   0x000000000005105a <+250>:   callq  0x5105f <gf100_vm_flush+255>
   0x000000000005105f <+255>:   mov    %rax,%r15
   0x0000000000051062 <+258>:   jmp    0x5107a <gf100_vm_flush+282>
   0x0000000000051064 <+260>:   mov    %r13,%rdi
   0x0000000000051067 <+263>:   callq  0x5106c <gf100_vm_flush+268>
   0x000000000005106c <+268>:   sub    %r15,%rax
   0x000000000005106f <+271>:   mov    %rax,%rbx
   0x0000000000051072 <+274>:   cmp    $0x773593ff,%rax
   0x0000000000051078 <+280>:   ja     0x510ea <gf100_vm_flush+394>
   0x000000000005107a <+282>:   mov    0x80(%r12),%rax
   0x0000000000051082 <+290>:   lea    0x100c80(%rax),%rdi
   0x0000000000051089 <+297>:   callq  0x5108e <gf100_vm_flush+302>
   0x000000000005108e <+302>:   test   $0x80,%ah
   0x0000000000051091 <+305>:   je     0x51064 <gf100_vm_flush+260>
   0x0000000000051093 <+307>:   cmp    $0x773593ff,%rbx
   0x000000000005109a <+314>:   ja     0x510ea <gf100_vm_flush+394>
   0x000000000005109c <+316>:   mov    (%r14),%r14
   0x000000000005109f <+319>:   cmp    -0x30(%rbp),%r14
   0x00000000000510a3 <+323>:   jne    0x50fba <gf100_vm_flush+90>
   0x00000000000510a9 <+329>:   mov    -0x40(%rbp),%rdi
   0x00000000000510ad <+333>:   callq  0x510b2 <gf100_vm_flush+338>
   0x00000000000510b2 <+338>:   add    $0x18,%rsp
   0x00000000000510b6 <+342>:   pop    %rbx
   0x00000000000510b7 <+343>:   pop    %r12
   0x00000000000510b9 <+345>:   pop    %r13
   0x00000000000510bb <+347>:   pop    %r14
   0x00000000000510bd <+349>:   pop    %r15
   0x00000000000510bf <+351>:   pop    %rbp
   0x00000000000510c0 <+352>:   retq=20=20=20
   0x00000000000510c1 <+353>:   mov    0x10(%r12),%rdi
   0x00000000000510c6 <+358>:   mov    $0x0,%r8
   0x00000000000510cd <+365>:   mov    $0xb5,%ecx
   0x00000000000510d2 <+370>:   mov    $0x0,%rdx
   0x00000000000510d9 <+377>:   mov    $0x0,%rsi
   0x00000000000510e0 <+384>:   callq  0x510e5 <gf100_vm_flush+389>
   0x00000000000510e5 <+389>:   jmpq   0x51013 <gf100_vm_flush+179>
   0x00000000000510ea <+394>:   mov    0x10(%r12),%rdi
   0x00000000000510ef <+399>:   mov    $0x0,%r8
   0x00000000000510f6 <+406>:   mov    $0xbe,%ecx
   0x00000000000510fb <+411>:   mov    $0x0,%rdx
   0x0000000000051102 <+418>:   mov    $0x0,%rsi
   0x0000000000051109 <+425>:   callq  0x5110e <gf100_vm_flush+430>
   0x000000000005110e <+430>:   jmp    0x5109c <gf100_vm_flush+316>

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14778492750.34CeDde2d.32087
Date: Sun, 30 Oct 2016 17:41:15 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98506#c2">Comment=
 # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Pagefault in gf100_vm_flush"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D98506">bug 98506<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
karolherbst&#64;gmail.com" title=3D"Karol Herbst &lt;karolherbst&#64;gmail.=
com&gt;"> <span class=3D"fn">Karol Herbst</span></a>
</span></b>
        <pre>(gdb) disassemble gf100_vm_flush
Dump of assembler code for function gf100_vm_flush:
   0x0000000000050f60 &lt;+0&gt;:     push   %rbp
   0x0000000000050f61 &lt;+1&gt;:     mov    %rsp,%rbp
   0x0000000000050f64 &lt;+4&gt;:     push   %r15
   0x0000000000050f66 &lt;+6&gt;:     push   %r14
   0x0000000000050f68 &lt;+8&gt;:     push   %r13
   0x0000000000050f6a &lt;+10&gt;:    mov    %rdi,%r13
   0x0000000000050f6d &lt;+13&gt;:    push   %r12
   0x0000000000050f6f &lt;+15&gt;:    push   %rbx
   0x0000000000050f70 &lt;+16&gt;:    sub    $0x18,%rsp
   0x0000000000050f74 &lt;+20&gt;:    mov    0xb0(%rdi),%edx
   0x0000000000050f7a &lt;+26&gt;:    mov    (%rdi),%rax
   0x0000000000050f7d &lt;+29&gt;:    cmp    $0x1,%edx
   0x0000000000050f80 &lt;+32&gt;:    mov    0x10(%rax),%r12
   0x0000000000050f84 &lt;+36&gt;:    sbb    %ebx,%ebx
   0x0000000000050f86 &lt;+38&gt;:    add    $0x20,%rax
   0x0000000000050f8a &lt;+42&gt;:    mov    %rax,%rdi
   0x0000000000050f8d &lt;+45&gt;:    mov    %rax,-0x40(%rbp)
   0x0000000000050f91 &lt;+49&gt;:    and    $0xfffffffc,%ebx
   0x0000000000050f94 &lt;+52&gt;:    callq  0x50f99 &lt;gf100_vm_flush+57&=
gt;
   0x0000000000050f99 &lt;+57&gt;:    mov    0x60(%r13),%r14
   0x0000000000050f9d &lt;+61&gt;:    lea    0x60(%r13),%rax
   0x0000000000050fa1 &lt;+65&gt;:    add    $0x5,%ebx
   0x0000000000050fa4 &lt;+68&gt;:    or     $0x80000000,%ebx
   0x0000000000050faa &lt;+74&gt;:    mov    %rax,-0x30(%rbp)
   0x0000000000050fae &lt;+78&gt;:    mov    %ebx,-0x34(%rbp)
   0x0000000000050fb1 &lt;+81&gt;:    cmp    %rax,%r14
   0x0000000000050fb4 &lt;+84&gt;:    je     0x510a9 &lt;gf100_vm_flush+329=
&gt;
   0x0000000000050fba &lt;+90&gt;:    mov    0x198(%r12),%r13
   0x0000000000050fc2 &lt;+98&gt;:    xor    %ebx,%ebx
   0x0000000000050fc4 &lt;+100&gt;:   mov    %r13,%rdi
   0x0000000000050fc7 &lt;+103&gt;:   callq  0x50fcc &lt;gf100_vm_flush+108=
&gt;
   0x0000000000050fcc &lt;+108&gt;:   mov    %rax,%r15
   0x0000000000050fcf &lt;+111&gt;:   jmp    0x50feb &lt;gf100_vm_flush+139=
&gt;
   0x0000000000050fd1 &lt;+113&gt;:   mov    %r13,%rdi
   0x0000000000050fd4 &lt;+116&gt;:   callq  0x50fd9 &lt;gf100_vm_flush+121=
&gt;
   0x0000000000050fd9 &lt;+121&gt;:   sub    %r15,%rax
   0x0000000000050fdc &lt;+124&gt;:   mov    %rax,%rbx
   0x0000000000050fdf &lt;+127&gt;:   cmp    $0x773593ff,%rax
   0x0000000000050fe5 &lt;+133&gt;:   ja     0x510c1 &lt;gf100_vm_flush+353=
&gt;
   0x0000000000050feb &lt;+139&gt;:   mov    0x80(%r12),%rax
   0x0000000000050ff3 &lt;+147&gt;:   lea    0x100c80(%rax),%rdi
   0x0000000000050ffa &lt;+154&gt;:   callq  0x50fff &lt;gf100_vm_flush+159=
&gt;
   0x0000000000050fff &lt;+159&gt;:   test   $0xff0000,%eax
   0x0000000000051004 &lt;+164&gt;:   je     0x50fd1 &lt;gf100_vm_flush+113=
&gt;
   0x0000000000051006 &lt;+166&gt;:   cmp    $0x773593ff,%rbx
   0x000000000005100d &lt;+173&gt;:   ja     0x510c1 &lt;gf100_vm_flush+353=
&gt;
   0x0000000000051013 &lt;+179&gt;:   mov    0x80(%r12),%rax
   0x000000000005101b &lt;+187&gt;:   xor    %ebx,%ebx
   0x000000000005101d &lt;+189&gt;:   lea    0x100cb8(%rax),%rsi
   0x0000000000051024 &lt;+196&gt;:   mov    0x10(%r14),%rax
   0x0000000000051028 &lt;+200&gt;:   mov    0x90(%rax),%rdi
   0x000000000005102f &lt;+207&gt;:   shr    $0x8,%rdi
   0x0000000000051033 &lt;+211&gt;:   callq  0x51038 &lt;gf100_vm_flush+216=
&gt;
   0x0000000000051038 &lt;+216&gt;:   mov    0x80(%r12),%rax
   0x0000000000051040 &lt;+224&gt;:   mov    -0x34(%rbp),%edi
   0x0000000000051043 &lt;+227&gt;:   lea    0x100cbc(%rax),%rsi
   0x000000000005104a &lt;+234&gt;:   callq  0x5104f &lt;gf100_vm_flush+239=
&gt;
   0x000000000005104f &lt;+239&gt;:   mov    0x198(%r12),%r13
   0x0000000000051057 &lt;+247&gt;:   mov    %r13,%rdi
   0x000000000005105a &lt;+250&gt;:   callq  0x5105f &lt;gf100_vm_flush+255=
&gt;
   0x000000000005105f &lt;+255&gt;:   mov    %rax,%r15
   0x0000000000051062 &lt;+258&gt;:   jmp    0x5107a &lt;gf100_vm_flush+282=
&gt;
   0x0000000000051064 &lt;+260&gt;:   mov    %r13,%rdi
   0x0000000000051067 &lt;+263&gt;:   callq  0x5106c &lt;gf100_vm_flush+268=
&gt;
   0x000000000005106c &lt;+268&gt;:   sub    %r15,%rax
   0x000000000005106f &lt;+271&gt;:   mov    %rax,%rbx
   0x0000000000051072 &lt;+274&gt;:   cmp    $0x773593ff,%rax
   0x0000000000051078 &lt;+280&gt;:   ja     0x510ea &lt;gf100_vm_flush+394=
&gt;
   0x000000000005107a &lt;+282&gt;:   mov    0x80(%r12),%rax
   0x0000000000051082 &lt;+290&gt;:   lea    0x100c80(%rax),%rdi
   0x0000000000051089 &lt;+297&gt;:   callq  0x5108e &lt;gf100_vm_flush+302=
&gt;
   0x000000000005108e &lt;+302&gt;:   test   $0x80,%ah
   0x0000000000051091 &lt;+305&gt;:   je     0x51064 &lt;gf100_vm_flush+260=
&gt;
   0x0000000000051093 &lt;+307&gt;:   cmp    $0x773593ff,%rbx
   0x000000000005109a &lt;+314&gt;:   ja     0x510ea &lt;gf100_vm_flush+394=
&gt;
   0x000000000005109c &lt;+316&gt;:   mov    (%r14),%r14
   0x000000000005109f &lt;+319&gt;:   cmp    -0x30(%rbp),%r14
   0x00000000000510a3 &lt;+323&gt;:   jne    0x50fba &lt;gf100_vm_flush+90&=
gt;
   0x00000000000510a9 &lt;+329&gt;:   mov    -0x40(%rbp),%rdi
   0x00000000000510ad &lt;+333&gt;:   callq  0x510b2 &lt;gf100_vm_flush+338=
&gt;
   0x00000000000510b2 &lt;+338&gt;:   add    $0x18,%rsp
   0x00000000000510b6 &lt;+342&gt;:   pop    %rbx
   0x00000000000510b7 &lt;+343&gt;:   pop    %r12
   0x00000000000510b9 &lt;+345&gt;:   pop    %r13
   0x00000000000510bb &lt;+347&gt;:   pop    %r14
   0x00000000000510bd &lt;+349&gt;:   pop    %r15
   0x00000000000510bf &lt;+351&gt;:   pop    %rbp
   0x00000000000510c0 &lt;+352&gt;:   retq=20=20=20
   0x00000000000510c1 &lt;+353&gt;:   mov    0x10(%r12),%rdi
   0x00000000000510c6 &lt;+358&gt;:   mov    $0x0,%r8
   0x00000000000510cd &lt;+365&gt;:   mov    $0xb5,%ecx
   0x00000000000510d2 &lt;+370&gt;:   mov    $0x0,%rdx
   0x00000000000510d9 &lt;+377&gt;:   mov    $0x0,%rsi
   0x00000000000510e0 &lt;+384&gt;:   callq  0x510e5 &lt;gf100_vm_flush+389=
&gt;
   0x00000000000510e5 &lt;+389&gt;:   jmpq   0x51013 &lt;gf100_vm_flush+179=
&gt;
   0x00000000000510ea &lt;+394&gt;:   mov    0x10(%r12),%rdi
   0x00000000000510ef &lt;+399&gt;:   mov    $0x0,%r8
   0x00000000000510f6 &lt;+406&gt;:   mov    $0xbe,%ecx
   0x00000000000510fb &lt;+411&gt;:   mov    $0x0,%rdx
   0x0000000000051102 &lt;+418&gt;:   mov    $0x0,%rsi
   0x0000000000051109 &lt;+425&gt;:   callq  0x5110e &lt;gf100_vm_flush+430=
&gt;
   0x000000000005110e &lt;+430&gt;:   jmp    0x5109c &lt;gf100_vm_flush+316=
&gt;</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14778492750.34CeDde2d.32087--

--===============1187122307==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1187122307==--
