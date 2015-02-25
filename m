From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Wed, 25 Feb 2015 16:34:05 +0000
Message-ID: <bug-61731-8800-QZGET9QrNN@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1545072437=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61731-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1545072437==
Content-Type: multipart/alternative; boundary="1424882045.df26A7Ee2.7003"; charset="UTF-8"


--1424882045.df26A7Ee2.7003
Date: Wed, 25 Feb 2015 16:34:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

--- Comment #16 from Kyle Auble <kyle.auble-ytc+IHgoah0@public.gmane.org> ---
(In reply to Tobias Klausmann from comment #15)
> Is this still a problem with a recent kernel? (3.17/3.18)

I was actually trying to debug this driver-loading problem on & off for a
while, and while I won't be running any more tests, I'd still like to see it
resolved, if only for a sense of closure.

The last test I ran was with v3.17-rc2 of the PAE kernel on Ubuntu 12.04, and
the problem was still there at that point in time. I can't vouch for more
recent changes though. One thing I eventually found out is that there's an even
simpler workaround than unplugging the laptop during boot: try passing the
"pci=bios" boot parameter to the kernel.

I was keeping track of the tests at a Launchpad account, and I eventually sent
a couple emails to the linux-pci mail list. You can tell I'm an amateur at
systems debugging, especially in the beginning, but all those records are here:
https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1009312
http://thread.gmane.org/gmane.linux.kernel.pci/33181
http://thread.gmane.org/gmane.linux.kernel.pci/34437

As for what causes it, I made several guesses that all eventually turned out
wrong. It's just one more guess, but based on everything I figured out through
the tests, I think there's some kind of race happening in or between the kernel
& the BIOS pci initialization code. The earliest symptom in the logs is that
there will be a ~30 ms gap between these two lines in dmesg (from the original
reporter's in this thread):
> [    0.379459] pci 0000:01:00.0: reg 30: [mem 0x00000000-0x0001ffff pref]
> [    0.408041] pci 0000:00:01.0: PCI bridge to [bus 01-01]

I think that's due to a timeout in pci link-retraining, but using an initscript
to dump the GPU's pci config, I was able to find out that something is
accidentally resetting or turning off the GPU prior to that. A race condition
in the pci initialization might explain why the bug is intermittent and also
why it's much more common in the x32 kernel (the smaller word length leading to
more machine instructions something could wedge between?) I think the
unplugging trick works by putting the PCI bus into a power-saving mode, which
slows down the initialization enough to avoid a race.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424882045.df26A7Ee2.7003
Date: Wed, 25 Feb 2015 16:34:05 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:kyle.auble&#64;zoho.com" title="Kyle Auble &lt;kyle.auble&#64;zoho.com&gt;"> <span class="fn">Kyle Auble</span></a>
</span></b>
        <pre>(In reply to Tobias Klausmann from <a href="show_bug.cgi?id=61731#c15">comment #15</a>)
<span class="quote">&gt; Is this still a problem with a recent kernel? (3.17/3.18)</span >

I was actually trying to debug this driver-loading problem on &amp; off for a
while, and while I won't be running any more tests, I'd still like to see it
resolved, if only for a sense of closure.

The last test I ran was with v3.17-rc2 of the PAE kernel on Ubuntu 12.04, and
the problem was still there at that point in time. I can't vouch for more
recent changes though. One thing I eventually found out is that there's an even
simpler workaround than unplugging the laptop during boot: try passing the
&quot;pci=bios&quot; boot parameter to the kernel.

I was keeping track of the tests at a Launchpad account, and I eventually sent
a couple emails to the linux-pci mail list. You can tell I'm an amateur at
systems debugging, especially in the beginning, but all those records are here:
<a href="https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1009312">https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1009312</a>
<a href="http://thread.gmane.org/gmane.linux.kernel.pci/33181">http://thread.gmane.org/gmane.linux.kernel.pci/33181</a>
<a href="http://thread.gmane.org/gmane.linux.kernel.pci/34437">http://thread.gmane.org/gmane.linux.kernel.pci/34437</a>

As for what causes it, I made several guesses that all eventually turned out
wrong. It's just one more guess, but based on everything I figured out through
the tests, I think there's some kind of race happening in or between the kernel
&amp; the BIOS pci initialization code. The earliest symptom in the logs is that
there will be a ~30 ms gap between these two lines in dmesg (from the original
reporter's in this thread):
<span class="quote">&gt; [    0.379459] pci 0000:01:00.0: reg 30: [mem 0x00000000-0x0001ffff pref]
&gt; [    0.408041] pci 0000:00:01.0: PCI bridge to [bus 01-01]</span >

I think that's due to a timeout in pci link-retraining, but using an initscript
to dump the GPU's pci config, I was able to find out that something is
accidentally resetting or turning off the GPU prior to that. A race condition
in the pci initialization might explain why the bug is intermittent and also
why it's much more common in the x32 kernel (the smaller word length leading to
more machine instructions something could wedge between?) I think the
unplugging trick works by putting the PCI bus into a power-saving mode, which
slows down the initialization enough to avoid a race.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424882045.df26A7Ee2.7003--

--===============1545072437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1545072437==--
