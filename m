From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Wed, 17 Apr 2013 16:12:07 +0000
Message-ID: <bug-61731-8800-byaIvze73K@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0249952094=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61731-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0249952094==
Content-Type: multipart/alternative; boundary="1366215127.bab70512.12880"; charset="us-ascii"


--1366215127.bab70512.12880
Date: Wed, 17 Apr 2013 16:12:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

--- Comment #13 from garuax <garua.info-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ronald,
I've the same problem. I've a Sony Vaio fz21m with 8400m gt Gpu. Now I tried
Ubuntu 13.04 32bit. 
I had just displaced my Gpu beacause of high temperature (Sony warranty).

I confirm you that when I start my system without power plugin inserted I can
have a funcionally nouveau driver. When the power plugin is inserted I observe
randomness: sometime start Vesa driver, sometime correctly nouveau driver.

I also had observed nvidia problems (randomness start as well as nouveau).

How did you solve this problem?
I also read that the problem depend of xorg version and that it doesn't exist
with Ubuntu 12.04-01 64bit.
Thanks!
Bye!

Garuax


(In reply to comment #12)
> (In reply to comment #11)
> >
> > 99.99...% hardware issue
> >
> 
> That could well be, the issues kind of started around the time when I
> doubled the memory AND had my motherboard replaced due to the over-heating
> nvidia-card-problem.
> 
> Thanks for all the effort. Is there anything I can help your team with?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1366215127.bab70512.12880
Date: Wed, 17 Apr 2013 16:12:07 +0000
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
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_UNCONFIRMED "
   title="UNCONFIRMED --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:garua.info&#64;gmail.com" title="garuax &lt;garua.info&#64;gmail.com&gt;"> <span class="fn">garuax</span></a>
</span></b>
        <pre>Hi Ronald,
I've the same problem. I've a Sony Vaio fz21m with 8400m gt Gpu. Now I tried
Ubuntu 13.04 32bit. 
I had just displaced my Gpu beacause of high temperature (Sony warranty).

I confirm you that when I start my system without power plugin inserted I can
have a funcionally nouveau driver. When the power plugin is inserted I observe
randomness: sometime start Vesa driver, sometime correctly nouveau driver.

I also had observed nvidia problems (randomness start as well as nouveau).

How did you solve this problem?
I also read that the problem depend of xorg version and that it doesn't exist
with Ubuntu 12.04-01 64bit.
Thanks!
Bye!

Garuax


(In reply to <a href="show_bug.cgi?id=61731#c12">comment #12</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=61731#c11">comment #11</a>)
&gt; &gt;
&gt; &gt; 99.99...% hardware issue
&gt; &gt;
&gt; 
&gt; That could well be, the issues kind of started around the time when I
&gt; doubled the memory AND had my motherboard replaced due to the over-heating
&gt; nvidia-card-problem.
&gt; 
&gt; Thanks for all the effort. Is there anything I can help your team with?</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1366215127.bab70512.12880--

--===============0249952094==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0249952094==--
