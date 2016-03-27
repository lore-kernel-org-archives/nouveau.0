From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94725] Nouveau driver fails to load on GM204
Date: Sun, 27 Mar 2016 17:23:37 +0000
Message-ID: <bug-94725-8800-xBgzAyqATK@http.bugs.freedesktop.org/>
References: <bug-94725-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1677926607=="
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


--===============1677926607==
Content-Type: multipart/alternative; boundary="14590994161.Ff4bcd585.906";
 charset="UTF-8"


--14590994161.Ff4bcd585.906
Date: Sun, 27 Mar 2016 17:23:36 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94725

--- Comment #1 from Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org> ---
Nouveau is successfully loaded on your laptop, but it seems to fail when it
tries to wake up the NVIDIA GPU (if you look at the dmesg you linked, around
11sec, the NVIDIA GPU goes to sleep). You could try booting with
`nouveau.runpm=0` on the kernel command line, and see if you still get the
issue.
Do you have any dmesg from when it hangs?

IIRC, Alexandre Courbot sent a patch some time ago to fix an issue where the
driver would try to reload the signed firmware upong resume and fail, but I
would have guess it is included in 4.6-rc1.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14590994161.Ff4bcd585.906
Date: Sun, 27 Mar 2016 17:23:36 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Nouveau driver fails to load on GM204"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94725">bug 94725</a>
              from <span class="vcard"><a class="email" href="mailto:pierre.morrow&#64;free.fr" title="Pierre Moreau &lt;pierre.morrow&#64;free.fr&gt;"> <span class="fn">Pierre Moreau</span></a>
</span></b>
        <pre>Nouveau is successfully loaded on your laptop, but it seems to fail when it
tries to wake up the NVIDIA GPU (if you look at the dmesg you linked, around
11sec, the NVIDIA GPU goes to sleep). You could try booting with
`nouveau.runpm=0` on the kernel command line, and see if you still get the
issue.
Do you have any dmesg from when it hangs?

IIRC, Alexandre Courbot sent a patch some time ago to fix an issue where the
driver would try to reload the signed firmware upong resume and fail, but I
would have guess it is included in 4.6-rc1.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14590994161.Ff4bcd585.906--

--===============1677926607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1677926607==--
