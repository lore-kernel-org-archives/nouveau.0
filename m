From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 68488] [NV86] Lockup and reboot on T61 with nouveau
	driver/exa
Date: Sat, 24 Aug 2013 11:09:39 +0000
Message-ID: <bug-68488-8800-EMgRrgKQYo@http.bugs.freedesktop.org/>
References: <bug-68488-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0485881487=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-68488-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0485881487==
Content-Type: multipart/alternative; boundary="1377342579.DE8d2.3039"; charset="us-ascii"


--1377342579.DE8d2.3039
Date: Sat, 24 Aug 2013 11:09:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=68488

--- Comment #2 from Andre Klapper <a9016009-Mmb7MZpHnFY@public.gmane.org> ---
Created attachment 84554
  --> https://bugs.freedesktop.org/attachment.cgi?id=84554&action=edit
journalctl -f _TRANSPORT=kernel

(In reply to comment #1)
> Can you reproduce this at will? 

There are no clear steps to reproduce, but it happens often enough (at least
every second day, sometimes several times a day).

> If it started happening recently, was there some sort of upgrade that took place?

I made a fresh install of Fedora 19 on this machine a month ago. I *think* the
problem did not happen in the first one or two weeks, but that's not enough
time to come up with any theories. :)

> I think seeing a kernel log would be instructional. 

I had three reboots yesterday evening within 30 minutes (around 22:09:00,
22:18:00, 22:30:00).  The attached "journalctl -f _TRANSPORT=kernel" output
includes two full reboot cycles.
I'll also attach "journalctl --since=yesterday -f _TRANSPORT=kernel -p err" to
ease finding critical stuff.

If journalctl is not the way to go, please link to instructions. I was looking
at https://fedoraproject.org/wiki/How_to_debug_Xorg_problems for my initial
comment.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377342579.DE8d2.3039
Date: Sat, 24 Aug 2013 11:09:39 +0000
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
   title="NEW --- - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV86] Lockup and reboot on T61 with nouveau driver/exa"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=68488">bug 68488</a>
              from <span class="vcard"><a class="email" href="mailto:a9016009&#64;gmx.de" title="Andre Klapper &lt;a9016009&#64;gmx.de&gt;"> <span class="fn">Andre Klapper</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=84554" name="attach_84554" title="journalctl -f _TRANSPORT=kernel">attachment 84554</a> <a href="attachment.cgi?id=84554&amp;action=edit" title="journalctl -f _TRANSPORT=kernel">[details]</a></span>
journalctl -f _TRANSPORT=kernel

(In reply to <a href="show_bug.cgi?id=68488#c1">comment #1</a>)
<span class="quote">&gt; Can you reproduce this at will? </span >

There are no clear steps to reproduce, but it happens often enough (at least
every second day, sometimes several times a day).

<span class="quote">&gt; If it started happening recently, was there some sort of upgrade that took place?</span >

I made a fresh install of Fedora 19 on this machine a month ago. I *think* the
problem did not happen in the first one or two weeks, but that's not enough
time to come up with any theories. :)

<span class="quote">&gt; I think seeing a kernel log would be instructional. </span >

I had three reboots yesterday evening within 30 minutes (around 22:09:00,
22:18:00, 22:30:00).  The attached &quot;journalctl -f _TRANSPORT=kernel&quot; output
includes two full reboot cycles.
I'll also attach &quot;journalctl --since=yesterday -f _TRANSPORT=kernel -p err&quot; to
ease finding critical stuff.

If journalctl is not the way to go, please link to instructions. I was looking
at <a href="https://fedoraproject.org/wiki/How_to_debug_Xorg_problems">https://fedoraproject.org/wiki/How_to_debug_Xorg_problems</a> for my initial
comment.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377342579.DE8d2.3039--

--===============0485881487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0485881487==--
