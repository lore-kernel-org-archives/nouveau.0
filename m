From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92287] Display errors in Qt applications after using
 Android Virtual Devices
Date: Mon, 05 Oct 2015 18:47:01 +0000
Message-ID: <bug-92287-8800-CDczNd9Dea@http.bugs.freedesktop.org/>
References: <bug-92287-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0013474842=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92287-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0013474842==
Content-Type: multipart/alternative; boundary="1444070820.3BED80.12824"; charset="UTF-8"


--1444070820.3BED80.12824
Date: Mon, 5 Oct 2015 18:47:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92287

--- Comment #5 from Guido Winkelmann <guido-WHizhSsHnEbSgI/GaPOurUTU+k/KrAxG@public.gmane.org> ---
> You might try with mesa-git -- there are a handful of patches on there that deal with resource lifetime issues, but I doubt it will do anything to resolve your problem.

I've installed mesa git, and so far, it looks like that solves the reported
problems, although sometimes they take a while to manifest. Will report back
tomorrow.

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1444070820.3BED80.12824
Date: Mon, 5 Oct 2015 18:47:00 +0000
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
   title="NEW - Display errors in Qt applications after using Android Virtual Devices"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92287#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Display errors in Qt applications after using Android Virtual Devices"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92287">bug 92287</a>
              from <span class="vcard"><a class="email" href="mailto:guido&#64;ambient-entertainment.de" title="Guido Winkelmann &lt;guido&#64;ambient-entertainment.de&gt;"> <span class="fn">Guido Winkelmann</span></a>
</span></b>
        <pre><span class="quote">&gt; You might try with mesa-git -- there are a handful of patches on there that deal with resource lifetime issues, but I doubt it will do anything to resolve your problem.</span >

I've installed mesa git, and so far, it looks like that solves the reported
problems, although sometimes they take a while to manifest. Will report back
tomorrow.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1444070820.3BED80.12824--

--===============0013474842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0013474842==--
