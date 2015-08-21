From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Fri, 21 Aug 2015 22:24:01 +0000
Message-ID: <bug-90887-8800-mUzOuEYHlz@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1757435515=="
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


--===============1757435515==
Content-Type: multipart/alternative; boundary="1440195841.C8e8803E2.25077"; charset="UTF-8"


--1440195841.C8e8803E2.25077
Date: Fri, 21 Aug 2015 22:24:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #34 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #33)
> (In reply to jr from comment #32)
> > (In reply to Ilia Mirkin from comment #31)
> > > Really if I could understand wtf the needNewElseBlock logic was trying to
> > > do, and could construct a test shader to hit this in *regular* scenarios,
> > > not just the lowered output of TXL, that would make me a lot more
> > > comfortable with any approach that we pick.
> > 
> > Looking at the TGSI->IR translation I'd guess that needNewElseBlock is
> > trying to detect the edge from the 'bare' unconditional jump in an if
> > without else, seemingly because adding the new moves is not allowed (though
> > I'm not sure why). At least it seems to be the only construct creating a
> > graph satisfying the condition, AFAICT.
> 
> Well, in general you can't add work if you have a critical edge -- if an
> block has multiple outgoing edges, then you can't put the work into that
> block. If a block has multiple incoming edges, then you can't leave the work
> in that block, so you have to create a separate block to put work that you
> want done on that specific block transition.
> 
> However here it's looking for something much more specific.

Ok, that makes sense. It might be that the original author wasn't thinking
about the problem in this terms and just wanted to fix the single problematic
case at hand, i.e. if without else. Then splitting any critical edge would be
the right solution, though in practice I don't think it'd trigger more often.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440195841.C8e8803E2.25077
Date: Fri, 21 Aug 2015 22:24:01 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c33">comment #33</a>)
<span class="quote">&gt; (In reply to jr from <a href="show_bug.cgi?id=90887#c32">comment #32</a>)
&gt; &gt; (In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c31">comment #31</a>)
&gt; &gt; &gt; Really if I could understand wtf the needNewElseBlock logic was trying to
&gt; &gt; &gt; do, and could construct a test shader to hit this in *regular* scenarios,
&gt; &gt; &gt; not just the lowered output of TXL, that would make me a lot more
&gt; &gt; &gt; comfortable with any approach that we pick.
&gt; &gt; 
&gt; &gt; Looking at the TGSI-&gt;IR translation I'd guess that needNewElseBlock is
&gt; &gt; trying to detect the edge from the 'bare' unconditional jump in an if
&gt; &gt; without else, seemingly because adding the new moves is not allowed (though
&gt; &gt; I'm not sure why). At least it seems to be the only construct creating a
&gt; &gt; graph satisfying the condition, AFAICT.
&gt; 
&gt; Well, in general you can't add work if you have a critical edge -- if an
&gt; block has multiple outgoing edges, then you can't put the work into that
&gt; block. If a block has multiple incoming edges, then you can't leave the work
&gt; in that block, so you have to create a separate block to put work that you
&gt; want done on that specific block transition.
&gt; 
&gt; However here it's looking for something much more specific.</span >

Ok, that makes sense. It might be that the original author wasn't thinking
about the problem in this terms and just wanted to fix the single problematic
case at hand, i.e. if without else. Then splitting any critical edge would be
the right solution, though in practice I don't think it'd trigger more often.</pre>
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

--1440195841.C8e8803E2.25077--

--===============1757435515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1757435515==--
