From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70390] [NV84] Repeated system crashes under graphics
 load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]
Date: Thu, 17 Oct 2013 19:44:02 +0000
Message-ID: <bug-70390-8800-Y4A4LFVCpd@http.bugs.freedesktop.org/>
References: <bug-70390-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1777273992=="
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


--===============1777273992==
Content-Type: multipart/alternative; boundary="1382039041.e1eB2.10878"; charset="us-ascii"


--1382039041.e1eB2.10878
Date: Thu, 17 Oct 2013 19:44:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70390

--- Comment #13 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
nv84_fence_emit32+0xda/0x1a0

Can you figure out exactly which write this is pointing at? For some of the
values, it could be perfectly legitimate to have the 0x406040 value (e.g. the
sequence id, or the low bits of the address).

(Load up nouveau.ko in gdb, and run "disassemble nv84_fence_emit32". Note that
gdb emits offsets in decimal as opposed to the above offsets which are in hex,
for maximal confusion.)

Ideally we'd have some sort of (optional) command stream validator that made
sure that there was no funny business going on.

My point about nv50_dma_push is that this is the path that user-submitted
command streams take; they don't go through nouveau_bo_wr*, they are written by
userspace via mmap'd sections, and then commands are written to the ring to
jump to them.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1382039041.e1eB2.10878
Date: Thu, 17 Oct 2013 19:44:01 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV84] Repeated system crashes under graphics load, E[PFIFO] DMA_PUSHER and lots of E[PGRAPH]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70390">bug 70390</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>nv84_fence_emit32+0xda/0x1a0

Can you figure out exactly which write this is pointing at? For some of the
values, it could be perfectly legitimate to have the 0x406040 value (e.g. the
sequence id, or the low bits of the address).

(Load up nouveau.ko in gdb, and run &quot;disassemble nv84_fence_emit32&quot;. Note that
gdb emits offsets in decimal as opposed to the above offsets which are in hex,
for maximal confusion.)

Ideally we'd have some sort of (optional) command stream validator that made
sure that there was no funny business going on.

My point about nv50_dma_push is that this is the path that user-submitted
command streams take; they don't go through nouveau_bo_wr*, they are written by
userspace via mmap'd sections, and then commands are written to the ring to
jump to them.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1382039041.e1eB2.10878--

--===============1777273992==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1777273992==--
