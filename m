From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90887] PhiMovesPass in register allocator broken
Date: Fri, 21 Aug 2015 20:34:46 +0000
Message-ID: <bug-90887-8800-Mdfe9WdShR@http.bugs.freedesktop.org/>
References: <bug-90887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1168861230=="
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


--===============1168861230==
Content-Type: multipart/alternative; boundary="1440189286.7C7AbF72.31313"; charset="UTF-8"


--1440189286.7C7AbF72.31313
Date: Fri, 21 Aug 2015 20:34:46 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90887

--- Comment #30 from jr <j-r-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> ---
(In reply to Ilia Mirkin from comment #29)
> Hmmmm... maybe it was one of my local patches? I'll try to figure out what
> went wrong later tonight.
> 
> I added logic to be clever about edge types... when splitting an edge, the
> type should remain except a forward edge becomes a cross edge. (You can do
> it out on paper...) Perhaps that upset things? It doesn't seem like codegen
> is using those terms in the usual MST meanings :(

I did take a look at the edge classification. Cannot say I fully understand the
implications yet, but I'm wondering whether the logic in Graph::classifyDFS is
correct. Shouldn't the condition for FORWARD edge whenn looping over incoming
edges (the second loop) be reversed?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1440189286.7C7AbF72.31313
Date: Fri, 21 Aug 2015 20:34:46 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887#c30">Comment # 30</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - PhiMovesPass in register allocator broken"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90887">bug 90887</a>
              from <span class="vcard"><a class="email" href="mailto:j-r&#64;online.de" title="jr &lt;j-r&#64;online.de&gt;"> <span class="fn">jr</span></a>
</span></b>
        <pre>(In reply to Ilia Mirkin from <a href="show_bug.cgi?id=90887#c29">comment #29</a>)
<span class="quote">&gt; Hmmmm... maybe it was one of my local patches? I'll try to figure out what
&gt; went wrong later tonight.
&gt; 
&gt; I added logic to be clever about edge types... when splitting an edge, the
&gt; type should remain except a forward edge becomes a cross edge. (You can do
&gt; it out on paper...) Perhaps that upset things? It doesn't seem like codegen
&gt; is using those terms in the usual MST meanings :(</span >

I did take a look at the edge classification. Cannot say I fully understand the
implications yet, but I'm wondering whether the logic in Graph::classifyDFS is
correct. Shouldn't the condition for FORWARD edge whenn looping over incoming
edges (the second loop) be reversed?</pre>
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

--1440189286.7C7AbF72.31313--

--===============1168861230==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1168861230==--
