From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91124] Civilization V (in Wine) has rendering
 issues: text missing, menu bar corrupted
Date: Tue, 30 Jun 2015 08:19:01 +0000
Message-ID: <bug-91124-8800-sgUvP8RfzY@http.bugs.freedesktop.org/>
References: <bug-91124-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0037059870=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91124-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0037059870==
Content-Type: multipart/alternative; boundary="1435652341.A36AD1.24275"; charset="UTF-8"


--1435652341.A36AD1.24275
Date: Tue, 30 Jun 2015 08:19:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91124

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 116817
  --> https://bugs.freedesktop.org/attachment.cgi?id=116817&action=edit
shader that triggers bug

The attached shader appears to trigger an issue in the FlatteningPass.
Specifically the resulting code looks like

00000198: a0036003 00000000     joinat 0x1b0
000001a0: b00005fd 600187c8     set $c0 # ge f32 $r2 $r0
000001a8: 1000020d 0403c100     (e $c0) mov b32 $r3 $r1
000001b0: 10000801 2400c780   B ld $r0 b32 c0[0x10]

That joinat shouldn't be there at all. This is a bit tricky, since pre-RA, the
code looks like

 60: joinat BB:5 (0)
 61: set u8 %c259 ge f32 %r215 %r255 (0)
 62: eq %c259 bra BB:4 (0)
BB:3 (1 instructions) - idom = BB:12, df = { BB:5 }
 -> BB:5 (forward)
 63: bra BB:5 (0)
BB:4 (1 instructions) - idom = BB:12, df = { BB:5 }
 -> BB:5 (forward)
 64: bra BB:5 (0)
BB:5 (14 instructions) - idom = BB:12, df = { BB:10 }
 -> BB:7 (tree)
 -> BB:6 (tree)
 65: phi u32 %r261 %r254 %r252 (0)
 66: join (0)

and the (e $c0) mov ... is actually generated from the phi node (since it
creates constraint moves into BB:3/4. Post-RA but pre-FlatteningPass, this
looks like

 64: joinat BB:5 (0)
 65: set u8 $c0 ge f32 $r2 $r0 (0)
 66: eq $c0 bra BB:4 (0)
BB:3 (1 instructions) - idom = BB:12, df = { BB:5 }
 -> BB:5 (forward)
 67: bra BB:5 (0)
BB:4 (2 instructions) - idom = BB:12, df = { BB:5 }
 -> BB:5 (forward)
 68: mov u32 $r3 $r1 (0)
 69: bra BB:5 (0)
BB:5 (13 instructions) - idom = BB:12, df = { BB:10 }
 -> BB:7 (tree)
 -> BB:6 (tree)
 70: join (0)

Will have to understand the FlatteningPass better before I can figure out
what's wrong though.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1435652341.A36AD1.24275
Date: Tue, 30 Jun 2015 08:19:01 +0000
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
   title="NEW - Civilization V (in Wine) has rendering issues: text missing, menu bar corrupted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91124#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Civilization V (in Wine) has rendering issues: text missing, menu bar corrupted"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91124">bug 91124</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116817" name="attach_116817" title="shader that triggers bug">attachment 116817</a> <a href="attachment.cgi?id=116817&amp;action=edit" title="shader that triggers bug">[details]</a></span>
shader that triggers bug

The attached shader appears to trigger an issue in the FlatteningPass.
Specifically the resulting code looks like

00000198: a0036003 00000000     joinat 0x1b0
000001a0: b00005fd 600187c8     set $c0 # ge f32 $r2 $r0
000001a8: 1000020d 0403c100     (e $c0) mov b32 $r3 $r1
000001b0: 10000801 2400c780   B ld $r0 b32 c0[0x10]

That joinat shouldn't be there at all. This is a bit tricky, since pre-RA, the
code looks like

 60: joinat BB:5 (0)
 61: set u8 %c259 ge f32 %r215 %r255 (0)
 62: eq %c259 bra BB:4 (0)
BB:3 (1 instructions) - idom = BB:12, df = { BB:5 }
 -&gt; BB:5 (forward)
 63: bra BB:5 (0)
BB:4 (1 instructions) - idom = BB:12, df = { BB:5 }
 -&gt; BB:5 (forward)
 64: bra BB:5 (0)
BB:5 (14 instructions) - idom = BB:12, df = { BB:10 }
 -&gt; BB:7 (tree)
 -&gt; BB:6 (tree)
 65: phi u32 %r261 %r254 %r252 (0)
 66: join (0)

and the (e $c0) mov ... is actually generated from the phi node (since it
creates constraint moves into BB:3/4. Post-RA but pre-FlatteningPass, this
looks like

 64: joinat BB:5 (0)
 65: set u8 $c0 ge f32 $r2 $r0 (0)
 66: eq $c0 bra BB:4 (0)
BB:3 (1 instructions) - idom = BB:12, df = { BB:5 }
 -&gt; BB:5 (forward)
 67: bra BB:5 (0)
BB:4 (2 instructions) - idom = BB:12, df = { BB:5 }
 -&gt; BB:5 (forward)
 68: mov u32 $r3 $r1 (0)
 69: bra BB:5 (0)
BB:5 (13 instructions) - idom = BB:12, df = { BB:10 }
 -&gt; BB:7 (tree)
 -&gt; BB:6 (tree)
 70: join (0)

Will have to understand the FlatteningPass better before I can figure out
what's wrong though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1435652341.A36AD1.24275--

--===============0037059870==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0037059870==--
