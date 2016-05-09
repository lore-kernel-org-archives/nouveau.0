From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 95044] [NVA0] [Reclocking] GPU doesn't relax memory
	clocks
Date: Mon, 09 May 2016 18:20:18 +0000
Message-ID: <bug-95044-8800-QqojEtFqi9@http.bugs.freedesktop.org/>
References: <bug-95044-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1308768476=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-95044-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1308768476==
Content-Type: multipart/alternative; boundary="14628180170.E30cD28D2.16715";
 charset="UTF-8"


--14628180170.E30cD28D2.16715
Date: Mon, 9 May 2016 18:20:17 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=95044

--- Comment #8 from debianlinuxero1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
I've just applied the patch and check.


IT WORKS!!


It switches well towards all transitions, from down to top (step by step), top
to down (step by step) and from extreme to extreme (03 -> 0f and 0f -> 03).

Good work!

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14628180170.E30cD28D2.16715
Date: Mon, 9 May 2016 18:20:17 +0000
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
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVA0] [Reclocking] GPU doesn't relax memory clocks"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=95044">bug 95044</a>
              from <span class="vcard"><a class="email" href="mailto:debianlinuxero1&#64;gmail.com" title="debianlinuxero1&#64;gmail.com">debianlinuxero1&#64;gmail.com</a>
</span></b>
        <pre>I've just applied the patch and check.


IT WORKS!!


It switches well towards all transitions, from down to top (step by step), top
to down (step by step) and from extreme to extreme (03 -&gt; 0f and 0f -&gt; 03).

Good work!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14628180170.E30cD28D2.16715--

--===============1308768476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1308768476==--
