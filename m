From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73744] [NVA8] Constant lock ups with NVIDIA GeForce
	8400 GS
Date: Tue, 11 Feb 2014 02:42:54 +0000
Message-ID: <bug-73744-8800-pgTWoGjQ0U@http.bugs.freedesktop.org/>
References: <bug-73744-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0032539313=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73744-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0032539313==
Content-Type: multipart/alternative; boundary="1392086573.05AF71.9820"; charset="us-ascii"


--1392086573.05AF71.9820
Date: Tue, 11 Feb 2014 02:42:53 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73744

--- Comment #17 from grave_123-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org ---
(In reply to comment #16)
> The relevant bits:
> 
> TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at 07fcc0 warp 0, opcode 0d0d0d0d
> 0d0d0d0d
>  TRAP
> ch 5 [0x003fc34000 compiz[2897]] subc 3 class 0x8597 mthd 0x0f04 data
> 0x3f800000
> PGRAPH TLB flush idle timeout fail
> PGRAPH_STATUS  : 0x00c00c03 BUSY DISPATCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5
> TPVP MP
> PGRAPH_VSTATUS0: 0x00000208 CCACHE UNK5
> PGRAPH_VSTATUS1: 0x00005600
> PGRAPH_VSTATUS2: 0x00000000
> TRAP_MP_EXEC - TP 0 MP 1: TIMEOUT at 07fcc0 warp 0, opcode 0d0d0d0d 0d0d0d0d
>  TRAP
> ch 5 [0x003fc34000 compiz[2897]] subc 3 class 0x8597 mthd 0x0f04 data
> 0x3f800000
> TRAP_MP_EXEC - TP 0 MP 1: TIMEOUT at 07fcc0 warp 0, opcode 0d0d0d0d 0d0d0d0d
>  TRAP
> ch 5 [0x003fc34000 compiz[2897]] subc 3 class 0x8597 mthd 0x0f04 data
> 0x3f800000
> PGRAPH TLB flush idle timeout fail
> PGRAPH_STATUS  : 0x00c00c03 BUSY DISPATCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5
> TPVP MP
> PGRAPH_VSTATUS0: 0x00000208 CCACHE UNK5
> PGRAPH_VSTATUS1: 0x00005600
> PGRAPH_VSTATUS2: 0x00000000
> TRAP_MP_EXEC - TP 0 MP 1: TIMEOUT at 07fcc0 warp 0, opcode 0d0d0d0d 0d0d0d0d
>  TRAP
> 
> So it looks like the code got overwritten with 0x0d (13) bytes. Never seen a
> TIMEOUT error before -- neat. Not sure what to make of it though.

I hope this was a good chunk of info here. Thanks for the SSH idea by the way.
Saved a thrashing on my hardware! So what's up now? What's the plan? :))

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392086573.05AF71.9820
Date: Tue, 11 Feb 2014 02:42:53 +0000
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
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744#c17">Comment # 17</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] Constant lock ups with NVIDIA GeForce 8400 GS"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73744">bug 73744</a>
              from <span class="vcard"><a class="email" href="mailto:grave_123&#64;riseup.net" title="grave_123&#64;riseup.net">grave_123&#64;riseup.net</a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=73744#c16">comment #16</a>)
<span class="quote">&gt; The relevant bits:
&gt; 
&gt; TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at 07fcc0 warp 0, opcode 0d0d0d0d
&gt; 0d0d0d0d
&gt;  TRAP
&gt; ch 5 [0x003fc34000 compiz[2897]] subc 3 class 0x8597 mthd 0x0f04 data
&gt; 0x3f800000
&gt; PGRAPH TLB flush idle timeout fail
&gt; PGRAPH_STATUS  : 0x00c00c03 BUSY DISPATCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5
&gt; TPVP MP
&gt; PGRAPH_VSTATUS0: 0x00000208 CCACHE UNK5
&gt; PGRAPH_VSTATUS1: 0x00005600
&gt; PGRAPH_VSTATUS2: 0x00000000
&gt; TRAP_MP_EXEC - TP 0 MP 1: TIMEOUT at 07fcc0 warp 0, opcode 0d0d0d0d 0d0d0d0d
&gt;  TRAP
&gt; ch 5 [0x003fc34000 compiz[2897]] subc 3 class 0x8597 mthd 0x0f04 data
&gt; 0x3f800000
&gt; TRAP_MP_EXEC - TP 0 MP 1: TIMEOUT at 07fcc0 warp 0, opcode 0d0d0d0d 0d0d0d0d
&gt;  TRAP
&gt; ch 5 [0x003fc34000 compiz[2897]] subc 3 class 0x8597 mthd 0x0f04 data
&gt; 0x3f800000
&gt; PGRAPH TLB flush idle timeout fail
&gt; PGRAPH_STATUS  : 0x00c00c03 BUSY DISPATCH CCACHE_UNK4 STRMOUT_GSCHED_UNK5
&gt; TPVP MP
&gt; PGRAPH_VSTATUS0: 0x00000208 CCACHE UNK5
&gt; PGRAPH_VSTATUS1: 0x00005600
&gt; PGRAPH_VSTATUS2: 0x00000000
&gt; TRAP_MP_EXEC - TP 0 MP 1: TIMEOUT at 07fcc0 warp 0, opcode 0d0d0d0d 0d0d0d0d
&gt;  TRAP
&gt; 
&gt; So it looks like the code got overwritten with 0x0d (13) bytes. Never seen a
&gt; TIMEOUT error before -- neat. Not sure what to make of it though.</span >

I hope this was a good chunk of info here. Thanks for the SSH idea by the way.
Saved a thrashing on my hardware! So what's up now? What's the plan? :))</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392086573.05AF71.9820--

--===============0032539313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0032539313==--
