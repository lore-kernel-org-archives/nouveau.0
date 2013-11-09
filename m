From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71382] Nouveau dmesg error, computer hangs
Date: Sat, 09 Nov 2013 14:31:43 +0000
Message-ID: <bug-71382-8800-4Crx4fiGEf@http.bugs.freedesktop.org/>
References: <bug-71382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0949130400=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0949130400==
Content-Type: multipart/alternative; boundary="1384007503.66CbFb0C1.31816"; charset="us-ascii"


--1384007503.66CbFb0C1.31816
Date: Sat, 9 Nov 2013 14:31:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71382

--- Comment #6 from Martin <martin.kaffanke-RbZlAiThDcE@public.gmane.org> ---
(In reply to comment #5)
> Can you do us a favour and attach complete dmesg output :) Posting random
> snippets does not provide any context or background.

Ok, I'll try to get a new one.

> AFAIK messages like the following should be (relatively) harmless.
> nouveau E[    PBUS][0000:00:0d.0] MMIO write of 0x???????? FAULT at 0x00b???

Ok, thanks.

> * How often does this happen

Sometimes its hard to work on my computer, but the fix above seems to catch
many of the hangs, I will see that the next days.   Normally its about twice a
day.

The last time it was, when I switched on HUD for unity.  I disabled this now,
since then it works fine.  The hud gave me:

Nov  9 14:28:13 martin-desktop kernel: [ 4841.054362] traps: hud-service[2006]
trap int3 ip:7f8ce47263d9 sp:7fff1d1bcde0 error:0

I don't know if this can hang a machine...

> * How can we reproduce it

That would be great if I could find that out. :)  For me I cannot see any
systematic process behind this hangs.

Martin

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384007503.66CbFb0C1.31816
Date: Sat, 9 Nov 2013 14:31:43 +0000
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
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382">bug 71382</a>
              from <span class="vcard"><a class="email" href="mailto:martin.kaffanke&#64;gmx.at" title="Martin &lt;martin.kaffanke&#64;gmx.at&gt;"> <span class="fn">Martin</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=71382#c5">comment #5</a>)
<span class="quote">&gt; Can you do us a favour and attach complete dmesg output :) Posting random
&gt; snippets does not provide any context or background.</span >

Ok, I'll try to get a new one.

<span class="quote">&gt; AFAIK messages like the following should be (relatively) harmless.
&gt; nouveau E[    PBUS][0000:00:0d.0] MMIO write of 0x???????? FAULT at 0x00b???</span >

Ok, thanks.

<span class="quote">&gt; * How often does this happen</span >

Sometimes its hard to work on my computer, but the fix above seems to catch
many of the hangs, I will see that the next days.   Normally its about twice a
day.

The last time it was, when I switched on HUD for unity.  I disabled this now,
since then it works fine.  The hud gave me:

Nov  9 14:28:13 martin-desktop kernel: [ 4841.054362] traps: hud-service[2006]
trap int3 ip:7f8ce47263d9 sp:7fff1d1bcde0 error:0

I don't know if this can hang a machine...

<span class="quote">&gt; * How can we reproduce it</span >

That would be great if I could find that out. :)  For me I cannot see any
systematic process behind this hangs.

Martin</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1384007503.66CbFb0C1.31816--

--===============0949130400==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0949130400==--
