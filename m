From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69488] GF108 (NVC1) GPU lockup
Date: Wed, 02 Oct 2013 20:06:45 +0000
Message-ID: <bug-69488-8800-TbhWQwLisA@http.bugs.freedesktop.org/>
References: <bug-69488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0329735981=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0329735981==
Content-Type: multipart/alternative; boundary="1380744405.0ffC51.14320"; charset="us-ascii"


--1380744405.0ffC51.14320
Date: Wed, 2 Oct 2013 20:06:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69488

--- Comment #12 from Kevin N. <vekinn-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #11)
> The IORESOURCE_BUSY patch is already on its way to Linus. However, all it
> does is suppressing this warning.
> 
> Could you describe what exactly the bug is you were seeing? You said it
> falls back to "software frame buffer". The log doesn't say anything like
> this, what do you mean by that?
> Also, how did you detect a GPU lock-up?
> 
> If the warning is all you see but everything was working just fine, this bug
> can be closed. As the warning says "Your kernel is fine." this isn't serious
> at all and shouldn't cause any issues. If you saw any other weird behavior,
> please describe what exactly happened (apart from the oops message in the
> log).

My nvidia card doesn't work right with optimus and nouveau on 3.12-rc2. 
Starting X does sometimes work but the display stops responding soon after or
when I run xrandr.  Having my displayport plugged in seems to prevent that.

GPU lockup was probably poor choice in words, display stops responding is more
accurate.  I end up having to power the machine off.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1380744405.0ffC51.14320
Date: Wed, 2 Oct 2013 20:06:45 +0000
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
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488#c12">Comment # 12</a>
              on <a class="bz_bug_link 
          bz_status_REOPENED "
   title="REOPENED --- - GF108 (NVC1) GPU lockup"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69488">bug 69488</a>
              from <span class="vcard"><a class="email" href="mailto:vekinn&#64;gmail.com" title="Kevin N. &lt;vekinn&#64;gmail.com&gt;"> <span class="fn">Kevin N.</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=69488#c11">comment #11</a>)
<span class="quote">&gt; The IORESOURCE_BUSY patch is already on its way to Linus. However, all it
&gt; does is suppressing this warning.
&gt; 
&gt; Could you describe what exactly the bug is you were seeing? You said it
&gt; falls back to &quot;software frame buffer&quot;. The log doesn't say anything like
&gt; this, what do you mean by that?
&gt; Also, how did you detect a GPU lock-up?
&gt; 
&gt; If the warning is all you see but everything was working just fine, this bug
&gt; can be closed. As the warning says &quot;Your kernel is fine.&quot; this isn't serious
&gt; at all and shouldn't cause any issues. If you saw any other weird behavior,
&gt; please describe what exactly happened (apart from the oops message in the
&gt; log).</span >

My nvidia card doesn't work right with optimus and nouveau on 3.12-rc2. 
Starting X does sometimes work but the display stops responding soon after or
when I run xrandr.  Having my displayport plugged in seems to prevent that.

GPU lockup was probably poor choice in words, display stops responding is more
accurate.  I end up having to power the machine off.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1380744405.0ffC51.14320--

--===============0329735981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0329735981==--
