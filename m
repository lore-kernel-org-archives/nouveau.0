From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93557] Kernel Panic on Linux Kernel 4.4 when loading
 KDE/KDM on Nvidia GeForce 7025 / nForce 630a
Date: Sat, 02 Jan 2016 00:20:43 +0000
Message-ID: <bug-93557-8800-7kRfs1A0HS@http.bugs.freedesktop.org/>
References: <bug-93557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1950400033=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93557-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1950400033==
Content-Type: multipart/alternative; boundary="1451694042.575a8DBC1.26450"; charset="UTF-8"


--1451694042.575a8DBC1.26450
Date: Sat, 2 Jan 2016 00:20:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=93557

--- Comment #1 from xgfwtvdh-GK+4nHxFadIswetKESUqMA@public.gmane.org ---
Reading symbols from
/lib/modules/4.4.0-rc6-amd64/kernel/drivers/gpu/drm/nouveau/nouveau.ko...(no
debugging symbols found)...done.
(gdb) disassemble nv40_gr_intr
Dump of assembler code for function nv40_gr_intr:
   0x00000000000712c0 <+0>:    callq  0x712c5 <nv40_gr_intr+5>
   0x00000000000712c5 <+5>:    push   %r15
   0x00000000000712c7 <+7>:    push   %r14
   0x00000000000712c9 <+9>:    push   %r13
   0x00000000000712cb <+11>:    push   %r12
   0x00000000000712cd <+13>:    push   %rbp
   0x00000000000712ce <+14>:    push   %rbx
   0x00000000000712cf <+15>:    mov    %rdi,%rbx
   0x00000000000712d2 <+18>:    lea    0x58(%rbx),%r13
   0x00000000000712d6 <+22>:    sub    $0x208,%rsp
   0x00000000000712dd <+29>:    mov    0x18(%rdi),%r14
   0x00000000000712e1 <+33>:    mov    %gs:0x28,%rax
   0x00000000000712ea <+42>:    mov    %rax,0x200(%rsp)
   0x00000000000712f2 <+50>:    xor    %eax,%eax
   0x00000000000712f4 <+52>:    mov    0x80(%r14),%rax
   0x00000000000712fb <+59>:    lea    0x400100(%rax),%rdi
   0x0000000000071302 <+66>:    callq  0x71307 <nv40_gr_intr+71>
   0x0000000000071307 <+71>:    mov    %eax,%r12d
   0x000000000007130a <+74>:    mov    0x80(%r14),%rax
   0x0000000000071311 <+81>:    lea    0x400108(%rax),%rdi
   0x0000000000071318 <+88>:    callq  0x7131d <nv40_gr_intr+93>
   0x000000000007131d <+93>:    mov    %eax,0x58(%rsp)
   0x0000000000071321 <+97>:    mov    0x80(%r14),%rax
   0x0000000000071328 <+104>:    lea    0x400104(%rax),%rdi
   0x000000000007132f <+111>:    callq  0x71334 <nv40_gr_intr+116>
   0x0000000000071334 <+116>:    mov    %eax,0x5c(%rsp)
   0x0000000000071338 <+120>:    mov    0x80(%r14),%rax
   0x000000000007133f <+127>:    lea    0x40032c(%rax),%rdi
   0x0000000000071346 <+134>:    callq  0x7134b <nv40_gr_intr+139>
   0x000000000007134b <+139>:    and    $0xfffff,%eax
   0x0000000000071350 <+144>:    mov    %eax,%r15d
   0x0000000000071353 <+147>:    mov    0x80(%r14),%rax
   0x000000000007135a <+154>:    lea    0x400704(%rax),%rdi
   0x0000000000071361 <+161>:    callq  0x71366 <nv40_gr_intr+166>
   0x0000000000071366 <+166>:    mov    %eax,0x60(%rsp)
   0x000000000007136a <+170>:    mov    %eax,%ebp
   0x000000000007136c <+172>:    mov    0x80(%r14),%rax
   0x0000000000071373 <+179>:    and    $0x70000,%ebp
   0x0000000000071379 <+185>:    shr    $0x10,%ebp
   0x000000000007137c <+188>:    lea    0x400708(%rax),%rdi
   0x0000000000071383 <+195>:    mov    %ebp,0x64(%rsp)
   0x0000000000071387 <+199>:    callq  0x7138c <nv40_gr_intr+204>
   0x000000000007138c <+204>:    lea    0x400160(,%rbp,4),%edi
   0x0000000000071393 <+211>:    add    0x80(%r14),%rdi
   0x000000000007139a <+218>:    mov    %eax,0x68(%rsp)
   0x000000000007139e <+222>:    callq  0x713a3 <nv40_gr_intr+227>
   0x00000000000713a3 <+227>:    mov    %r13,%rdi
   0x00000000000713a6 <+230>:    mov    %eax,0x6c(%rsp)
   0x00000000000713aa <+234>:    callq  0x713af <nv40_gr_intr+239>
   0x00000000000713af <+239>:    mov    %rax,0x50(%rsp)
   0x00000000000713b4 <+244>:    mov    0x68(%rbx),%rax
   0x00000000000713b8 <+248>:    lea    0x68(%rbx),%rsi
   0x00000000000713bc <+252>:    cmp    %rsi,%rax
---Type <return> to continue, or q <return> to quit---
   0x00000000000713bf <+255>:    je     0x713fd <nv40_gr_intr+317>
   0x00000000000713c1 <+257>:    mov    -0x8(%rax),%edx
   0x00000000000713c4 <+260>:    lea    -0x88(%rax),%rbp
   0x00000000000713cb <+267>:    shr    $0x4,%edx
   0x00000000000713ce <+270>:    cmp    %edx,%r15d
   0x00000000000713d1 <+273>:    jne    0x713e7 <nv40_gr_intr+295>
   0x00000000000713d3 <+275>:    jmpq   0x715c2 <nv40_gr_intr+770>
   0x00000000000713d8 <+280>:    mov    -0x8(%rdx),%edx
   0x00000000000713db <+283>:    shr    $0x4,%edx
   0x00000000000713de <+286>:    cmp    %edx,%r15d
   0x00000000000713e1 <+289>:    je     0x715c2 <nv40_gr_intr+770>
   0x00000000000713e7 <+295>:    mov    0x88(%rbp),%rdx
   0x00000000000713ee <+302>:    cmp    %rsi,%rdx
   0x00000000000713f1 <+305>:    lea    -0x88(%rdx),%rbp
   0x00000000000713f8 <+312>:    mov    %rdx,%rax
   0x00000000000713fb <+315>:    jne    0x713d8 <nv40_gr_intr+280>
   0x00000000000713fd <+317>:    xor    %ebp,%ebp
   0x00000000000713ff <+319>:    test   $0x100000,%r12d
   0x0000000000071406 <+326>:    je     0x7158a <nv40_gr_intr+714>
   0x000000000007140c <+332>:    testl  $0x10000,0x58(%rsp)
   0x0000000000071414 <+340>:    jne    0x715ef <nv40_gr_intr+815>
   0x000000000007141a <+346>:    mov    0x80(%r14),%rax
   0x0000000000071421 <+353>:    mov    %r12d,%edi
   0x0000000000071424 <+356>:    lea    0x400100(%rax),%rsi
   0x000000000007142b <+363>:    callq  0x71430 <nv40_gr_intr+368>
   0x0000000000071430 <+368>:    mov    0x80(%r14),%rsi
   0x0000000000071437 <+375>:    mov    $0x1,%edi
   0x000000000007143c <+380>:    add    $0x400720,%rsi
   0x0000000000071443 <+387>:    callq  0x71448 <nv40_gr_intr+392>
   0x0000000000071448 <+392>:    lea    0x80(%rsp),%rdi
   0x0000000000071450 <+400>:    mov    %r12d,%ecx
   0x0000000000071453 <+403>:    mov    $0x0,%rdx
   0x000000000007145a <+410>:    mov    $0x80,%esi
   0x000000000007145f <+415>:    callq  0x71464 <nv40_gr_intr+420>
   0x0000000000071464 <+420>:    mov    0x58(%rsp),%ecx
   0x0000000000071468 <+424>:    lea    0x100(%rsp),%rdi
   0x0000000000071470 <+432>:    mov    $0x0,%rdx
   0x0000000000071477 <+439>:    mov    $0x80,%esi
   0x000000000007147c <+444>:    callq  0x71481 <nv40_gr_intr+449>
   0x0000000000071481 <+449>:    mov    0x5c(%rsp),%ecx
   0x0000000000071485 <+453>:    lea    0x180(%rsp),%rdi
   0x000000000007148d <+461>:    mov    $0x0,%rdx
   0x0000000000071494 <+468>:    mov    $0x80,%esi
   0x0000000000071499 <+473>:    callq  0x7149e <nv40_gr_intr+478>
   0x000000000007149e <+478>:    mov    0x50(%rbx),%eax
   0x00000000000714a1 <+481>:    test   %eax,%eax
   0x00000000000714a3 <+483>:    je     0x71554 <nv40_gr_intr+660>
   0x00000000000714a9 <+489>:    test   %rbp,%rbp
   0x00000000000714ac <+492>:    je     0x7161c <nv40_gr_intr+860>
   0x00000000000714b2 <+498>:    mov    0x78(%rbp),%rdx
   0x00000000000714b6 <+502>:    mov    %r15d,%r9d
   0x00000000000714b9 <+505>:    shl    $0x4,%r9d
   0x00000000000714bd <+509>:    mov    0x20(%rdx),%rax
   0x00000000000714c1 <+513>:    movzwl 0x98(%rdx),%esi
---Type <return> to continue, or q <return> to quit---
   0x00000000000714c8 <+520>:    lea    0x70(%rax),%rcx
   0x00000000000714cc <+524>:    mov    0x20(%rbx),%eax
   0x00000000000714cf <+527>:    mov    0x60(%rsp),%r14d
   0x00000000000714d4 <+532>:    lea    0x80(%rsp),%r8
   0x00000000000714dc <+540>:    and    $0x1ffc,%r14d
   0x00000000000714e3 <+547>:    mov    0x0(,%rax,8),%rdx
   0x00000000000714eb <+555>:    mov    0x18(%rbx),%rax
   0x00000000000714ef <+559>:    mov    0x10(%rax),%rdi
   0x00000000000714f3 <+563>:    mov    0x68(%rsp),%eax
   0x00000000000714f7 <+567>:    mov    %r9d,0x20(%rsp)
   0x00000000000714fc <+572>:    mov    0x58(%rsp),%r9d
   0x0000000000071501 <+577>:    mov    %rcx,0x28(%rsp)
   0x0000000000071506 <+582>:    mov    %esi,0x18(%rsp)
   0x000000000007150a <+586>:    mov    %r12d,%ecx
   0x000000000007150d <+589>:    mov    %eax,0x48(%rsp)
   0x0000000000071511 <+593>:    movzwl 0x6c(%rsp),%eax
   0x0000000000071516 <+598>:    mov    $0x0,%rsi
   0x000000000007151d <+605>:    mov    %r14d,0x40(%rsp)
   0x0000000000071522 <+610>:    mov    %eax,0x38(%rsp)
   0x0000000000071526 <+614>:    mov    0x64(%rsp),%eax
   0x000000000007152a <+618>:    mov    %eax,0x30(%rsp)
   0x000000000007152e <+622>:    lea    0x180(%rsp),%rax
   0x0000000000071536 <+630>:    mov    %rax,0x10(%rsp)
   0x000000000007153b <+635>:    mov    0x5c(%rsp),%eax
   0x000000000007153f <+639>:    mov    %eax,0x8(%rsp)
   0x0000000000071543 <+643>:    lea    0x100(%rsp),%rax
   0x000000000007154b <+651>:    mov    %rax,(%rsp)
   0x000000000007154f <+655>:    callq  0x71554 <nv40_gr_intr+660>
   0x0000000000071554 <+660>:    mov    0x50(%rsp),%rsi
   0x0000000000071559 <+665>:    mov    %r13,%rdi
   0x000000000007155c <+668>:    callq  0x71561 <nv40_gr_intr+673>
   0x0000000000071561 <+673>:    mov    0x200(%rsp),%rax
   0x0000000000071569 <+681>:    xor    %gs:0x28,%rax
   0x0000000000071572 <+690>:    jne    0x71634 <nv40_gr_intr+884>
   0x0000000000071578 <+696>:    add    $0x208,%rsp
   0x000000000007157f <+703>:    pop    %rbx
   0x0000000000071580 <+704>:    pop    %rbp
   0x0000000000071581 <+705>:    pop    %r12
   0x0000000000071583 <+707>:    pop    %r13
   0x0000000000071585 <+709>:    pop    %r14
   0x0000000000071587 <+711>:    pop    %r15
   0x0000000000071589 <+713>:    retq   
   0x000000000007158a <+714>:    mov    0x80(%r14),%rax
   0x0000000000071591 <+721>:    mov    %r12d,%edi
   0x0000000000071594 <+724>:    lea    0x400100(%rax),%rsi
   0x000000000007159b <+731>:    callq  0x715a0 <nv40_gr_intr+736>
   0x00000000000715a0 <+736>:    mov    0x80(%r14),%rsi
   0x00000000000715a7 <+743>:    mov    $0x1,%edi
   0x00000000000715ac <+748>:    add    $0x400720,%rsi
   0x00000000000715b3 <+755>:    callq  0x715b8 <nv40_gr_intr+760>
   0x00000000000715b8 <+760>:    test   %r12d,%r12d
   0x00000000000715bb <+763>:    je     0x71554 <nv40_gr_intr+660>
   0x00000000000715bd <+765>:    jmpq   0x71448 <nv40_gr_intr+392>
   0x00000000000715c2 <+770>:    mov    %rax,%rdi
---Type <return> to continue, or q <return> to quit---
   0x00000000000715c5 <+773>:    mov    %rsi,0x78(%rsp)
   0x00000000000715ca <+778>:    mov    %rax,0x70(%rsp)
   0x00000000000715cf <+783>:    callq  0x715d4 <nv40_gr_intr+788>
   0x00000000000715d4 <+788>:    mov    0x70(%rsp),%rax
   0x00000000000715d9 <+793>:    mov    0x68(%rbx),%rdx
   0x00000000000715dd <+797>:    mov    0x78(%rsp),%rsi
   0x00000000000715e2 <+802>:    mov    %rax,%rdi
   0x00000000000715e5 <+805>:    callq  0x715ea <nv40_gr_intr+810>
   0x00000000000715ea <+810>:    jmpq   0x713ff <nv40_gr_intr+319>
   0x00000000000715ef <+815>:    mov    0x80(%r14),%rax
   0x00000000000715f6 <+822>:    lea    0x402000(%rax),%rdi
   0x00000000000715fd <+829>:    callq  0x71602 <nv40_gr_intr+834>
   0x0000000000071602 <+834>:    mov    0x80(%r14),%rcx
   0x0000000000071609 <+841>:    mov    %eax,%edi
   0x000000000007160b <+843>:    lea    0x402000(%rcx),%rsi
   0x0000000000071612 <+850>:    callq  0x71617 <nv40_gr_intr+855>
   0x0000000000071617 <+855>:    jmpq   0x7141a <nv40_gr_intr+346>
   0x000000000007161c <+860>:    mov    %r15d,%r9d
   0x000000000007161f <+863>:    mov    $0x0,%rcx
   0x0000000000071626 <+870>:    mov    $0xffffffff,%esi
   0x000000000007162b <+875>:    shl    $0x4,%r9d
   0x000000000007162f <+879>:    jmpq   0x714cc <nv40_gr_intr+524>
   0x0000000000071634 <+884>:    callq  0x71639
End of assembler dump.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1451694042.575a8DBC1.26450
Date: Sat, 2 Jan 2016 00:20:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93557#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Kernel Panic on Linux Kernel 4.4 when loading KDE/KDM on Nvidia GeForce 7025 / nForce 630a"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93557">bug 93557</a>
              from <span class="vcard"><a class="email" href="mailto:xgfwtvdh&#64;sharklasers.com" title="xgfwtvdh&#64;sharklasers.com">xgfwtvdh&#64;sharklasers.com</a>
</span></b>
        <pre>Reading symbols from
/lib/modules/4.4.0-rc6-amd64/kernel/drivers/gpu/drm/nouveau/nouveau.ko...(no
debugging symbols found)...done.
(gdb) disassemble nv40_gr_intr
Dump of assembler code for function nv40_gr_intr:
   0x00000000000712c0 &lt;+0&gt;:    callq  0x712c5 &lt;nv40_gr_intr+5&gt;
   0x00000000000712c5 &lt;+5&gt;:    push   %r15
   0x00000000000712c7 &lt;+7&gt;:    push   %r14
   0x00000000000712c9 &lt;+9&gt;:    push   %r13
   0x00000000000712cb &lt;+11&gt;:    push   %r12
   0x00000000000712cd &lt;+13&gt;:    push   %rbp
   0x00000000000712ce &lt;+14&gt;:    push   %rbx
   0x00000000000712cf &lt;+15&gt;:    mov    %rdi,%rbx
   0x00000000000712d2 &lt;+18&gt;:    lea    0x58(%rbx),%r13
   0x00000000000712d6 &lt;+22&gt;:    sub    $0x208,%rsp
   0x00000000000712dd &lt;+29&gt;:    mov    0x18(%rdi),%r14
   0x00000000000712e1 &lt;+33&gt;:    mov    %gs:0x28,%rax
   0x00000000000712ea &lt;+42&gt;:    mov    %rax,0x200(%rsp)
   0x00000000000712f2 &lt;+50&gt;:    xor    %eax,%eax
   0x00000000000712f4 &lt;+52&gt;:    mov    0x80(%r14),%rax
   0x00000000000712fb &lt;+59&gt;:    lea    0x400100(%rax),%rdi
   0x0000000000071302 &lt;+66&gt;:    callq  0x71307 &lt;nv40_gr_intr+71&gt;
   0x0000000000071307 &lt;+71&gt;:    mov    %eax,%r12d
   0x000000000007130a &lt;+74&gt;:    mov    0x80(%r14),%rax
   0x0000000000071311 &lt;+81&gt;:    lea    0x400108(%rax),%rdi
   0x0000000000071318 &lt;+88&gt;:    callq  0x7131d &lt;nv40_gr_intr+93&gt;
   0x000000000007131d &lt;+93&gt;:    mov    %eax,0x58(%rsp)
   0x0000000000071321 &lt;+97&gt;:    mov    0x80(%r14),%rax
   0x0000000000071328 &lt;+104&gt;:    lea    0x400104(%rax),%rdi
   0x000000000007132f &lt;+111&gt;:    callq  0x71334 &lt;nv40_gr_intr+116&gt;
   0x0000000000071334 &lt;+116&gt;:    mov    %eax,0x5c(%rsp)
   0x0000000000071338 &lt;+120&gt;:    mov    0x80(%r14),%rax
   0x000000000007133f &lt;+127&gt;:    lea    0x40032c(%rax),%rdi
   0x0000000000071346 &lt;+134&gt;:    callq  0x7134b &lt;nv40_gr_intr+139&gt;
   0x000000000007134b &lt;+139&gt;:    and    $0xfffff,%eax
   0x0000000000071350 &lt;+144&gt;:    mov    %eax,%r15d
   0x0000000000071353 &lt;+147&gt;:    mov    0x80(%r14),%rax
   0x000000000007135a &lt;+154&gt;:    lea    0x400704(%rax),%rdi
   0x0000000000071361 &lt;+161&gt;:    callq  0x71366 &lt;nv40_gr_intr+166&gt;
   0x0000000000071366 &lt;+166&gt;:    mov    %eax,0x60(%rsp)
   0x000000000007136a &lt;+170&gt;:    mov    %eax,%ebp
   0x000000000007136c &lt;+172&gt;:    mov    0x80(%r14),%rax
   0x0000000000071373 &lt;+179&gt;:    and    $0x70000,%ebp
   0x0000000000071379 &lt;+185&gt;:    shr    $0x10,%ebp
   0x000000000007137c &lt;+188&gt;:    lea    0x400708(%rax),%rdi
   0x0000000000071383 &lt;+195&gt;:    mov    %ebp,0x64(%rsp)
   0x0000000000071387 &lt;+199&gt;:    callq  0x7138c &lt;nv40_gr_intr+204&gt;
   0x000000000007138c &lt;+204&gt;:    lea    0x400160(,%rbp,4),%edi
   0x0000000000071393 &lt;+211&gt;:    add    0x80(%r14),%rdi
   0x000000000007139a &lt;+218&gt;:    mov    %eax,0x68(%rsp)
   0x000000000007139e &lt;+222&gt;:    callq  0x713a3 &lt;nv40_gr_intr+227&gt;
   0x00000000000713a3 &lt;+227&gt;:    mov    %r13,%rdi
   0x00000000000713a6 &lt;+230&gt;:    mov    %eax,0x6c(%rsp)
   0x00000000000713aa &lt;+234&gt;:    callq  0x713af &lt;nv40_gr_intr+239&gt;
   0x00000000000713af &lt;+239&gt;:    mov    %rax,0x50(%rsp)
   0x00000000000713b4 &lt;+244&gt;:    mov    0x68(%rbx),%rax
   0x00000000000713b8 &lt;+248&gt;:    lea    0x68(%rbx),%rsi
   0x00000000000713bc &lt;+252&gt;:    cmp    %rsi,%rax
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
   0x00000000000713bf &lt;+255&gt;:    je     0x713fd &lt;nv40_gr_intr+317&gt;
   0x00000000000713c1 &lt;+257&gt;:    mov    -0x8(%rax),%edx
   0x00000000000713c4 &lt;+260&gt;:    lea    -0x88(%rax),%rbp
   0x00000000000713cb &lt;+267&gt;:    shr    $0x4,%edx
   0x00000000000713ce &lt;+270&gt;:    cmp    %edx,%r15d
   0x00000000000713d1 &lt;+273&gt;:    jne    0x713e7 &lt;nv40_gr_intr+295&gt;
   0x00000000000713d3 &lt;+275&gt;:    jmpq   0x715c2 &lt;nv40_gr_intr+770&gt;
   0x00000000000713d8 &lt;+280&gt;:    mov    -0x8(%rdx),%edx
   0x00000000000713db &lt;+283&gt;:    shr    $0x4,%edx
   0x00000000000713de &lt;+286&gt;:    cmp    %edx,%r15d
   0x00000000000713e1 &lt;+289&gt;:    je     0x715c2 &lt;nv40_gr_intr+770&gt;
   0x00000000000713e7 &lt;+295&gt;:    mov    0x88(%rbp),%rdx
   0x00000000000713ee &lt;+302&gt;:    cmp    %rsi,%rdx
   0x00000000000713f1 &lt;+305&gt;:    lea    -0x88(%rdx),%rbp
   0x00000000000713f8 &lt;+312&gt;:    mov    %rdx,%rax
   0x00000000000713fb &lt;+315&gt;:    jne    0x713d8 &lt;nv40_gr_intr+280&gt;
   0x00000000000713fd &lt;+317&gt;:    xor    %ebp,%ebp
   0x00000000000713ff &lt;+319&gt;:    test   $0x100000,%r12d
   0x0000000000071406 &lt;+326&gt;:    je     0x7158a &lt;nv40_gr_intr+714&gt;
   0x000000000007140c &lt;+332&gt;:    testl  $0x10000,0x58(%rsp)
   0x0000000000071414 &lt;+340&gt;:    jne    0x715ef &lt;nv40_gr_intr+815&gt;
   0x000000000007141a &lt;+346&gt;:    mov    0x80(%r14),%rax
   0x0000000000071421 &lt;+353&gt;:    mov    %r12d,%edi
   0x0000000000071424 &lt;+356&gt;:    lea    0x400100(%rax),%rsi
   0x000000000007142b &lt;+363&gt;:    callq  0x71430 &lt;nv40_gr_intr+368&gt;
   0x0000000000071430 &lt;+368&gt;:    mov    0x80(%r14),%rsi
   0x0000000000071437 &lt;+375&gt;:    mov    $0x1,%edi
   0x000000000007143c &lt;+380&gt;:    add    $0x400720,%rsi
   0x0000000000071443 &lt;+387&gt;:    callq  0x71448 &lt;nv40_gr_intr+392&gt;
   0x0000000000071448 &lt;+392&gt;:    lea    0x80(%rsp),%rdi
   0x0000000000071450 &lt;+400&gt;:    mov    %r12d,%ecx
   0x0000000000071453 &lt;+403&gt;:    mov    $0x0,%rdx
   0x000000000007145a &lt;+410&gt;:    mov    $0x80,%esi
   0x000000000007145f &lt;+415&gt;:    callq  0x71464 &lt;nv40_gr_intr+420&gt;
   0x0000000000071464 &lt;+420&gt;:    mov    0x58(%rsp),%ecx
   0x0000000000071468 &lt;+424&gt;:    lea    0x100(%rsp),%rdi
   0x0000000000071470 &lt;+432&gt;:    mov    $0x0,%rdx
   0x0000000000071477 &lt;+439&gt;:    mov    $0x80,%esi
   0x000000000007147c &lt;+444&gt;:    callq  0x71481 &lt;nv40_gr_intr+449&gt;
   0x0000000000071481 &lt;+449&gt;:    mov    0x5c(%rsp),%ecx
   0x0000000000071485 &lt;+453&gt;:    lea    0x180(%rsp),%rdi
   0x000000000007148d &lt;+461&gt;:    mov    $0x0,%rdx
   0x0000000000071494 &lt;+468&gt;:    mov    $0x80,%esi
   0x0000000000071499 &lt;+473&gt;:    callq  0x7149e &lt;nv40_gr_intr+478&gt;
   0x000000000007149e &lt;+478&gt;:    mov    0x50(%rbx),%eax
   0x00000000000714a1 &lt;+481&gt;:    test   %eax,%eax
   0x00000000000714a3 &lt;+483&gt;:    je     0x71554 &lt;nv40_gr_intr+660&gt;
   0x00000000000714a9 &lt;+489&gt;:    test   %rbp,%rbp
   0x00000000000714ac &lt;+492&gt;:    je     0x7161c &lt;nv40_gr_intr+860&gt;
   0x00000000000714b2 &lt;+498&gt;:    mov    0x78(%rbp),%rdx
   0x00000000000714b6 &lt;+502&gt;:    mov    %r15d,%r9d
   0x00000000000714b9 &lt;+505&gt;:    shl    $0x4,%r9d
   0x00000000000714bd &lt;+509&gt;:    mov    0x20(%rdx),%rax
   0x00000000000714c1 &lt;+513&gt;:    movzwl 0x98(%rdx),%esi
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
   0x00000000000714c8 &lt;+520&gt;:    lea    0x70(%rax),%rcx
   0x00000000000714cc &lt;+524&gt;:    mov    0x20(%rbx),%eax
   0x00000000000714cf &lt;+527&gt;:    mov    0x60(%rsp),%r14d
   0x00000000000714d4 &lt;+532&gt;:    lea    0x80(%rsp),%r8
   0x00000000000714dc &lt;+540&gt;:    and    $0x1ffc,%r14d
   0x00000000000714e3 &lt;+547&gt;:    mov    0x0(,%rax,8),%rdx
   0x00000000000714eb &lt;+555&gt;:    mov    0x18(%rbx),%rax
   0x00000000000714ef &lt;+559&gt;:    mov    0x10(%rax),%rdi
   0x00000000000714f3 &lt;+563&gt;:    mov    0x68(%rsp),%eax
   0x00000000000714f7 &lt;+567&gt;:    mov    %r9d,0x20(%rsp)
   0x00000000000714fc &lt;+572&gt;:    mov    0x58(%rsp),%r9d
   0x0000000000071501 &lt;+577&gt;:    mov    %rcx,0x28(%rsp)
   0x0000000000071506 &lt;+582&gt;:    mov    %esi,0x18(%rsp)
   0x000000000007150a &lt;+586&gt;:    mov    %r12d,%ecx
   0x000000000007150d &lt;+589&gt;:    mov    %eax,0x48(%rsp)
   0x0000000000071511 &lt;+593&gt;:    movzwl 0x6c(%rsp),%eax
   0x0000000000071516 &lt;+598&gt;:    mov    $0x0,%rsi
   0x000000000007151d &lt;+605&gt;:    mov    %r14d,0x40(%rsp)
   0x0000000000071522 &lt;+610&gt;:    mov    %eax,0x38(%rsp)
   0x0000000000071526 &lt;+614&gt;:    mov    0x64(%rsp),%eax
   0x000000000007152a &lt;+618&gt;:    mov    %eax,0x30(%rsp)
   0x000000000007152e &lt;+622&gt;:    lea    0x180(%rsp),%rax
   0x0000000000071536 &lt;+630&gt;:    mov    %rax,0x10(%rsp)
   0x000000000007153b &lt;+635&gt;:    mov    0x5c(%rsp),%eax
   0x000000000007153f &lt;+639&gt;:    mov    %eax,0x8(%rsp)
   0x0000000000071543 &lt;+643&gt;:    lea    0x100(%rsp),%rax
   0x000000000007154b &lt;+651&gt;:    mov    %rax,(%rsp)
   0x000000000007154f &lt;+655&gt;:    callq  0x71554 &lt;nv40_gr_intr+660&gt;
   0x0000000000071554 &lt;+660&gt;:    mov    0x50(%rsp),%rsi
   0x0000000000071559 &lt;+665&gt;:    mov    %r13,%rdi
   0x000000000007155c &lt;+668&gt;:    callq  0x71561 &lt;nv40_gr_intr+673&gt;
   0x0000000000071561 &lt;+673&gt;:    mov    0x200(%rsp),%rax
   0x0000000000071569 &lt;+681&gt;:    xor    %gs:0x28,%rax
   0x0000000000071572 &lt;+690&gt;:    jne    0x71634 &lt;nv40_gr_intr+884&gt;
   0x0000000000071578 &lt;+696&gt;:    add    $0x208,%rsp
   0x000000000007157f &lt;+703&gt;:    pop    %rbx
   0x0000000000071580 &lt;+704&gt;:    pop    %rbp
   0x0000000000071581 &lt;+705&gt;:    pop    %r12
   0x0000000000071583 &lt;+707&gt;:    pop    %r13
   0x0000000000071585 &lt;+709&gt;:    pop    %r14
   0x0000000000071587 &lt;+711&gt;:    pop    %r15
   0x0000000000071589 &lt;+713&gt;:    retq   
   0x000000000007158a &lt;+714&gt;:    mov    0x80(%r14),%rax
   0x0000000000071591 &lt;+721&gt;:    mov    %r12d,%edi
   0x0000000000071594 &lt;+724&gt;:    lea    0x400100(%rax),%rsi
   0x000000000007159b &lt;+731&gt;:    callq  0x715a0 &lt;nv40_gr_intr+736&gt;
   0x00000000000715a0 &lt;+736&gt;:    mov    0x80(%r14),%rsi
   0x00000000000715a7 &lt;+743&gt;:    mov    $0x1,%edi
   0x00000000000715ac &lt;+748&gt;:    add    $0x400720,%rsi
   0x00000000000715b3 &lt;+755&gt;:    callq  0x715b8 &lt;nv40_gr_intr+760&gt;
   0x00000000000715b8 &lt;+760&gt;:    test   %r12d,%r12d
   0x00000000000715bb &lt;+763&gt;:    je     0x71554 &lt;nv40_gr_intr+660&gt;
   0x00000000000715bd &lt;+765&gt;:    jmpq   0x71448 &lt;nv40_gr_intr+392&gt;
   0x00000000000715c2 &lt;+770&gt;:    mov    %rax,%rdi
---Type &lt;return&gt; to continue, or q &lt;return&gt; to quit---
   0x00000000000715c5 &lt;+773&gt;:    mov    %rsi,0x78(%rsp)
   0x00000000000715ca &lt;+778&gt;:    mov    %rax,0x70(%rsp)
   0x00000000000715cf &lt;+783&gt;:    callq  0x715d4 &lt;nv40_gr_intr+788&gt;
   0x00000000000715d4 &lt;+788&gt;:    mov    0x70(%rsp),%rax
   0x00000000000715d9 &lt;+793&gt;:    mov    0x68(%rbx),%rdx
   0x00000000000715dd &lt;+797&gt;:    mov    0x78(%rsp),%rsi
   0x00000000000715e2 &lt;+802&gt;:    mov    %rax,%rdi
   0x00000000000715e5 &lt;+805&gt;:    callq  0x715ea &lt;nv40_gr_intr+810&gt;
   0x00000000000715ea &lt;+810&gt;:    jmpq   0x713ff &lt;nv40_gr_intr+319&gt;
   0x00000000000715ef &lt;+815&gt;:    mov    0x80(%r14),%rax
   0x00000000000715f6 &lt;+822&gt;:    lea    0x402000(%rax),%rdi
   0x00000000000715fd &lt;+829&gt;:    callq  0x71602 &lt;nv40_gr_intr+834&gt;
   0x0000000000071602 &lt;+834&gt;:    mov    0x80(%r14),%rcx
   0x0000000000071609 &lt;+841&gt;:    mov    %eax,%edi
   0x000000000007160b &lt;+843&gt;:    lea    0x402000(%rcx),%rsi
   0x0000000000071612 &lt;+850&gt;:    callq  0x71617 &lt;nv40_gr_intr+855&gt;
   0x0000000000071617 &lt;+855&gt;:    jmpq   0x7141a &lt;nv40_gr_intr+346&gt;
   0x000000000007161c &lt;+860&gt;:    mov    %r15d,%r9d
   0x000000000007161f &lt;+863&gt;:    mov    $0x0,%rcx
   0x0000000000071626 &lt;+870&gt;:    mov    $0xffffffff,%esi
   0x000000000007162b &lt;+875&gt;:    shl    $0x4,%r9d
   0x000000000007162f &lt;+879&gt;:    jmpq   0x714cc &lt;nv40_gr_intr+524&gt;
   0x0000000000071634 &lt;+884&gt;:    callq  0x71639
End of assembler dump.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1451694042.575a8DBC1.26450--

--===============1950400033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1950400033==--
