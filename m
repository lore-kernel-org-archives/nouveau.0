From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94844] Ditching xf86-video-nouveau in favor of
 xf86-video-modesetting?
Date: Wed, 06 Apr 2016 13:33:16 +0000
Message-ID: <bug-94844-8800-q9ylzGpLrP@http.bugs.freedesktop.org/>
References: <bug-94844-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1045894170=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94844-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1045894170==
Content-Type: multipart/alternative; boundary="14599495960.446DC99b.12341";
 charset="UTF-8"


--14599495960.446DC99b.12341
Date: Wed, 6 Apr 2016 13:33:16 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94844

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
https://xkcd.com/386/

(a) GLAMOR accel would only work on G80+, nouveau supports Riva TNT2 and up.
(b) xf86-video-nouveau is well tested and simple, the GL driver is complex and
causes crashes for a lot of people
(c) Many people choose not to install nouveau's GL driver (for improved
stability), would now be stuck without acceleration
(d) GLAMOR happens to trigger some bugs in nouveau's GL impl that I've been
unable to track down

Look at all the trouble Maxwell has had as a result of not having a dedicated
EXA impl in xf86-video-nouveau and being stuck with modesetting/glamor.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14599495960.446DC99b.12341
Date: Wed, 6 Apr 2016 13:33:16 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Ditching xf86-video-nouveau in favor of xf86-video-modesetting?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94844#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Ditching xf86-video-nouveau in favor of xf86-video-modesetting?"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94844">bug 94844</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre><a href="https://xkcd.com/386/">https://xkcd.com/386/</a>

(a) GLAMOR accel would only work on G80+, nouveau supports Riva TNT2 and up.
(b) xf86-video-nouveau is well tested and simple, the GL driver is complex and
causes crashes for a lot of people
(c) Many people choose not to install nouveau's GL driver (for improved
stability), would now be stuck without acceleration
(d) GLAMOR happens to trigger some bugs in nouveau's GL impl that I've been
unable to track down

Look at all the trouble Maxwell has had as a result of not having a dedicated
EXA impl in xf86-video-nouveau and being stuck with modesetting/glamor.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14599495960.446DC99b.12341--

--===============1045894170==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1045894170==--
