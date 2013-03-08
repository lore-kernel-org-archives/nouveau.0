From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Fri, 08 Mar 2013 16:52:58 +0000
Message-ID: <bug-61731-8800-2skAIw6MMd@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1966610922=="
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


--===============1966610922==
Content-Type: multipart/alternative; boundary="1362761578.FEAD7dF2.27245"; charset="us-ascii"


--1362761578.FEAD7dF2.27245
Date: Fri, 8 Mar 2013 16:52:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |NOTABUG

--- Comment #11 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to comment #10)
...
> /lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia/forcedeth.ko

I would personally (re)move everything _but_ the above file, with that said I'm
not a debian person

> I as long as I keep my power-plug UNPLUGGED during boot the nouveau driver
> loads as normal.
> 
> But when the power-cord is PLUGGED I get this error in xorg.0.log:
> 
> [    1.328023] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
> [    1.328497] [drm] nouveau 0000:01:00.0: unsupported chipset 0xffffffff
> [    1.330177] nouveau: probe of 0000:01:00.0 failed with error -22
> 
> What can cause this?

99.99...% hardware issue

> How can I solve this?

Repair the machine or get a new one :)
Note it may be something as simple as missing/loose ground within the laptop

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362761578.FEAD7dF2.27245
Date: Fri, 8 Mar 2013 16:52:58 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style="text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>NOTABUG
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=61731#c10">comment #10</a>)
...
<span class="quote">&gt; /lib/modules/3.5.0-25-generic/kernel/drivers/net/ethernet/nvidia/forcedeth.ko</span >

I would personally (re)move everything _but_ the above file, with that said I'm
not a debian person

<span class="quote">&gt; I as long as I keep my power-plug UNPLUGGED during boot the nouveau driver
&gt; loads as normal.
&gt; 
&gt; But when the power-cord is PLUGGED I get this error in xorg.0.log:
&gt; 
&gt; [    1.328023] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)
&gt; [    1.328497] [drm] nouveau 0000:01:00.0: unsupported chipset 0xffffffff
&gt; [    1.330177] nouveau: probe of 0000:01:00.0 failed with error -22
&gt; 
&gt; What can cause this?</span >

99.99...% hardware issue

<span class="quote">&gt; How can I solve this?</span >

Repair the machine or get a new one :)
Note it may be something as simple as missing/loose ground within the laptop</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362761578.FEAD7dF2.27245--

--===============1966610922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1966610922==--
