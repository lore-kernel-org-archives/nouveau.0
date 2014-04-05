From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Sat, 05 Apr 2014 00:19:41 +0000
Message-ID: <bug-76732-8800-bPUgAJmRQ0@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1438958187=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76732-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1438958187==
Content-Type: multipart/alternative; boundary="1396657181.5Fc0A2.3218"; charset="us-ascii"


--1396657181.5Fc0A2.3218
Date: Sat, 5 Apr 2014 00:19:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #31 from Dale Hamel <daleha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #22)
> I think I have found something.
> 
> Commenting out the following line in
> nouveau/core/core/event.c:nouveau_event_init seems to resolve the problem.
> The screen output is working but I have no idea if it is going to break
> something else.
> 
> list_add_tail(&handler->head, &event->index[index].list);

This also allows drawing for me too, at least on the console.

I cannot start Xorg server with this though, and I'm having a hard time getting
the log.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396657181.5Fc0A2.3218
Date: Sat, 5 Apr 2014 00:19:41 +0000
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
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c31">Comment # 31</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:daleha&#64;gmail.com" title="Dale Hamel &lt;daleha&#64;gmail.com&gt;"> <span class="fn">Dale Hamel</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76732#c22">comment #22</a>)
<span class="quote">&gt; I think I have found something.
&gt; 
&gt; Commenting out the following line in
&gt; nouveau/core/core/event.c:nouveau_event_init seems to resolve the problem.
&gt; The screen output is working but I have no idea if it is going to break
&gt; something else.
&gt; 
&gt; list_add_tail(&amp;handler-&gt;head, &amp;event-&gt;index[index].list);</span >

This also allows drawing for me too, at least on the console.

I cannot start Xorg server with this though, and I'm having a hard time getting
the log.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396657181.5Fc0A2.3218--

--===============1438958187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1438958187==--
