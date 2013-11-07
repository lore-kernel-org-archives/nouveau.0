From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [any/all(?) cards below nv50(?)] libdrm built
 with gcc4.8 causes crashes/lockups during normal operation,
 and resume from disk/memory
Date: Thu, 07 Nov 2013 11:57:53 +0000
Message-ID: <bug-71116-8800-KnJzKC8SMv@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1277172347=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1277172347==
Content-Type: multipart/alternative; boundary="1383825473.cdB46e2.23664"; charset="us-ascii"


--1383825473.cdB46e2.23664
Date: Thu, 7 Nov 2013 11:57:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

--- Comment #22 from Maarten Lankhorst <bugs-FcfepWsj2zOByvU0x3ry2g@public.gmane.org> ---
Oops, so gcc is broken here after all, look at this..

0000000000003860 <nouveau_pushbuf_reloc>:
    3860:       53                      push   %rbx
    3861:       48 8b 5f 30             mov    0x30(%rdi),%rbx
    3865:       48 8d 43 04             lea    0x4(%rbx),%rax
    3869:       48 89 47 30             mov    %rax,0x30(%rdi)
    386d:       e8 3e ea ff ff          callq  22b0 <pushbuf_krel>
    3872:       89 03                   mov    %eax,(%rbx)
    3874:       5b                      pop    %rbx
    3875:       c3                      retq   

Source:

void
nouveau_pushbuf_reloc(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
              uint32_t data, uint32_t flags, uint32_t vor, uint32_t tor)
{
    *push->cur++ = pushbuf_krel(push, bo, data, flags, vor, tor);
}

gcc-4.8 evaluates it as:

void
nouveau_pushbuf_reloc(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
              uint32_t data, uint32_t flags, uint32_t vor, uint32_t tor)
{
    push->cur++;
    *push->cur[-1] = pushbuf_krel(push, bo, data, flags, vor, tor);
}

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383825473.cdB46e2.23664
Date: Thu, 7 Nov 2013 11:57:53 +0000
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
   title="NEW --- - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c22">Comment # 22</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [any/all(?) cards below nv50(?)] libdrm built with gcc4.8 causes crashes/lockups during normal operation, and resume from disk/memory"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:bugs&#64;mblankhorst.nl" title="Maarten Lankhorst &lt;bugs&#64;mblankhorst.nl&gt;"> <span class="fn">Maarten Lankhorst</span></a>
</span></b>
        <pre>Oops, so gcc is broken here after all, look at this..

0000000000003860 &lt;nouveau_pushbuf_reloc&gt;:
    3860:       53                      push   %rbx
    3861:       48 8b 5f 30             mov    0x30(%rdi),%rbx
    3865:       48 8d 43 04             lea    0x4(%rbx),%rax
    3869:       48 89 47 30             mov    %rax,0x30(%rdi)
    386d:       e8 3e ea ff ff          callq  22b0 &lt;pushbuf_krel&gt;
    3872:       89 03                   mov    %eax,(%rbx)
    3874:       5b                      pop    %rbx
    3875:       c3                      retq   

Source:

void
nouveau_pushbuf_reloc(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
              uint32_t data, uint32_t flags, uint32_t vor, uint32_t tor)
{
    *push-&gt;cur++ = pushbuf_krel(push, bo, data, flags, vor, tor);
}

gcc-4.8 evaluates it as:

void
nouveau_pushbuf_reloc(struct nouveau_pushbuf *push, struct nouveau_bo *bo,
              uint32_t data, uint32_t flags, uint32_t vor, uint32_t tor)
{
    push-&gt;cur++;
    *push-&gt;cur[-1] = pushbuf_krel(push, bo, data, flags, vor, tor);
}</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383825473.cdB46e2.23664--

--===============1277172347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1277172347==--
