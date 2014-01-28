From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69029] [NVA8] GPU lockup since kernel 3.11 upgrade
Date: Tue, 28 Jan 2014 09:21:52 +0000
Message-ID: <bug-69029-8800-xpcciMfvo8@http.bugs.freedesktop.org/>
References: <bug-69029-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0728798765=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69029-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0728798765==
Content-Type: multipart/alternative; boundary="1390900912.CDF6f2B2.20535"; charset="us-ascii"


--1390900912.CDF6f2B2.20535
Date: Tue, 28 Jan 2014 09:21:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69029

--- Comment #11 from Frederic Crozat <fred-ku13qjcBzYesTnJN9+BGXg@public.gmane.org> ---
(In reply to comment #10)
> Frederic: Do I understand correctly that everything is consistently fine in
> 3.10.x and consistently broken in 3.11.x? If so, could you try doing a
> bisect to identify the offending commit? (First might be worth checking if
> the issue still occurs in 3.13 btw.) BTW, your third "lockup" log doesn't
> indicate that anything really went wrong -- just a kmalloc() failure which
> should be handled by the surrounding code. Although the later xfs corruption
> errors are a bit ominous... 

With 3.11.6, I get very few lockups (if any), which is making bisection
irrelevant/impossible to do.

the xfs corruption was caused by running mkinitrd which was trying to load xfs
module even if there is no xfs partitions anywhere (this is now fixed).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1390900912.CDF6f2B2.20535
Date: Tue, 28 Jan 2014 09:21:52 +0000
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
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69029#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8] GPU lockup since kernel 3.11 upgrade"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69029">bug 69029</a>
              from <span class="vcard"><a class="email" href="mailto:fred&#64;crozat.net" title="Frederic Crozat &lt;fred&#64;crozat.net&gt;"> <span class="fn">Frederic Crozat</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69029#c10">comment #10</a>)
<span class="quote">&gt; Frederic: Do I understand correctly that everything is consistently fine in
&gt; 3.10.x and consistently broken in 3.11.x? If so, could you try doing a
&gt; bisect to identify the offending commit? (First might be worth checking if
&gt; the issue still occurs in 3.13 btw.) BTW, your third &quot;lockup&quot; log doesn't
&gt; indicate that anything really went wrong -- just a kmalloc() failure which
&gt; should be handled by the surrounding code. Although the later xfs corruption
&gt; errors are a bit ominous... </span >

With 3.11.6, I get very few lockups (if any), which is making bisection
irrelevant/impossible to do.

the xfs corruption was caused by running mkinitrd which was trying to load xfs
module even if there is no xfs partitions anywhere (this is now fixed).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1390900912.CDF6f2B2.20535--

--===============0728798765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0728798765==--
