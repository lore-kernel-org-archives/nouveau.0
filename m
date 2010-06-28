From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28763] Kernel Oops when displaying a large image
Date: Mon, 28 Jun 2010 02:23:44 -0700 (PDT)
Message-ID: <20100628092344.BC46F13010C@annarchy.freedesktop.org>
References: <bug-28763-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28763-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28763

--- Comment #5 from Gabriel Kerneis <kerneis-klhGwnj84BUD5ynB6aAmlA@public.gmane.org> 2010-06-28 02:23:43 PDT ---
I confirm that I can reproduce this with 2.6.35-rc3 (compiled with the
requested flags).

Dump of assembler code for function ttm_tt_swapout:
   0x00000000000010a6 <+0>:    push   %r15
   0x00000000000010a8 <+2>:    push   %r14
   0x00000000000010aa <+4>:    push   %r13
   0x00000000000010ac <+6>:    mov    %rsi,%r13
   0x00000000000010af <+9>:    push   %r12
   0x00000000000010b1 <+11>:    push   %rbp
   0x00000000000010b2 <+12>:    push   %rbx
   0x00000000000010b3 <+13>:    mov    %rdi,%rbx
   0x00000000000010b6 <+16>:    sub    $0x18,%rsp
   0x00000000000010ba <+20>:    mov    0x5c(%rdi),%eax
   0x00000000000010bd <+23>:    dec    %eax
   0x00000000000010bf <+25>:    cmp    $0x1,%eax
   0x00000000000010c2 <+28>:    jbe    0x10c8 <ttm_tt_swapout+34>
   0x00000000000010c4 <+30>:    ud2a   
   0x00000000000010c6 <+32>:    jmp    0x10c6 <ttm_tt_swapout+32>
   0x00000000000010c8 <+34>:    cmpl   $0x2,0x58(%rdi)
   0x00000000000010cc <+38>:    je     0x10d2 <ttm_tt_swapout+44>
   0x00000000000010ce <+40>:    ud2a   
   0x00000000000010d0 <+42>:    jmp    0x10d0 <ttm_tt_swapout+42>
   0x00000000000010d2 <+44>:    testb  $0x2,0x20(%rdi)
   0x00000000000010d6 <+48>:    je     0x10f0 <ttm_tt_swapout+74>
   0x00000000000010d8 <+50>:    callq  0xa6a <ttm_tt_free_user_pages>
   0x00000000000010dd <+55>:    xor    %ebp,%ebp
   0x00000000000010df <+57>:    orl    $0x10,0x20(%rbx)
   0x00000000000010e3 <+61>:    movq   $0x0,0x50(%rbx)
   0x00000000000010eb <+69>:    jmpq   0x1277 <ttm_tt_swapout+465>
   0x00000000000010f0 <+74>:    test   %rsi,%rsi
   0x00000000000010f3 <+77>:    mov    %rsi,%r12
   0x00000000000010f6 <+80>:    jne    0x112f <ttm_tt_swapout+137>
   0x00000000000010f8 <+82>:    mov    0x28(%rdi),%rsi
   0x00000000000010fc <+86>:    xor    %edx,%edx
   0x00000000000010fe <+88>:    mov    $0x0,%rdi
   0x0000000000001105 <+95>:    shl    $0xc,%rsi
   0x0000000000001109 <+99>:    callq  0x110e <ttm_tt_swapout+104>
   0x000000000000110e <+104>:    cmp    $0xfffffffffffff000,%rax
   0x0000000000001114 <+110>:    mov    %rax,%r12
   0x0000000000001117 <+113>:    jbe    0x112f <ttm_tt_swapout+137>
   0x0000000000001119 <+115>:    mov    $0x0,%rdi
   0x0000000000001120 <+122>:    xor    %eax,%eax
   0x0000000000001122 <+124>:    mov    %r12d,%ebp
   0x0000000000001125 <+127>:    callq  0x112a <ttm_tt_swapout+132>
   0x000000000000112a <+132>:    jmpq   0x1277 <ttm_tt_swapout+465>
   0x000000000000112f <+137>:    mov    0x18(%r12),%rax
   0x0000000000001134 <+142>:    mov    %gs:0x0,%rbp
   0x000000000000113d <+151>:    sub    $0x1fd8,%rbp
   0x0000000000001144 <+158>:    mov    0x10(%rax),%rax
   0x0000000000001148 <+162>:    mov    0x110(%rax),%r14
   0x000000000000114f <+169>:    movl   $0x0,0xc(%rsp)
   0x0000000000001157 <+177>:    jmpq   0x123a <ttm_tt_swapout+404>
   0x000000000000115c <+182>:    mov    0x8(%rbx),%rax
   0x0000000000001160 <+186>:    mov    (%rax,%rsi,8),%r15
   0x0000000000001164 <+190>:    test   %r15,%r15
   0x0000000000001167 <+193>:    je     0x1236 <ttm_tt_swapout+400>
   0x000000000000116d <+199>:    mov    0x58(%r14),%rax
   0x0000000000001171 <+203>:    xor    %ecx,%ecx
   0x0000000000001173 <+205>:    mov    %r14,%rdi
   0x0000000000001176 <+208>:    mov    0x8(%rax),%rdx
   0x000000000000117a <+212>:    callq  0x117f <ttm_tt_swapout+217>
   0x000000000000117f <+217>:    cmp    $0xfffffffffffff000,%rax
   0x0000000000001185 <+223>:    mov    %rax,%rdx
   0x0000000000001188 <+226>:    jbe    0x119a <ttm_tt_swapout+244>
   0x000000000000118a <+228>:    test   %r13,%r13
   0x000000000000118d <+231>:    mov    %eax,%ebp
   0x000000000000118f <+233>:    jne    0x1277 <ttm_tt_swapout+465>
   0x0000000000001195 <+239>:    jmpq   0x126f <ttm_tt_swapout+457>
   0x000000000000119a <+244>:    incl   0x1c(%rbp)
   0x000000000000119d <+247>:    incl   0x1c(%rbp)
   0x00000000000011a0 <+250>:    movabs $0x160000000000,%rcx
   0x00000000000011aa <+260>:    lea    (%rax,%rcx,1),%rax
   0x00000000000011ae <+264>:    movabs $0x6db6db6db6db6db7,%rcx
   0x00000000000011b8 <+274>:    sar    $0x3,%rax
   0x00000000000011bc <+278>:    imul   %rcx,%rax
   0x00000000000011c0 <+282>:    movabs $0xffff880000000000,%rcx
   0x00000000000011ca <+292>:    shl    $0xc,%rax
   0x00000000000011ce <+296>:    add    %rcx,%rax
   0x00000000000011d1 <+299>:    movabs $0x160000000000,%rcx
   0x00000000000011db <+309>:    lea    (%r15,%rcx,1),%rsi
   0x00000000000011df <+313>:    movabs $0x6db6db6db6db6db7,%rcx
   0x00000000000011e9 <+323>:    mov    %rax,%rdi
   0x00000000000011ec <+326>:    sar    $0x3,%rsi
   0x00000000000011f0 <+330>:    imul   %rcx,%rsi
   0x00000000000011f4 <+334>:    movabs $0xffff880000000000,%rcx
   0x00000000000011fe <+344>:    shl    $0xc,%rsi
   0x0000000000001202 <+348>:    add    %rcx,%rsi
   0x0000000000001205 <+351>:    mov    $0x400,%ecx
   0x000000000000120a <+356>:    rep movsl %ds:(%rsi),%es:(%rdi)
   0x000000000000120c <+358>:    decl   0x1c(%rbp)
   0x000000000000120f <+361>:    decl   0x1c(%rbp)
   0x0000000000001212 <+364>:    mov    %rdx,%rdi
   0x0000000000001215 <+367>:    mov    %rdx,(%rsp)
   0x0000000000001219 <+371>:    callq  0x121e <ttm_tt_swapout+376>
   0x000000000000121e <+376>:    mov    (%rsp),%rdx
   0x0000000000001222 <+380>:    mov    %rdx,%rdi
   0x0000000000001225 <+383>:    callq  0x122a <ttm_tt_swapout+388>
   0x000000000000122a <+388>:    mov    (%rsp),%rdx
   0x000000000000122e <+392>:    mov    %rdx,%rdi
   0x0000000000001231 <+395>:    callq  0x1236 <ttm_tt_swapout+400>
   0x0000000000001236 <+400>:    incl   0xc(%rsp)
   0x000000000000123a <+404>:    movslq 0xc(%rsp),%rsi
   0x000000000000123f <+409>:    cmp    0x28(%rbx),%rsi
   0x0000000000001243 <+413>:    jb     0x115c <ttm_tt_swapout+182>
   0x0000000000001249 <+419>:    mov    %rbx,%rdi
   0x000000000000124c <+422>:    xor    %ebp,%ebp
   0x000000000000124e <+424>:    callq  0xe91 <ttm_tt_free_alloced_pages>
   0x0000000000001253 <+429>:    mov    0x20(%rbx),%eax
   0x0000000000001256 <+432>:    mov    %r12,0x50(%rbx)
   0x000000000000125a <+436>:    mov    %eax,%edx
   0x000000000000125c <+438>:    or     $0x10,%edx
   0x000000000000125f <+441>:    test   %r13,%r13
   0x0000000000001262 <+444>:    mov    %edx,0x20(%rbx)
   0x0000000000001265 <+447>:    je     0x1277 <ttm_tt_swapout+465>
   0x0000000000001267 <+449>:    or     $0x30,%eax
   0x000000000000126a <+452>:    mov    %eax,0x20(%rbx)
   0x000000000000126d <+455>:    jmp    0x1277 <ttm_tt_swapout+465>
   0x000000000000126f <+457>:    mov    %r12,%rdi
   0x0000000000001272 <+460>:    callq  0x1277 <ttm_tt_swapout+465>
   0x0000000000001277 <+465>:    add    $0x18,%rsp
   0x000000000000127b <+469>:    mov    %ebp,%eax
   0x000000000000127d <+471>:    pop    %rbx
   0x000000000000127e <+472>:    pop    %rbp
   0x000000000000127f <+473>:    pop    %r12
   0x0000000000001281 <+475>:    pop    %r13
   0x0000000000001283 <+477>:    pop    %r14
   0x0000000000001285 <+479>:    pop    %r15
   0x0000000000001287 <+481>:    retq   
End of assembler dump.

See the attached kern.log for the "Oops" error messages and tell me if I can
provide further information.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
