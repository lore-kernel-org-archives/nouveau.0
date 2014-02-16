From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 75013] [NVC1] [Quadro 600] Display update issues,
 stale rendered content
Date: Sun, 16 Feb 2014 06:20:47 +0000
Message-ID: <bug-75013-8800-AnWUSdLt3y@http.bugs.freedesktop.org/>
References: <bug-75013-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1626335391=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-75013-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1626335391==
Content-Type: multipart/alternative; boundary="1392531647.ABbaE5c1.23061"; charset="us-ascii"


--1392531647.ABbaE5c1.23061
Date: Sun, 16 Feb 2014 06:20:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=75013

--- Comment #6 from Sudarshan <spartha80-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #5)
> (In reply to comment #4)
> > (In reply to comment #1)
> > > I see that you're using displayport. Is it an actual DP monitor, or are you
> > > using a DP->xyz adapter?
> > > 
> > > I recently posted a patch that should fix computing number of lanes/lane
> > > speeds for DP on pre-nvd0 cards:
> > > http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html
> > > 
> > > Can you see if that helps you? Should apply to any 3.9+ kernel.
> > 
> > I tried the patch but no luck :(
> 
> Yeah, if you're not using the DP port, I wouldn't expect it to. In
> hindsight, I realized that I misread your log -- you're using the DVI-I-1
> connector, not DP-1.
> 
> Unfortunately I don't have any great ideas atm... could you try to upgrade
> to the latest kernel and see if things have magically resolved themselves?
> 
> Assuming that they haven't, can you attach a boot log with
> 
> nouveau.config=PDISP=debug,VBIOS=trace drm.debug=0xe
> 
> from the latest kernel? Perhaps it'll yield some interesting info.

I will try that. One observatino is that the issue is not seen with Live CD. Is
there a difference between the installed OS and the live CD? This surprised me,
as I was expecting a smooth sail...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1392531647.ABbaE5c1.23061
Date: Sun, 16 Feb 2014 06:20:47 +0000
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
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVC1] [Quadro 600] Display update issues, stale rendered content"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=75013">bug 75013</a>
              from <span class="vcard"><a class="email" href="mailto:spartha80&#64;gmail.com" title="Sudarshan &lt;spartha80&#64;gmail.com&gt;"> <span class="fn">Sudarshan</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=75013#c5">comment #5</a>)
<span class="quote">&gt; (In reply to <a href="show_bug.cgi?id=75013#c4">comment #4</a>)
&gt; &gt; (In reply to <a href="show_bug.cgi?id=75013#c1">comment #1</a>)
&gt; &gt; &gt; I see that you're using displayport. Is it an actual DP monitor, or are you
&gt; &gt; &gt; using a DP-&gt;xyz adapter?
&gt; &gt; &gt; 
&gt; &gt; &gt; I recently posted a patch that should fix computing number of lanes/lane
&gt; &gt; &gt; speeds for DP on pre-nvd0 cards:
&gt; &gt; &gt; <a href="http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html">http://lists.freedesktop.org/archives/nouveau/2014-February/016205.html</a>
&gt; &gt; &gt; 
&gt; &gt; &gt; Can you see if that helps you? Should apply to any 3.9+ kernel.
&gt; &gt; 
&gt; &gt; I tried the patch but no luck :(
&gt; 
&gt; Yeah, if you're not using the DP port, I wouldn't expect it to. In
&gt; hindsight, I realized that I misread your log -- you're using the DVI-I-1
&gt; connector, not DP-1.
&gt; 
&gt; Unfortunately I don't have any great ideas atm... could you try to upgrade
&gt; to the latest kernel and see if things have magically resolved themselves?
&gt; 
&gt; Assuming that they haven't, can you attach a boot log with
&gt; 
&gt; nouveau.config=PDISP=debug,VBIOS=trace drm.debug=0xe
&gt; 
&gt; from the latest kernel? Perhaps it'll yield some interesting info.</span >

I will try that. One observatino is that the issue is not seen with Live CD. Is
there a difference between the installed OS and the live CD? This surprised me,
as I was expecting a smooth sail...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1392531647.ABbaE5c1.23061--

--===============1626335391==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1626335391==--
