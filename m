From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76732] Kworker using 100% CPU
Date: Fri, 13 Jun 2014 00:03:39 +0000
Message-ID: <bug-76732-8800-vaE8M791EA@http.bugs.freedesktop.org/>
References: <bug-76732-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0099449887=="
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


--===============0099449887==
Content-Type: multipart/alternative; boundary="1402617819.cc710ddc4.13874"; charset="us-ascii"


--1402617819.cc710ddc4.13874
Date: Fri, 13 Jun 2014 00:03:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76732

--- Comment #48 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #47)
> A did a bit more testing, and I should say that it actually works with a
> caveat - this is only for display port monitors, thunderbolt monitors (which
> uses the same connector) don't seem to be recognized at all now, which is a
> regression.
A "thunderbolt" monitor should be no different.  When you file a bug for it,
can you attach debug logs (nouveau.debug=PDISP=trace,VBIOS=trace,I2C=trace
log_buf_len=1M) of it working before, and not working now?

Thanks!

> 
> But that's another bug, the 100% kworker thing is definitely fixed.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1402617819.cc710ddc4.13874
Date: Fri, 13 Jun 2014 00:03:39 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732#c48">Comment # 48</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - Kworker using 100% CPU"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76732">bug 76732</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76732#c47">comment #47</a>)
<span class="quote">&gt; A did a bit more testing, and I should say that it actually works with a
&gt; caveat - this is only for display port monitors, thunderbolt monitors (which
&gt; uses the same connector) don't seem to be recognized at all now, which is a
&gt; regression.</span >
A &quot;thunderbolt&quot; monitor should be no different.  When you file a bug for it,
can you attach debug logs (nouveau.debug=PDISP=trace,VBIOS=trace,I2C=trace
log_buf_len=1M) of it working before, and not working now?

Thanks!

<span class="quote">&gt; 
&gt; But that's another bug, the 100% kworker thing is definitely fixed.</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1402617819.cc710ddc4.13874--

--===============0099449887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0099449887==--
