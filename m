From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 89679] [NV50] Portal/Half-Life 2 will not start
	(native Steam)
Date: Sat, 28 Mar 2015 03:06:37 +0000
Message-ID: <bug-89679-8800-86P8MbqLFS@http.bugs.freedesktop.org/>
References: <bug-89679-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1137916331=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-89679-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1137916331==
Content-Type: multipart/alternative; boundary="1427511997.E01Ea500.14459"; charset="UTF-8"


--1427511997.E01Ea500.14459
Date: Sat, 28 Mar 2015 03:06:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=89679

--- Comment #4 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to Nick Tenney from comment #3)
> Created attachment 114677 [details]
> Git bisection of Mesa
> 
> Third time's a charm! Finally got a successful bisection of the Portal issue.

That seems very surprising. Does reverting it on top of master fix the issue?
If not, your bisect is off.

The commit does 2 things -- it increases the query alloc space to 256 and it
enables PIPE_CAP_QUERY_PIPELINE_STATISTICS (and the relevant support in the
query logic). I have a hard time believing that steam would use
ARB_pipeline_query_statistics, but... who knows.

Can you disable PIPE_CAP_QUERY_PIPELINE_STATISTICS but leave
NV50_QUERY_ALLOC_SPACE at 256 and see if it still breaks?

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1427511997.E01Ea500.14459
Date: Sat, 28 Mar 2015 03:06:37 +0000
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
   title="NEW - [NV50] Portal/Half-Life 2 will not start (native Steam)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89679#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV50] Portal/Half-Life 2 will not start (native Steam)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=89679">bug 89679</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to Nick Tenney from <a href="show_bug.cgi?id=89679#c3">comment #3</a>)
<span class="quote">&gt; Created <span class=""><a href="attachment.cgi?id=114677" name="attach_114677" title="Git bisection of Mesa">attachment 114677</a> <a href="attachment.cgi?id=114677&amp;action=edit" title="Git bisection of Mesa">[details]</a></span>
&gt; Git bisection of Mesa
&gt; 
&gt; Third time's a charm! Finally got a successful bisection of the Portal issue.</span >

That seems very surprising. Does reverting it on top of master fix the issue?
If not, your bisect is off.

The commit does 2 things -- it increases the query alloc space to 256 and it
enables PIPE_CAP_QUERY_PIPELINE_STATISTICS (and the relevant support in the
query logic). I have a hard time believing that steam would use
ARB_pipeline_query_statistics, but... who knows.

Can you disable PIPE_CAP_QUERY_PIPELINE_STATISTICS but leave
NV50_QUERY_ALLOC_SPACE at 256 and see if it still breaks?</pre>
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

--1427511997.E01Ea500.14459--

--===============1137916331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1137916331==--
