From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Thu, 17 Oct 2013 20:30:11 +0000
Message-ID: <bug-70390-8800-pZBPBhmB9B@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1699353732=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70390-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1699353732==
Content-Type: multipart/alternative; boundary="1382041811.0A7Ab1271.19626"; charset="us-ascii"


--1382041811.0A7Ab1271.19626
Date: Thu, 17 Oct 2013 20:30:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #14 from Martin von Gagern <Martin.vGagern-hi6Y0CQ0nG0@public.gmane.org> ---
(In reply to comment #13)
> nv84_fence_emit32+0xda/0x1a0
> 
> Can you figure out exactly which write this is pointing at? For some of the
> values, it could be perfectly legitimate to have the 0x406040 value (e.g.
> the sequence id, or the low bits of the address).

It's the sequence id. The inlined OUT_RING function makes line numbers almost
unusable, but I see the right shift for upper_32_bits, and it's the third
nouveau_bo_wr32 call after that. False alarm?

> My point about nv50_dma_push is that this is the path that user-submitted
> command streams take; they don't go through nouveau_bo_wr*, they are written
> by userspace via mmap'd sections, and then commands are written to the ring
> to jump to them.

I see. And after all, I got the error message in comment #10 without triggering
the BUG_ON, so there has to be a way around this check.

So what exactly do I examine in nv50_dma_push? I see arguments delta and
length, and the delta is used to compute some offset. But all of these are
declared as integers of various sizes and signedness, not as pointers. Should I
cast one or the other to void* and iterate over length 32bit words? Or length/4
32bit words?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382041811.0A7Ab1271.19626
Date: Thu, 17 Oct 2013 20:30:11 +0000
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
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:Martin.vGagern&#64;gmx.net" title="Martin von Gagern &lt;Martin.vGagern&#64;gmx.net&gt;"> <span class="fn">Martin von Gagern</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=70390#c13">comment #13</a>)
<span class="quote">&gt; nv84_fence_emit32+0xda/0x1a0
&gt; 
&gt; Can you figure out exactly which write this is pointing at? For some of the
&gt; values, it could be perfectly legitimate to have the 0x406040 value (e.g.
&gt; the sequence id, or the low bits of the address).</span >

It's the sequence id. The inlined OUT_RING function makes line numbers almost
unusable, but I see the right shift for upper_32_bits, and it's the third
nouveau_bo_wr32 call after that. False alarm?

<span class="quote">&gt; My point about nv50_dma_push is that this is the path that user-submitted
&gt; command streams take; they don't go through nouveau_bo_wr*, they are written
&gt; by userspace via mmap'd sections, and then commands are written to the ring
&gt; to jump to them.</span >

I see. And after all, I got the error message in <a href="show_bug.cgi?id=70390#c10">comment #10</a> without triggering
the BUG_ON, so there has to be a way around this check.

So what exactly do I examine in nv50_dma_push? I see arguments delta and
length, and the delta is used to compute some offset. But all of these are
declared as integers of various sizes and signedness, not as pointers. Should I
cast one or the other to void* and iterate over length 32bit words? Or length/4
32bit words?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382041811.0A7Ab1271.19626--

--===============1699353732==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1699353732==--
