From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76483] [NV50, bisected,
 RFC patch] xset dpms force {on, off} does not work over DP
Date: Tue, 01 Jul 2014 21:39:16 +0000
Message-ID: <bug-76483-8800-K4YJS8Vds5@http.bugs.freedesktop.org/>
References: <bug-76483-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0630221116=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76483-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0630221116==
Content-Type: multipart/alternative; boundary="1404250756.DfC06B74.32060"; charset="us-ascii"


--1404250756.DfC06B74.32060
Date: Tue, 1 Jul 2014 21:39:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76483

--- Comment #26 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #25)
> That fixed the garbled display.
> 
> The monitor off/on thing is weird.  When I was trying to get 3.14 to work
> (before discovering this bug report), I tried the nvidia binary driver and
> got the same flash off/on thing.  However, dpms-off was working in 3.6.3,
> which I unfortunately don't have lying around any more.  It seems strange
> that the monitor would break in this manner, so I guess the 3.6.x driver was
> doing something to work around the monitor's response.  (Also, the
> monitor-off screensaver works when I am in OS/X.)
If it's the same situation as Nouveau, then the binary driver probably ignored
the HPD_IRQ pulse from the monitor.  We need to care about it now (well, we
were *supposed* to already, but anyway) for MST support particularly.  I'm
pretty sure I can work around the issue in the driver if we need to, so that's
ok.

> 
> I can get a log to verify if you like, later today.  If there's anything I
> can get from 3.6 to see if it's doing something different, let me know;  I'm
> sure I can find and build a 3.6 sometime in the next day or two if necessary.
That'd be great, thanks.

> 
> At least it's going in the right direction - thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1404250756.DfC06B74.32060
Date: Tue, 1 Jul 2014 21:39:16 +0000
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
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV50, bisected, RFC patch] xset dpms force {on,off} does not work over DP"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76483">bug 76483</a>
              from <span class="vcard"><a class="email" href="mailto:skeggsb&#64;gmail.com" title="Ben Skeggs &lt;skeggsb&#64;gmail.com&gt;"> <span class="fn">Ben Skeggs</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=76483#c25">comment #25</a>)
<span class="quote">&gt; That fixed the garbled display.
&gt; 
&gt; The monitor off/on thing is weird.  When I was trying to get 3.14 to work
&gt; (before discovering this bug report), I tried the nvidia binary driver and
&gt; got the same flash off/on thing.  However, dpms-off was working in 3.6.3,
&gt; which I unfortunately don't have lying around any more.  It seems strange
&gt; that the monitor would break in this manner, so I guess the 3.6.x driver was
&gt; doing something to work around the monitor's response.  (Also, the
&gt; monitor-off screensaver works when I am in OS/X.)</span >
If it's the same situation as Nouveau, then the binary driver probably ignored
the HPD_IRQ pulse from the monitor.  We need to care about it now (well, we
were *supposed* to already, but anyway) for MST support particularly.  I'm
pretty sure I can work around the issue in the driver if we need to, so that's
ok.

<span class="quote">&gt; 
&gt; I can get a log to verify if you like, later today.  If there's anything I
&gt; can get from 3.6 to see if it's doing something different, let me know;  I'm
&gt; sure I can find and build a 3.6 sometime in the next day or two if necessary.</span >
That'd be great, thanks.

<span class="quote">&gt; 
&gt; At least it's going in the right direction - thanks!</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1404250756.DfC06B74.32060--

--===============0630221116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0630221116==--
