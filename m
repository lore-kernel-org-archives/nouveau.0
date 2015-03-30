From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Mon, 30 Mar 2015 20:25:36 +0000
Message-ID: <bug-82714-8800-gAger9jg4h@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0835252454=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0835252454==
Content-Type: multipart/alternative; boundary="1427747136.7BBa2C2.18682"; charset="UTF-8"


--1427747136.7BBa2C2.18682
Date: Mon, 30 Mar 2015 20:25:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #10 from Bruno <bonbons-lhzhVDjRGQBulxpn9UvDqw@public.gmane.org> ---
(In reply to Bruno from comment #9)
> Created attachment 114735 [details]
> 4.0-rc6 dmesg of nouveau loading (debug, runpm=0)

The first BUG happens in evo_wait() at line 420 of nv50_display.c

Seems like dmac->ptr[put] is bad.

413: evo_wait(void *evoc, int nr)
414: {
415:     struct nv50_dmac *dmac = evoc;
416:     u32 put = nvif_rd32(&dmac->base.user, 0x0000) / 4;
417:
418:     mutex_lock(&dmac->lock);
419:     if (put + nr >= (PAGE_SIZE / 4) - 8) {
420:         dmac->ptr[put] = 0x20000000;
421:
422:         nvif_wr32(&dmac->base.user, 0x0000, 0x00000000);
423:         if (!nvxx_wait(&dmac->base.user, 0x0004, ~0, 0x00000000)) {
424:             mutex_unlock(&dmac->lock);
425:             nv_error(nvxx_object(&dmac->base.user), "channel stalled\n");
426:             return NULL;
427:         }
428:
429:         put = 0;
430:     }
431:
432:     return dmac->ptr + put;
433: }

In ASM:
180:       55                      push   %rbp
181:       48 89 e5                mov    %rsp,%rbp
184:       48 83 ec 20             sub    $0x20,%rsp
188:       48 89 5d e0             mov    %rbx,-0x20(%rbp)
18c:       4c 89 75 f8             mov    %r14,-0x8(%rbp)
190:       48 89 fb                mov    %rdi,%rbx
193:       4c 89 65 e8             mov    %r12,-0x18(%rbp)
197:       4c 89 6d f0             mov    %r13,-0x10(%rbp)
19b:       41 89 f6                mov    %esi,%r14d
19e:       48 8b 47 08             mov    0x8(%rdi),%rax
1a2:       48 8b 78 40             mov    0x40(%rax),%rdi
1a6:       48 85 ff                test   %rdi,%rdi
1a9:       0f 84 e1 00 00 00       je     290 <evo_wait+0x110>
1af:       e8 00 00 00 00          callq  1b4 <evo_wait+0x34>
1b4:       c1 e8 02                shr    $0x2,%eax
1b7:       4c 8d ab 00 01 00 00    lea    0x100(%rbx),%r13
1be:       41 89 c4                mov    %eax,%r12d
1c1:       4c 89 ef                mov    %r13,%rdi
1c4:       45 01 e6                add    %r12d,%r14d
1c7:       e8 00 00 00 00          callq  1cc <evo_wait+0x4c>
1cc:       41 81 fe f7 03 00 00    cmp    $0x3f7,%r14d
1d3:       0f 86 87 00 00 00       jbe    260 <evo_wait+0xe0>
1d9:       48 8b 43 58             mov    0x58(%rbx),%rax
1dd:       42 c7 04 a0 00 00 00    movl   $0x20000000,(%rax,%r12,4)
           ^
1e4:       20
...

From the trace:
 access at 0xffff880313207ffc  (rax - 4)
r12 = 0x000000003fffffff
rax = 0xffff880213208000

Decoded data:
dmac@ffff880214419b70->ptr[put=1073741823] = 0x20000000

That would mean that nvif_rd32(&dmac->base.user, 0x0000) returns 0xffffffff.
That value looks rather "non-initialized" and GPU's PCI bar surly is not 4GB
large.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1427747136.7BBa2C2.18682
Date: Mon, 30 Mar 2015 20:25:36 +0000
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
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c10">Comment # 10</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:bonbons&#64;sysophe.eu" title="Bruno &lt;bonbons&#64;sysophe.eu&gt;"> <span class="fn">Bruno</span></a>
</span></b>
        <pre>(In reply to Bruno from <a href="show_bug.cgi?id=82714#c9">comment #9</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=114735" name="attach_114735" title="4.0-rc6 dmesg of nouveau loading (debug, runpm=0)">attachment 114735</a> <a href="attachment.cgi?id=114735&amp;action=edit" title="4.0-rc6 dmesg of nouveau loading (debug, runpm=0)">[details]</a></span>
&gt; 4.0-rc6 dmesg of nouveau loading (debug, runpm=0)</span >

The first BUG happens in evo_wait() at line 420 of nv50_display.c

Seems like dmac-&gt;ptr[put] is bad.

413: evo_wait(void *evoc, int nr)
414: {
415:     struct nv50_dmac *dmac = evoc;
416:     u32 put = nvif_rd32(&amp;dmac-&gt;base.user, 0x0000) / 4;
417:
418:     mutex_lock(&amp;dmac-&gt;lock);
419:     if (put + nr &gt;= (PAGE_SIZE / 4) - 8) {
420:         dmac-&gt;ptr[put] = 0x20000000;
421:
422:         nvif_wr32(&amp;dmac-&gt;base.user, 0x0000, 0x00000000);
423:         if (!nvxx_wait(&amp;dmac-&gt;base.user, 0x0004, ~0, 0x00000000)) {
424:             mutex_unlock(&amp;dmac-&gt;lock);
425:             nv_error(nvxx_object(&amp;dmac-&gt;base.user), &quot;channel stalled\n&quot;);
426:             return NULL;
427:         }
428:
429:         put = 0;
430:     }
431:
432:     return dmac-&gt;ptr + put;
433: }

In ASM:
180:       55                      push   %rbp
181:       48 89 e5                mov    %rsp,%rbp
184:       48 83 ec 20             sub    $0x20,%rsp
188:       48 89 5d e0             mov    %rbx,-0x20(%rbp)
18c:       4c 89 75 f8             mov    %r14,-0x8(%rbp)
190:       48 89 fb                mov    %rdi,%rbx
193:       4c 89 65 e8             mov    %r12,-0x18(%rbp)
197:       4c 89 6d f0             mov    %r13,-0x10(%rbp)
19b:       41 89 f6                mov    %esi,%r14d
19e:       48 8b 47 08             mov    0x8(%rdi),%rax
1a2:       48 8b 78 40             mov    0x40(%rax),%rdi
1a6:       48 85 ff                test   %rdi,%rdi
1a9:       0f 84 e1 00 00 00       je     290 &lt;evo_wait+0x110&gt;
1af:       e8 00 00 00 00          callq  1b4 &lt;evo_wait+0x34&gt;
1b4:       c1 e8 02                shr    $0x2,%eax
1b7:       4c 8d ab 00 01 00 00    lea    0x100(%rbx),%r13
1be:       41 89 c4                mov    %eax,%r12d
1c1:       4c 89 ef                mov    %r13,%rdi
1c4:       45 01 e6                add    %r12d,%r14d
1c7:       e8 00 00 00 00          callq  1cc &lt;evo_wait+0x4c&gt;
1cc:       41 81 fe f7 03 00 00    cmp    $0x3f7,%r14d
1d3:       0f 86 87 00 00 00       jbe    260 &lt;evo_wait+0xe0&gt;
1d9:       48 8b 43 58             mov    0x58(%rbx),%rax
1dd:       42 c7 04 a0 00 00 00    movl   $0x20000000,(%rax,%r12,4)
           ^
1e4:       20
...

From the trace:
 access at 0xffff880313207ffc  (rax - 4)
r12 = 0x000000003fffffff
rax = 0xffff880213208000

Decoded data:
dmac&#64;ffff880214419b70-&gt;ptr[put=1073741823] = 0x20000000

That would mean that nvif_rd32(&amp;dmac-&gt;base.user, 0x0000) returns 0xffffffff.
That value looks rather &quot;non-initialized&quot; and GPU's PCI bar surly is not 4GB
large.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1427747136.7BBa2C2.18682--

--===============0835252454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0835252454==--
