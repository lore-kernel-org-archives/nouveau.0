From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Tue, 26 Apr 2016 07:53:31 +0000
Message-ID: <bug-94990-8800-aHUv64oC10@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1974749675=="
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


--===============1974749675==
Content-Type: multipart/alternative; boundary="14616572111.e2757E3.14132";
 charset="UTF-8"


--14616572111.e2757E3.14132
Date: Tue, 26 Apr 2016 07:53:31 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94990

--- Comment #24 from Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,

Not sure why you enabled MSI - I asked if you could set NvForcePost, not NvMSI?
Or maybe you posted on the wrong bug?

My gut feeling is more and more that for some reason devinit is not ran by the
bios and the heuristic in 4.6 does not detect this (which is why I wanted to
try NvForcePost). If you are compiling your own kernel, could you try applying
the following patch and see if things are improving?

https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14616572111.e2757E3.14132
Date: Tue, 26 Apr 2016 07:53:31 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990#c24">Comment # 24</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990">bug 94990</a>
              from <span class="vcard"><a class="email" href="mailto:gnurou&#64;gmail.com" title="Alexandre Courbot &lt;gnurou&#64;gmail.com&gt;"> <span class="fn">Alexandre Courbot</span></a>
</span></b>
        <pre>Hi,

Not sure why you enabled MSI - I asked if you could set NvForcePost, not NvMSI?
Or maybe you posted on the wrong bug?

My gut feeling is more and more that for some reason devinit is not ran by the
bios and the heuristic in 4.6 does not detect this (which is why I wanted to
try NvForcePost). If you are compiling your own kernel, could you try applying
the following patch and see if things are improving?

<a href="https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html">https://lists.freedesktop.org/archives/nouveau/2016-April/024523.html</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14616572111.e2757E3.14132--

--===============1974749675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1974749675==--
