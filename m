From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90348] Spilling failure of b96 merged value
Date: Wed, 06 May 2015 23:12:47 +0000
Message-ID: <bug-90348-8800-MpZIxw9LtB@http.bugs.freedesktop.org/>
References: <bug-90348-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1048400420=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90348-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1048400420==
Content-Type: multipart/alternative; boundary="1430953967.eE75d4A00.4461"; charset="UTF-8"


--1430953967.eE75d4A00.4461
Date: Wed, 6 May 2015 23:12:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90348

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Created attachment 115607
  --> https://bugs.freedesktop.org/attachment.cgi?id=115607&action=edit
shader causing spill failure

Compile with -a e4 to get the failure. Works on GK110 since that has 256
registers.

This is what ultimately causes the failure at emit time:

140: texfetch 2D $r0 $s0 f32 $r48t $r48q (8)
141: texbar - # $r48t (8)
142: st b96 # l[0x0] $r48t (8)

codegen/nv50_ir_emit_nvc0.cpp:1659:emitLoadStoreType: Assertion `!"invalid
type"' failed.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1430953967.eE75d4A00.4461
Date: Wed, 6 May 2015 23:12:47 +0000
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
   title="NEW - Spilling failure of b96 merged value"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90348#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Spilling failure of b96 merged value"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90348">bug 90348</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=115607" name="attach_115607" title="shader causing spill failure">attachment 115607</a> <a href="attachment.cgi?id=115607&amp;action=edit" title="shader causing spill failure">[details]</a></span>
shader causing spill failure

Compile with -a e4 to get the failure. Works on GK110 since that has 256
registers.

This is what ultimately causes the failure at emit time:

140: texfetch 2D $r0 $s0 f32 $r48t $r48q (8)
141: texbar - # $r48t (8)
142: st b96 # l[0x0] $r48t (8)

codegen/nv50_ir_emit_nvc0.cpp:1659:emitLoadStoreType: Assertion `!&quot;invalid
type&quot;' failed.</pre>
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

--1430953967.eE75d4A00.4461--

--===============1048400420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1048400420==--
