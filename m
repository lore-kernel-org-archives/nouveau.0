From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82714] [G84] nouveau fails to properly initialize GPU
Date: Thu, 22 Oct 2015 05:14:12 +0000
Message-ID: <bug-82714-8800-mDvwYc27XV@http.bugs.freedesktop.org/>
References: <bug-82714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0050422570=="
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


--===============0050422570==
Content-Type: multipart/alternative; boundary="1445490852.dfA0BEA2.9787"; charset="UTF-8"


--1445490852.dfA0BEA2.9787
Date: Thu, 22 Oct 2015 05:14:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82714

--- Comment #20 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Bruno from comment #18)
> Created attachment 116185 [details]
> linux-4.1-rc5+
> 
> Same 4.1-rc5+ kernel but this time around performing nvapeek/nvapoke.
> 
> Doing the peek/poke makes display get signal over DVI but does not prevent
> the system from freezing after X has started.
> 
> The last lines of output from X were (the COPY failure coming some time
> after the rest):
> (--) Depth 24 pixmap format is 32 bpp
> (II) NOUVEAU(0): Channel setup complete.
> (EE) NOUVEAU(0): [COPY] failed to allocate class.

Expected. Your GPU doesn't have COPY engine.

> 
> 
> The PGRAPH/VM FLUSH timeouts look like they could have something to do with
> the freeze and be cause of X COPY failure.

Recent kernels should fix the PDISP hang error, which in turn might avoid
tickling the vm lockup. Can you test a kernel that includes 697bb728d9e (v4.2
should have it).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1445490852.dfA0BEA2.9787
Date: Thu, 22 Oct 2015 05:14:12 +0000
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
   title="NEW - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [G84] nouveau fails to properly initialize GPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82714">bug 82714</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Bruno from <a href="show_bug.cgi?id=82714#c18">comment #18</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=116185" name="attach_116185" title="linux-4.1-rc5+">attachment 116185</a> <a href="attachment.cgi?id=116185&amp;action=edit" title="linux-4.1-rc5+">[details]</a></span>
&gt; linux-4.1-rc5+
&gt; 
&gt; Same 4.1-rc5+ kernel but this time around performing nvapeek/nvapoke.
&gt; 
&gt; Doing the peek/poke makes display get signal over DVI but does not prevent
&gt; the system from freezing after X has started.
&gt; 
&gt; The last lines of output from X were (the COPY failure coming some time
&gt; after the rest):
&gt; (--) Depth 24 pixmap format is 32 bpp
&gt; (II) NOUVEAU(0): Channel setup complete.
&gt; (EE) NOUVEAU(0): [COPY] failed to allocate class.</span >

Expected. Your GPU doesn't have COPY engine.

<span class="quote">&gt; 
&gt; 
&gt; The PGRAPH/VM FLUSH timeouts look like they could have something to do with
&gt; the freeze and be cause of X COPY failure.</span >

Recent kernels should fix the PDISP hang error, which in turn might avoid
tickling the vm lockup. Can you test a kernel that includes 697bb728d9e (v4.2
should have it).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1445490852.dfA0BEA2.9787--

--===============0050422570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0050422570==--
