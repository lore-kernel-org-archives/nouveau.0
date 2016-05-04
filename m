From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95251] vdpau decoder capabilities: not supported
Date: Wed, 04 May 2016 05:07:10 +0000
Message-ID: <bug-95251-8800-ipZ7ei4rY4@http.bugs.freedesktop.org/>
References: <bug-95251-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0360071358=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95251-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0360071358==
Content-Type: multipart/alternative; boundary="14623384300.Fa628.16745";
 charset="UTF-8"


--14623384300.Fa628.16745
Date: Wed, 4 May 2016 05:07:10 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95251

--- Comment #3 from Marko Srebre <bgz.marko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Thanks for your help. /lib/firmware/nouveau seems fine, attaching output. Any
other way to check if firmware is being loaded?

I tried kernel parameters

nouveau.config=mspdec=1,msppp=1,msvld=1

but it didn't change the vdpainfo reported capabilities.

nvapeek shows
00001540: f1010001
0000154c: 0000007d

-- 
You are receiving this mail because:
You are the assignee for the bug.
You are the QA Contact for the bug.
--14623384300.Fa628.16745
Date: Wed, 4 May 2016 05:07:10 +0000
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
   title="NEW - vdpau decoder capabilities: not supported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95251#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - vdpau decoder capabilities: not supported"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95251">bug 95251</a>
              from <span class="vcard"><a class="email" href="mailto:bgz.marko&#64;gmail.com" title="Marko Srebre &lt;bgz.marko&#64;gmail.com&gt;"> <span class="fn">Marko Srebre</span></a>
</span></b>
        <pre>Thanks for your help. /lib/firmware/nouveau seems fine, attaching output. Any
other way to check if firmware is being loaded?

I tried kernel parameters

nouveau.config=mspdec=1,msppp=1,msvld=1

but it didn't change the vdpainfo reported capabilities.

nvapeek shows
00001540: f1010001
0000154c: 0000007d</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
          <li>You are the QA Contact for the bug.</li>
      </ul>
    </body>
</html>
--14623384300.Fa628.16745--

--===============0360071358==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0360071358==--
