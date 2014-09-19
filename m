From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83992] [NVE0][NVF1] regression,
	linux 3.17 causes gpu lockups
Date: Fri, 19 Sep 2014 17:43:32 +0000
Message-ID: <bug-83992-8800-Og09L8sE6p@http.bugs.freedesktop.org/>
References: <bug-83992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0648777777=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0648777777==
Content-Type: multipart/alternative; boundary="1411148611.42ed71.11810"; charset="us-ascii"


--1411148611.42ed71.11810
Date: Fri, 19 Sep 2014 17:43:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83992

--- Comment #5 from Tom Englund <tomenglund26-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #4)
> What's the last commit where everything works properly?  We should start
> from there.
> 
> You mention you still get X lockups even after reverting f331a?

yea that is the weird thing reverting those 3 commits it still lockups but
going cleanly to its parent it only artifacts, after some bisecting the first
bad commit with artifacts is 694c6caf92615828dbfd3fc30e937c8f54d2ac93 , so the
first commit where everything works is ac9738bb3e5374495908ad236285f69cfd405f8e

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411148611.42ed71.11810
Date: Fri, 19 Sep 2014 17:43:31 +0000
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
   title="NEW --- - [NVE0][NVF1] regression, linux 3.17 causes gpu lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83992#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE0][NVF1] regression, linux 3.17 causes gpu lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83992">bug 83992</a>
              from <span class="vcard"><a class="email" href="mailto:tomenglund26&#64;gmail.com" title="Tom Englund &lt;tomenglund26&#64;gmail.com&gt;"> <span class="fn">Tom Englund</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=83992#c4">comment #4</a>)
<span class="quote">&gt; What's the last commit where everything works properly?  We should start
&gt; from there.
&gt; 
&gt; You mention you still get X lockups even after reverting f331a?</span >

yea that is the weird thing reverting those 3 commits it still lockups but
going cleanly to its parent it only artifacts, after some bisecting the first
bad commit with artifacts is 694c6caf92615828dbfd3fc30e937c8f54d2ac93 , so the
first commit where everything works is ac9738bb3e5374495908ad236285f69cfd405f8e</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411148611.42ed71.11810--

--===============0648777777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0648777777==--
