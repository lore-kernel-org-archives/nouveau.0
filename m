From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to load on GM204
Date: Sun, 27 Mar 2016 17:35:46 +0000
Message-ID: <bug-94725-8800-Ww9vKn52ZO@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1555188415=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94725-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1555188415==
Content-Type: multipart/alternative; boundary="14591001462.Ea7Cf3A7.4870";
 charset="UTF-8"


--14591001462.Ea7Cf3A7.4870
Date: Sun, 27 Mar 2016 17:35:46 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
In addition to the runpm=0 thing, please ensure that you have the appropriate
firmware installed for this GPU - it should be in linux-firmware.git by now
(nvidia/*). I don't see a message about nouveaufb, which could be due to how
you configured your kernel, but it could also be because you don't have the
firmware, and the user helper is kicking in and waiting 60 seconds for it to
fail out, so nouveau's not fully done loading by the time the runpm stuff kicks
in. Just a theory.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14591001462.Ea7Cf3A7.4870
Date: Sun, 27 Mar 2016 17:35:46 +0000
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
   title="NEW - Nouveau driver fails to load on GM204"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to load on GM204"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>In addition to the runpm=0 thing, please ensure that you have the appropriate
firmware installed for this GPU - it should be in linux-firmware.git by now
(nvidia/*). I don't see a message about nouveaufb, which could be due to how
you configured your kernel, but it could also be because you don't have the
firmware, and the user helper is kicking in and waiting 60 seconds for it to
fail out, so nouveau's not fully done loading by the time the runpm stuff kicks
in. Just a theory.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14591001462.Ea7Cf3A7.4870--

--===============1555188415==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1555188415==--
