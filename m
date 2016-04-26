From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Tue, 26 Apr 2016 17:47:35 +0000
Message-ID: <bug-94990-8800-E7AXMqa8e5@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1344920073=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94990-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1344920073==
Content-Type: multipart/alternative; boundary="14616928550.9cBbB.19508";
 charset="UTF-8"


--14616928550.9cBbB.19508
Date: Tue, 26 Apr 2016 17:47:35 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94990

--- Comment #25 from mirkoroller-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org ---
(In reply to Alexandre Courbot from comment #24)
> Hi,
> 
> Not sure why you enabled MSI - I asked if you could set NvForcePost, not
> NvMSI? Or maybe you posted on the wrong bug?
> 
> My gut feeling is more and more that for some reason devinit is not ran by
> the bios and the heuristic in 4.6 does not detect this (which is why I
> wanted to try NvForcePost). If you are compiling your own kernel, could you
> try applying the following patch and see if things are improving?
> 
> https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html


Added Patch and NvForcePost=1 

Result is the Same. I did not enable MSI by bootparamter, it looks like its
enabled by default...

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14616928550.9cBbB.19508
Date: Tue, 26 Apr 2016 17:47:35 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990#c25">Comment # 25</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990">bug 94990</a>
              from <span class="vcard"><a class="email" href="mailto:mirkoroller&#64;googlemail.com" title="mirkoroller&#64;googlemail.com">mirkoroller&#64;googlemail.com</a>
</span></b>
        <pre>(In reply to Alexandre Courbot from <a href="show_bug.cgi?id=94990#c24">comment #24</a>)
<span class="quote">&gt; Hi,
&gt; 
&gt; Not sure why you enabled MSI - I asked if you could set NvForcePost, not
&gt; NvMSI? Or maybe you posted on the wrong bug?
&gt; 
&gt; My gut feeling is more and more that for some reason devinit is not ran by
&gt; the bios and the heuristic in 4.6 does not detect this (which is why I
&gt; wanted to try NvForcePost). If you are compiling your own kernel, could you
&gt; try applying the following patch and see if things are improving?
&gt; 
&gt; <a href="https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html">https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html</a></span >


Added Patch and NvForcePost=1 

Result is the Same. I did not enable MSI by bootparamter, it looks like its
enabled by default...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14616928550.9cBbB.19508--

--===============1344920073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1344920073==--
