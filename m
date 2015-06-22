From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91056] The Bard's Tale (2005,
	native)  has rendering issues
Date: Mon, 22 Jun 2015 13:32:25 +0000
Message-ID: <bug-91056-8800-cLIb2BRFMw@http.bugs.freedesktop.org/>
References: <bug-91056-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0079463592=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-91056-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0079463592==
Content-Type: multipart/alternative; boundary="1434979945.b7FD1.28642"; charset="UTF-8"


--1434979945.b7FD1.28642
Date: Mon, 22 Jun 2015 13:32:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91056

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Couldn't reproduce on a GF108 (nvc1), which means this is nv50-specific. I did
see some small render fail with the GF108 (the black polygon you mention
happens in the blob too), and it didn't go away with NV50_PROG_OPTIMIZE=0.

So... you need to isolate the pass that's making things worse. This can be
tricky as sometimes one pass will affect another. Start with

NV50_PROG_OPTIMIZE=1

If that fails identically, then go into nv50_ir_peephole.cpp, and look at

bool
Program::optimizeSSA(int level)
{
   RUN_PASS(1, DeadCodeElim, buryAll);
   RUN_PASS(1, CopyPropagation, run);
   RUN_PASS(1, MergeSplits, run);
   RUN_PASS(2, GlobalCSE, run);
   RUN_PASS(1, LocalCSE, run);
   RUN_PASS(2, AlgebraicOpt, run);
   RUN_PASS(2, ModifierFolding, run); // before load propagation -> less checks
   RUN_PASS(1, ConstantFolding, foldAll);
   RUN_PASS(1, LoadPropagation, run);
   RUN_PASS(2, MemoryOpt, run);
   RUN_PASS(2, LocalCSE, run);
   RUN_PASS(0, DeadCodeElim, buryAll);

   return true;
}

Try to find the smallest set of 1's you have to change into 2's, until
NV50_PROG_OPTIMIZE=1 works. [By the way, since you commented on bug 90887, I
assume you have the relevant patch from that too.]

If NV50_PROG_OPTIMIZE=1 already works, try flipping some 2's into 1's until it
no longer works.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1434979945.b7FD1.28642
Date: Mon, 22 Jun 2015 13:32:25 +0000
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
   title="NEW - The Bard's Tale (2005, native) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91056#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - The Bard's Tale (2005, native) has rendering issues"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91056">bug 91056</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Couldn't reproduce on a GF108 (nvc1), which means this is nv50-specific. I did
see some small render fail with the GF108 (the black polygon you mention
happens in the blob too), and it didn't go away with NV50_PROG_OPTIMIZE=0.

So... you need to isolate the pass that's making things worse. This can be
tricky as sometimes one pass will affect another. Start with

NV50_PROG_OPTIMIZE=1

If that fails identically, then go into nv50_ir_peephole.cpp, and look at

bool
Program::optimizeSSA(int level)
{
   RUN_PASS(1, DeadCodeElim, buryAll);
   RUN_PASS(1, CopyPropagation, run);
   RUN_PASS(1, MergeSplits, run);
   RUN_PASS(2, GlobalCSE, run);
   RUN_PASS(1, LocalCSE, run);
   RUN_PASS(2, AlgebraicOpt, run);
   RUN_PASS(2, ModifierFolding, run); // before load propagation -&gt; less checks
   RUN_PASS(1, ConstantFolding, foldAll);
   RUN_PASS(1, LoadPropagation, run);
   RUN_PASS(2, MemoryOpt, run);
   RUN_PASS(2, LocalCSE, run);
   RUN_PASS(0, DeadCodeElim, buryAll);

   return true;
}

Try to find the smallest set of 1's you have to change into 2's, until
NV50_PROG_OPTIMIZE=1 works. [By the way, since you commented on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="show_bug.cgi?id=90887">bug 90887</a>, I
assume you have the relevant patch from that too.]

If NV50_PROG_OPTIMIZE=1 already works, try flipping some 2's into 1's until it
no longer works.</pre>
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

--1434979945.b7FD1.28642--

--===============0079463592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0079463592==--
