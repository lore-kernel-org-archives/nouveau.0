From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Thu, 25 Sep 2014 11:34:56 +0000
Message-ID: <bug-27501-8800-p6gQPOKBok@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2142572307=="
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


--===============2142572307==
Content-Type: multipart/alternative; boundary="1411644896.C7026CCD6.4098"; charset="us-ascii"


--1411644896.C7026CCD6.4098
Date: Thu, 25 Sep 2014 11:34:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #38 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
(In reply to comment #37)
> Hi Pierre,
> Both patches seems to work (tested 1x on 3.17.rc6). 
> 
> Xorg-x11 starts with fluxbox, messages show that 9600 is unacclerated and
> 9400 is acclerated. There is are two errors in your patch "option for
> disabling accleration for given chipset":
> * The entries DRM_DEBUG_DRIVER are not available on 3.17.rc6, but it works
> either way.
> * In the kernel < 3.17 it should be "if (nouveau_noaccel ||
> !nouveau_fifo(device) /*XXX*/)" not only "if (nouveau_noaccel)"
> 
> Terminating xorg-x11 crashed, probably because I switched off discrete
> graphichs adapter after starting xorg. Someone else should check.
> 
> Further testing is in queue.
> 
> The previous patch you have sent: It solved a problem I had in the past:
> System kernel panics if the lid is closed during startup!
> 
> Thanks.
> 
> Do you think that acceleration for 9600M will be possible sometime?
> 
> BR.
> 
> (In reply to comment #36)
> > This is the minimalistic version of the previous patch.

Hi Joanand,

I based my patches on the linux-3.18 branch of Nouveau's repo, which is more
up-to-date than 3.17-rc6: this explains the "if (nouveau_noaccel)" at least.

Great for the kernel panic! I noticed that using the patches, screen resumes
correctly when resuming the computer, rather than staying completely black.

Well, I'll work 9600M Gt acceleration, but I can't say if I'll succeed, nor
when. ;)

Best regards

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411644896.C7026CCD6.4098
Date: Thu, 25 Sep 2014 11:34:56 +0000
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
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c38">Comment # 38</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=27501#c37">comment #37</a>)
<span class="quote">&gt; Hi Pierre,
&gt; Both patches seems to work (tested 1x on 3.17.rc6). 
&gt; 
&gt; Xorg-x11 starts with fluxbox, messages show that 9600 is unacclerated and
&gt; 9400 is acclerated. There is are two errors in your patch &quot;option for
&gt; disabling accleration for given chipset&quot;:
&gt; * The entries DRM_DEBUG_DRIVER are not available on 3.17.rc6, but it works
&gt; either way.
&gt; * In the kernel &lt; 3.17 it should be &quot;if (nouveau_noaccel ||
&gt; !nouveau_fifo(device) /*XXX*/)&quot; not only &quot;if (nouveau_noaccel)&quot;
&gt; 
&gt; Terminating xorg-x11 crashed, probably because I switched off discrete
&gt; graphichs adapter after starting xorg. Someone else should check.
&gt; 
&gt; Further testing is in queue.
&gt; 
&gt; The previous patch you have sent: It solved a problem I had in the past:
&gt; System kernel panics if the lid is closed during startup!
&gt; 
&gt; Thanks.
&gt; 
&gt; Do you think that acceleration for 9600M will be possible sometime?
&gt; 
&gt; BR.
&gt; 
&gt; (In reply to <a href="show_bug.cgi?id=27501#c36">comment #36</a>)
&gt; &gt; This is the minimalistic version of the previous patch.</span >

Hi Joanand,

I based my patches on the linux-3.18 branch of Nouveau's repo, which is more
up-to-date than 3.17-rc6: this explains the &quot;if (nouveau_noaccel)&quot; at least.

Great for the kernel panic! I noticed that using the patches, screen resumes
correctly when resuming the computer, rather than staying completely black.

Well, I'll work 9600M Gt acceleration, but I can't say if I'll succeed, nor
when. ;)

Best regards</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411644896.C7026CCD6.4098--

--===============2142572307==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2142572307==--
