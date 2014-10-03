From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Fri, 03 Oct 2014 21:01:17 +0000
Message-ID: <bug-27501-8800-b7iWjwMj2K@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1183101105=="
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


--===============1183101105==
Content-Type: multipart/alternative; boundary="1412370078.46aF66.14235"; charset="UTF-8"


--1412370078.46aF66.14235
Date: Fri, 3 Oct 2014 21:01:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #45 from thomas <gurutonic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(In reply to Pierre Moreau from comment #44)
> 
> Hi Thomas,
> 
> Good to hear you can use gnome-shell! :)
> 
> By
> > I haven't had any screen corruption with the 9400M.
> do you mean with the 9600M GT completely disabled?
> 

I use the efi stub loader with refind bootloader. Refind doesn't have an option
to use outb as in grub. I have set OSX preferences to "battery saving", so that
the firmware sets up the 9400 initially, but the 9600 is still technically
enabled. It shows up in lspci, etc. Whenever I test the 9600, I change the
setting in OSX back to "performance". So yes, with both cards enabled, the 9400
works without corruption.

> When using the 9600M GT without acceleration, do you have screen corruption
> in VT each time? If so, could you try to modify the patch a bit, like:
> - removing the write to 0x100c1c;
> - if removing the write doesn't work, changing the offset applied to
> priv->r100c08 maybe testing all 4-multiples should do it, from 0 to 28.

I've only tested the 9600 about 10 times, but I've always had corruption. I
will try your changes and see if it makes a difference.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412370078.46aF66.14235
Date: Fri, 3 Oct 2014 21:01:18 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c45">Comment # 45</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:gurutonic&#64;gmail.com" title="thomas &lt;gurutonic&#64;gmail.com&gt;"> <span class="fn">thomas</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href="show_bug.cgi?id=27501#c44">comment #44</a>)
<span class="quote">&gt; 
&gt; Hi Thomas,
&gt; 
&gt; Good to hear you can use gnome-shell! :)
&gt; 
&gt; By
&gt; &gt; I haven't had any screen corruption with the 9400M.
&gt; do you mean with the 9600M GT completely disabled?
&gt; </span >

I use the efi stub loader with refind bootloader. Refind doesn't have an option
to use outb as in grub. I have set OSX preferences to &quot;battery saving&quot;, so that
the firmware sets up the 9400 initially, but the 9600 is still technically
enabled. It shows up in lspci, etc. Whenever I test the 9600, I change the
setting in OSX back to &quot;performance&quot;. So yes, with both cards enabled, the 9400
works without corruption.

<span class="quote">&gt; When using the 9600M GT without acceleration, do you have screen corruption
&gt; in VT each time? If so, could you try to modify the patch a bit, like:
&gt; - removing the write to 0x100c1c;
&gt; - if removing the write doesn't work, changing the offset applied to
&gt; priv-&gt;r100c08 maybe testing all 4-multiples should do it, from 0 to 28.</span >

I've only tested the 9600 about 10 times, but I've always had corruption. I
will try your changes and see if it makes a difference.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412370078.46aF66.14235--

--===============1183101105==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1183101105==--
