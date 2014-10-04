From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Sat, 04 Oct 2014 08:55:01 +0000
Message-ID: <bug-27501-8800-ZgAydvViiy@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0666355634=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27501-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0666355634==
Content-Type: multipart/alternative; boundary="1412412901.6Aeb7a6.6467"; charset="UTF-8"


--1412412901.6Aeb7a6.6467
Date: Sat, 4 Oct 2014 08:55:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #47 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to thomas from comment #46)
> (In reply to thomas from comment #45)
> > (In reply to Pierre Moreau from comment #44)
> > > When using the 9600M GT without acceleration, do you have screen corruption
> > > in VT each time? If so, could you try to modify the patch a bit, like:
> > > - removing the write to 0x100c1c;
> > > - if removing the write doesn't work, changing the offset applied to
> > > priv->r100c08 maybe testing all 4-multiples should do it, from 0 to 28.
> > 
> > I've only tested the 9600 about 10 times, but I've always had corruption. I
> > will try your changes and see if it makes a difference.
> 
> No change, unfortunately. I first removed the write, then tried each of the
> offsets.

After switching to "Higher Performances" in OS X, I understand what you were
explaining to me about having both cards enabled but having corrupted screen
only in one case. With that in mind, tweaking the patch can't fix the
corruption as we are modifying things on the 9400M but it's the 9600M GT which
is responsible for displaying; I suggest opening another bug report for that.

I'll continue working on this patch and find how to use 0x100c1c before
switching to the 9600M GT.

Some side notes about what is wrong with the 9600M GT:
- screen corruption when using it to drive the display
- interrupt 0x04000000 + lockup when starting X with acceleration on for 9400M
and 9600M GT, and the 9400M is driving the screen
- when powering it down using vgaswitcheroo:
  * if accel isn't enabled:
    E[   PDISP][0000:02:00.0][0xc000887d][ffff880137b94400] fini: 0x490e0008
    E[   PDISP][0000:02:00.0][0xc000887d][ffff880137b94400] failed suspend, -16
  * if accel is enabled:
    flush timeout + (interrupt 0x04000000 iirc) + lockup

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412412901.6Aeb7a6.6467
Date: Sat, 4 Oct 2014 08:55:01 +0000
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
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c47">Comment # 47</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to thomas from <a href="show_bug.cgi?id=27501#c46">comment #46</a>)
<span class="quote">&gt; (In reply to thomas from <a href="show_bug.cgi?id=27501#c45">comment #45</a>)
&gt; &gt; (In reply to Pierre Moreau from <a href="show_bug.cgi?id=27501#c44">comment #44</a>)
&gt; &gt; &gt; When using the 9600M GT without acceleration, do you have screen corruption
&gt; &gt; &gt; in VT each time? If so, could you try to modify the patch a bit, like:
&gt; &gt; &gt; - removing the write to 0x100c1c;
&gt; &gt; &gt; - if removing the write doesn't work, changing the offset applied to
&gt; &gt; &gt; priv-&gt;r100c08 maybe testing all 4-multiples should do it, from 0 to 28.
&gt; &gt; 
&gt; &gt; I've only tested the 9600 about 10 times, but I've always had corruption. I
&gt; &gt; will try your changes and see if it makes a difference.
&gt; 
&gt; No change, unfortunately. I first removed the write, then tried each of the
&gt; offsets.</span >

After switching to &quot;Higher Performances&quot; in OS X, I understand what you were
explaining to me about having both cards enabled but having corrupted screen
only in one case. With that in mind, tweaking the patch can't fix the
corruption as we are modifying things on the 9400M but it's the 9600M GT which
is responsible for displaying; I suggest opening another bug report for that.

I'll continue working on this patch and find how to use 0x100c1c before
switching to the 9600M GT.

Some side notes about what is wrong with the 9600M GT:
- screen corruption when using it to drive the display
- interrupt 0x04000000 + lockup when starting X with acceleration on for 9400M
and 9600M GT, and the 9400M is driving the screen
- when powering it down using vgaswitcheroo:
  * if accel isn't enabled:
    E[   PDISP][0000:02:00.0][0xc000887d][ffff880137b94400] fini: 0x490e0008
    E[   PDISP][0000:02:00.0][0xc000887d][ffff880137b94400] failed suspend, -16
  * if accel is enabled:
    flush timeout + (interrupt 0x04000000 iirc) + lockup</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412412901.6Aeb7a6.6467--

--===============0666355634==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0666355634==--
