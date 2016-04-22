From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94990] Latest 4.6rc4 kernel, no booting on gtx970
Date: Fri, 22 Apr 2016 06:24:15 +0000
Message-ID: <bug-94990-8800-3RwmEW5olN@http.bugs.freedesktop.org/>
References: <bug-94990-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0347505306=="
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


--===============0347505306==
Content-Type: multipart/alternative; boundary="14613062541.2AA0acd.683";
 charset="UTF-8"


--14613062541.2AA0acd.683
Date: Fri, 22 Apr 2016 06:24:14 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94990

--- Comment #16 from Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi,

Your latest comments seem to indicate that the issue is not related to firmware
- it just happens to manifest itself at this stage as well when firmware is
loaded.

2 things to try:

1) Can you try loading Nouveau with the "config=NvForcePost=1" option? Adding
"nouveau.config=NvForcePost=1" to your kernel command line should do it.

2) Can I get a full log of you booting with the /lib/firmware directory
removed, or can you confirm that when you can see Nouveau complaining about the
firmware when you boot in this configuration?

Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14613062541.2AA0acd.683
Date: Fri, 22 Apr 2016 06:24:14 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990#c16">Comment # 16</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Latest 4.6rc4 kernel, no booting on gtx970"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94990">bug 94990</a>
              from <span class="vcard"><a class="email" href="mailto:gnurou&#64;gmail.com" title="Alexandre Courbot &lt;gnurou&#64;gmail.com&gt;"> <span class="fn">Alexandre Courbot</span></a>
</span></b>
        <pre>Hi,

Your latest comments seem to indicate that the issue is not related to firmware
- it just happens to manifest itself at this stage as well when firmware is
loaded.

2 things to try:

1) Can you try loading Nouveau with the &quot;config=NvForcePost=1&quot; option? Adding
&quot;nouveau.config=NvForcePost=1&quot; to your kernel command line should do it.

2) Can I get a full log of you booting with the /lib/firmware directory
removed, or can you confirm that when you can see Nouveau complaining about the
firmware when you boot in this configuration?

Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14613062541.2AA0acd.683--

--===============0347505306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0347505306==--
