From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64493] X server crashes when launch Savage XR
Date: Wed, 14 Aug 2013 22:54:37 +0000
Message-ID: <bug-64493-8800-XjsbBlQqfW@http.bugs.freedesktop.org/>
References: <bug-64493-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0640413619=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-64493-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0640413619==
Content-Type: multipart/alternative; boundary="1376520877.f45CdF61.8636"; charset="us-ascii"


--1376520877.f45CdF61.8636
Date: Wed, 14 Aug 2013 22:54:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64493

--- Comment #3 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #2)
> > 2. Check if the software renderer produces the same result
> > * export LIBGL_ALWAYS_SOFTWARE=1 && savage...
> Same result

If X crashes while using the swrast (i.e. when LIBGL_ALWAYS_SOFTWARE is set),
then the issue is not nouveau but mesa related.

If you're interested in getting this sorted you could track the package and
commit that caused this :) Hint - seems like the package is mesa and/or
xorg-server

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376520877.f45CdF61.8636
Date: Wed, 14 Aug 2013 22:54:37 +0000
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
   title="NEW --- - X server crashes when launch Savage XR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64493#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - X server crashes when launch Savage XR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64493">bug 64493</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=64493#c2">comment #2</a>)
<span class="quote">&gt; &gt; 2. Check if the software renderer produces the same result
&gt; &gt; * export LIBGL_ALWAYS_SOFTWARE=1 &amp;&amp; savage...
&gt; Same result</span >

If X crashes while using the swrast (i.e. when LIBGL_ALWAYS_SOFTWARE is set),
then the issue is not nouveau but mesa related.

If you're interested in getting this sorted you could track the package and
commit that caused this :) Hint - seems like the package is mesa and/or
xorg-server</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376520877.f45CdF61.8636--

--===============0640413619==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0640413619==--
