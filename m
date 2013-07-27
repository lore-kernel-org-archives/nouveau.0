From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sat, 27 Jul 2013 19:28:05 +0000
Message-ID: <bug-67051-8800-LNWkGsnVl6@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0988753986=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0988753986==
Content-Type: multipart/alternative; boundary="1374953285.682efA01.31504"; charset="us-ascii"


--1374953285.682efA01.31504
Date: Sat, 27 Jul 2013 19:28:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #92 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
(In reply to comment #91)
> >> Should I go ahead and compile this commit (despite debug-3 failure)
> >> and post the dmesg?
> >> Please advise.
> 
> > No. My debug patch would have to be redone for a kernel that old. Instead, please take a recent kernel and apply my debug patch to it, and boot. The other patches are actually probably not necessary either -- they just change what gets written where, whereas I'm trying to figure out a potential issue with the execution flow. You don't even have to go into X or test anything (but you can) -- I just want to see the dmesg that happens when nouveau loads with that debug patch. (But obviously make sure that your hdmi-audio-capable device is plugged in at the time.)
> 
> Please give me an exact kernel version you'd be comfortable with.
> Most likely my Linus copy is already a little old;  OTOH, I can
> easily go out and get 3.10.3 (or whatever kernel du jour there might be); 
> etc.

3.10.3 is fine. As is 3.10.1. Anything that the debug patch applies cleanly to.

> 
> For dmesg, I assume (but please confirm):
> 
> NOUVEAU_DEBUG=7
> nouveau.debug=PDISP=spam

No -- just regular boot. Reset NOUVEAU_DEBUG to its original value (4, I
think).

> 
> For patches:  only dmesg-3? or what else exactly?.

Only debug-3.

> 
> BTW:  Don't worry about X.  I ain't gonna touch it this time :)
> 
> Thanks,
> -- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374953285.682efA01.31504
Date: Sat, 27 Jul 2013 19:28:05 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c92">Comment # 92</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=67051#c91">comment #91</a>)
<span class="quote">&gt; &gt;&gt; Should I go ahead and compile this commit (despite debug-3 failure)
&gt; &gt;&gt; and post the dmesg?
&gt; &gt;&gt; Please advise.
&gt; 
&gt; &gt; No. My debug patch would have to be redone for a kernel that old. Instead, please take a recent kernel and apply my debug patch to it, and boot. The other patches are actually probably not necessary either -- they just change what gets written where, whereas I'm trying to figure out a potential issue with the execution flow. You don't even have to go into X or test anything (but you can) -- I just want to see the dmesg that happens when nouveau loads with that debug patch. (But obviously make sure that your hdmi-audio-capable device is plugged in at the time.)
&gt; 
&gt; Please give me an exact kernel version you'd be comfortable with.
&gt; Most likely my Linus copy is already a little old;  OTOH, I can
&gt; easily go out and get 3.10.3 (or whatever kernel du jour there might be); 
&gt; etc.</span >

3.10.3 is fine. As is 3.10.1. Anything that the debug patch applies cleanly to.

<span class="quote">&gt; 
&gt; For dmesg, I assume (but please confirm):
&gt; 
&gt; NOUVEAU_DEBUG=7
&gt; nouveau.debug=PDISP=spam</span >

No -- just regular boot. Reset NOUVEAU_DEBUG to its original value (4, I
think).

<span class="quote">&gt; 
&gt; For patches:  only dmesg-3? or what else exactly?.</span >

Only debug-3.

<span class="quote">&gt; 
&gt; BTW:  Don't worry about X.  I ain't gonna touch it this time :)
&gt; 
&gt; Thanks,
&gt; -- Alex</span ></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374953285.682efA01.31504--

--===============0988753986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0988753986==--
