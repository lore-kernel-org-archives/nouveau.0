From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27501] MacBook Pro 5, x unable to boot [NV96 + NVAC]
Date: Fri, 21 Nov 2014 21:41:20 +0000
Message-ID: <bug-27501-8800-e4JBrnAoR5@http.bugs.freedesktop.org/>
References: <bug-27501-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1543299762=="
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


--===============1543299762==
Content-Type: multipart/alternative; boundary="1416606080.2fd13.28568"; charset="UTF-8"


--1416606080.2fd13.28568
Date: Fri, 21 Nov 2014 21:41:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=27501

--- Comment #54 from l3iggs <j@greyltc.com> ---
(In reply to Pierre Moreau from comment #53)
> @l3iggs
> The RE revealed nothing interesting. I'll try again when I can manage to
> spare some time. I asked the Nvidia guys about it, it should help getting a
> better patch.
Great, thank you for your effort here! I'm more than happy to test anything you
come up with and provide any feed back I can.
> I guess you set 'Better Performances' in Mac OS before getting that dmesg.
> In that case the 9600M GT is driving the screen, and with acceleration
> enabled causes this issue (you can try without acceleration, but you'll get
> another issue ;) ). You should fill a bug report for that issue.
I actually haven't installed OSX on this machine in years. I assume it's in
high performance mode. I've actually been trying to switch over to the low
power GPU in my testing here with no success. So I'm not having too much
success with many of the workarounds & patches posted in this thread. Am I
correct in understanding that you think I should start another bug report with
this trace? Does that mean this bug report is only concerned with issues when
running from the 9400M then?

I'll keep trying to produce some more info relevant to this bug by working on
getting switched over to my 9400M.

Does anyone know if it's possible to switch from "9600M GT mode" to "9400M
mode" without using OSX? I've tried several of the mysterious outb grub
directives. "outb 0x750 0" turns my screen off (I assume that's shutting off
the 9600M GT) but I can't seem to enable/switch to the 9400M to get the screen
back on.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416606080.2fd13.28568
Date: Fri, 21 Nov 2014 21:41:20 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501#c54">Comment # 54</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - MacBook Pro 5,x unable to boot [NV96 + NVAC]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=27501">bug 27501</a>
              from <span class="vcard"><a class="email" href="mailto:j&#64;greyltc.com" title="l3iggs &lt;j&#64;greyltc.com&gt;"> <span class="fn">l3iggs</span></a>
</span></b>
        <pre>(In reply to Pierre Moreau from <a href="show_bug.cgi?id=27501#c53">comment #53</a>)
<span class="quote">&gt; &#64;l3iggs
&gt; The RE revealed nothing interesting. I'll try again when I can manage to
&gt; spare some time. I asked the Nvidia guys about it, it should help getting a
&gt; better patch.</span >
Great, thank you for your effort here! I'm more than happy to test anything you
come up with and provide any feed back I can.
<span class="quote">&gt; I guess you set 'Better Performances' in Mac OS before getting that dmesg.
&gt; In that case the 9600M GT is driving the screen, and with acceleration
&gt; enabled causes this issue (you can try without acceleration, but you'll get
&gt; another issue ;) ). You should fill a bug report for that issue.</span >
I actually haven't installed OSX on this machine in years. I assume it's in
high performance mode. I've actually been trying to switch over to the low
power GPU in my testing here with no success. So I'm not having too much
success with many of the workarounds &amp; patches posted in this thread. Am I
correct in understanding that you think I should start another bug report with
this trace? Does that mean this bug report is only concerned with issues when
running from the 9400M then?

I'll keep trying to produce some more info relevant to this bug by working on
getting switched over to my 9400M.

Does anyone know if it's possible to switch from &quot;9600M GT mode&quot; to &quot;9400M
mode&quot; without using OSX? I've tried several of the mysterious outb grub
directives. &quot;outb 0x750 0&quot; turns my screen off (I assume that's shutting off
the 9600M GT) but I can't seem to enable/switch to the 9400M to get the screen
back on.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416606080.2fd13.28568--

--===============1543299762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1543299762==--
