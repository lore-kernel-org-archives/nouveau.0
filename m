From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74164] [NV04] Native monitor resolution missing
Date: Fri, 31 Jan 2014 08:20:59 +0000
Message-ID: <bug-74164-8800-7uifH3XO3o@http.bugs.freedesktop.org/>
References: <bug-74164-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1207450456=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74164-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1207450456==
Content-Type: multipart/alternative; boundary="1391156459.C4F3cC821.4581"; charset="us-ascii"


--1391156459.C4F3cC821.4581
Date: Fri, 31 Jan 2014 08:20:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74164

--- Comment #15 from Mauro Molinari <mauromol-IWqWACnzNjyonA0d6jMUrA@public.gmane.org> ---
(In reply to comment #14)
> Try to follow the code and see where things go wrong. Boot with
> nouveau.debug=trace perhaps someone left some interesting nv_debug/nv_trace
> statements somewhere. Also throw in drm.debug=0xe for good measure -- a lot
> of the pre-nv50 code still relies on that being set to emit debug statements.

So, tell me if I understood it correctly. I must add two boot parameters
(nouveau.debug=trace and drm.debug=0xe) by changing my GRUB configuration.
Then, I reboot and look at the logs (dmesg, I suppose? Or maybe also
Xorg.0.log?). Then I give a look to the nouveau source code to see if I find
some suspect. Am I right?
Please note, however, that I'm a Java developer and I know nothing about Linux
programming. So I don't think I will be able to understand too much from the
nouveau source code :-P

> Unfortunately this is getting well outside of my knowledge area. But I think
> that VBE is something emulated by the card, and perhaps part of VESA. (int
> 10h is unlikely to be involved directly though, as the system has by then
> gone into 32-bit protected mode, and overwritten the IDT. int 10h and all
> the BIOS service interrupts can really only work in 16-bit real mode.)
> nouveau tries to use the "real" interfaces to access the data, and probably
> gets it a little wrong in your case. I do know for sure that my TNT2 was
> able to work with my 1920x1200 monitor without issue (at least not relating
> to detection).

So, put in other words: could it be useful to look at the monitor-get-edid
source code to try to understand why it is working while nouveau is not?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391156459.C4F3cC821.4581
Date: Fri, 31 Jan 2014 08:20:59 +0000
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
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV04] Native monitor resolution missing"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74164">bug 74164</a>
              from <span class="vcard"><a class="email" href="mailto:mauromol&#64;tiscali.it" title="Mauro Molinari &lt;mauromol&#64;tiscali.it&gt;"> <span class="fn">Mauro Molinari</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=74164#c14">comment #14</a>)
<span class="quote">&gt; Try to follow the code and see where things go wrong. Boot with
&gt; nouveau.debug=trace perhaps someone left some interesting nv_debug/nv_trace
&gt; statements somewhere. Also throw in drm.debug=0xe for good measure -- a lot
&gt; of the pre-nv50 code still relies on that being set to emit debug statements.</span >

So, tell me if I understood it correctly. I must add two boot parameters
(nouveau.debug=trace and drm.debug=0xe) by changing my GRUB configuration.
Then, I reboot and look at the logs (dmesg, I suppose? Or maybe also
Xorg.0.log?). Then I give a look to the nouveau source code to see if I find
some suspect. Am I right?
Please note, however, that I'm a Java developer and I know nothing about Linux
programming. So I don't think I will be able to understand too much from the
nouveau source code :-P

<span class="quote">&gt; Unfortunately this is getting well outside of my knowledge area. But I think
&gt; that VBE is something emulated by the card, and perhaps part of VESA. (int
&gt; 10h is unlikely to be involved directly though, as the system has by then
&gt; gone into 32-bit protected mode, and overwritten the IDT. int 10h and all
&gt; the BIOS service interrupts can really only work in 16-bit real mode.)
&gt; nouveau tries to use the &quot;real&quot; interfaces to access the data, and probably
&gt; gets it a little wrong in your case. I do know for sure that my TNT2 was
&gt; able to work with my 1920x1200 monitor without issue (at least not relating
&gt; to detection).</span >

So, put in other words: could it be useful to look at the monitor-get-edid
source code to try to understand why it is working while nouveau is not?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391156459.C4F3cC821.4581--

--===============1207450456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1207450456==--
