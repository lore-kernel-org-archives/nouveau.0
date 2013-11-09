From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71382] Nouveau dmesg error, computer hangs
Date: Sat, 09 Nov 2013 13:22:06 +0000
Message-ID: <bug-71382-8800-Y8p60es7z4@http.bugs.freedesktop.org/>
References: <bug-71382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1617105754=="
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


--===============1617105754==
Content-Type: multipart/alternative; boundary="1384003326.5625D11.19890"; charset="us-ascii"


--1384003326.5625D11.19890
Date: Sat, 9 Nov 2013 13:22:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71382

--- Comment #3 from Martin <martin.kaffanke-RbZlAiThDcE@public.gmane.org> ---
Ok, I was to fast, I had another hang with the bad stripes, but I don't know
how to debug that.

Do you think there could be aditional log for that somewhere in the logfiles?


Do you think its that?

Nov  9 13:09:41 martin-desktop kernel: [  129.247153] nouveau E[   
PBUS][0000:00:0d.0] MMIO write of 0x00000000 FAULT at 0x00b020
Nov  9 13:09:41 martin-desktop kernel: [  129.251668] nouveau E[   
PBUS][0000:00:0d.0] MMIO write of 0x0a220001 FAULT at 0x00b020

(maybe you know how to patch my packages to get rid of that?)

Where is more information?

Thanks,
Martin

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1384003326.5625D11.19890
Date: Sat, 9 Nov 2013 13:22:06 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382">bug 71382</a>
              from <span class="vcard"><a class="email" href="mailto:martin.kaffanke&#64;gmx.at" title="Martin &lt;martin.kaffanke&#64;gmx.at&gt;"> <span class="fn">Martin</span></a>
</span></b>
        <pre>Ok, I was to fast, I had another hang with the bad stripes, but I don't know
how to debug that.

Do you think there could be aditional log for that somewhere in the logfiles?


Do you think its that?

Nov  9 13:09:41 martin-desktop kernel: [  129.247153] nouveau E[   
PBUS][0000:00:0d.0] MMIO write of 0x00000000 FAULT at 0x00b020
Nov  9 13:09:41 martin-desktop kernel: [  129.251668] nouveau E[   
PBUS][0000:00:0d.0] MMIO write of 0x0a220001 FAULT at 0x00b020

(maybe you know how to patch my packages to get rid of that?)

Where is more information?

Thanks,
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

--1384003326.5625D11.19890--

--===============1617105754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1617105754==--
