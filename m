From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Sat, 22 Aug 2015 14:16:33 +0000
Message-ID: <bug-90887-8800-LCMt9SU15x@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1338908339=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1338908339==
Content-Type: multipart/alternative; boundary="1440252993.6f72b2.4275"; charset="UTF-8"


--1440252993.6f72b2.4275
Date: Sat, 22 Aug 2015 14:16:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #35 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
(In reply to jr from comment #34)
> (In reply to Ilia Mirkin from comment #33)
> > (In reply to jr from comment #32)
> > > (In reply to Ilia Mirkin from comment #31)
> > > > Really if I could understand wtf the needNewElseBlock logic was trying to
> > > > do, and could construct a test shader to hit this in *regular* scenarios,
> > > > not just the lowered output of TXL, that would make me a lot more
> > > > comfortable with any approach that we pick.
> > > 
> > > Looking at the TGSI->IR translation I'd guess that needNewElseBlock is
> > > trying to detect the edge from the 'bare' unconditional jump in an if
> > > without else, seemingly because adding the new moves is not allowed (though
> > > I'm not sure why). At least it seems to be the only construct creating a
> > > graph satisfying the condition, AFAICT.
> > 
> > Well, in general you can't add work if you have a critical edge -- if an
> > block has multiple outgoing edges, then you can't put the work into that
> > block. If a block has multiple incoming edges, then you can't leave the work
> > in that block, so you have to create a separate block to put work that you
> > want done on that specific block transition.
> > 
> > However here it's looking for something much more specific.
> 
> Ok, that makes sense. It might be that the original author wasn't thinking
> about the problem in this terms and just wanted to fix the single
> problematic case at hand, i.e. if without else. Then splitting any critical
> edge would be the right solution, though in practice I don't think it'd
> trigger more often.

After looking at it some more I'm convinced that this is what the original
intent was. It also explains why the tree types of the new edges were
hardcoded. Because the (critical) edge being split was always a forward edge.

I may also have found your problem with the missing base blocks. If you look at
the log of the critical-edge test (it's easier to see in my version because it
has dumping of incoming edges enabled) you'll see that BB 4 and 6 have only
forward incoming edges and have been pruned (together with following blocks).
This is not directly related to the PhiMovesProblem, but is a result of the
TGSI->IR translation. One of the two edges inserted by TGSI_OPCODE_ENDIF should
be TREE. I don't know which one to choose. If we choose the condBB one than the
assumption of the PhiMovesPass that the split esge is always type FORWARD will
be wrong and the resulting graph will be wrong. I'll modify my prototype patch
in a second to take this into account correctly (and remove the type
hardcoding, but differently than I thought, it is the second edge that has to
keep the type), so that we can choose either way.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440252993.6f72b2.4275
Date: Sat, 22 Aug 2015 14:16:33 +0000
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
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c35">Comment # 35</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>(In reply to jr from <a href="show_bug.cgi?id=90887#c34">comment #34</a>)
<span class="quote">&gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c33">comment #33</a>)
&gt; &gt; (In reply to jr from <a href="show_bug.cgi?id=90887#c32">comment #32</a>)
&gt; &gt; &gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c31">comment #31</a>)
&gt; &gt; &gt; &gt; Really if I could understand wtf the needNewElseBlock logic was trying to
&gt; &gt; &gt; &gt; do, and could construct a test shader to hit this in *regular* scenarios,
&gt; &gt; &gt; &gt; not just the lowered output of TXL, that would make me a lot more
&gt; &gt; &gt; &gt; comfortable with any approach that we pick.
&gt; &gt; &gt; 
&gt; &gt; &gt; Looking at the TGSI-&gt;IR translation I'd guess that needNewElseBlock is
&gt; &gt; &gt; trying to detect the edge from the 'bare' unconditional jump in an if
&gt; &gt; &gt; without else, seemingly because adding the new moves is not allowed (though
&gt; &gt; &gt; I'm not sure why). At least it seems to be the only construct creating a
&gt; &gt; &gt; graph satisfying the condition, AFAICT.
&gt; &gt; 
&gt; &gt; Well, in general you can't add work if you have a critical edge -- if an
&gt; &gt; block has multiple outgoing edges, then you can't put the work into that
&gt; &gt; block. If a block has multiple incoming edges, then you can't leave the work
&gt; &gt; in that block, so you have to create a separate block to put work that you
&gt; &gt; want done on that specific block transition.
&gt; &gt; 
&gt; &gt; However here it's looking for something much more specific.
&gt; 
&gt; Ok, that makes sense. It might be that the original author wasn't thinking
&gt; about the problem in this terms and just wanted to fix the single
&gt; problematic case at hand, i.e. if without else. Then splitting any critical
&gt; edge would be the right solution, though in practice I don't think it'd
&gt; trigger more often.</span >

After looking at it some more I'm convinced that this is what the original
intent was. It also explains why the tree types of the new edges were
hardcoded. Because the (critical) edge being split was always a forward edge.

I may also have found your problem with the missing base blocks. If you look at
the log of the critical-edge test (it's easier to see in my version because it
has dumping of incoming edges enabled) you'll see that BB 4 and 6 have only
forward incoming edges and have been pruned (together with following blocks).
This is not directly related to the PhiMovesProblem, but is a result of the
TGSI-&gt;IR translation. One of the two edges inserted by TGSI_OPCODE_ENDIF should
be TREE. I don't know which one to choose. If we choose the condBB one than the
assumption of the PhiMovesPass that the split esge is always type FORWARD will
be wrong and the resulting graph will be wrong. I'll modify my prototype patch
in a second to take this into account correctly (and remove the type
hardcoding, but differently than I thought, it is the second edge that has to
keep the type), so that we can choose either way.</pre>
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

--1440252993.6f72b2.4275--

--===============1338908339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1338908339==--
