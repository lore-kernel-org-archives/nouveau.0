From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 94757] powerpc64 & 64Kb kernel pagesize not working
 with nouveau
Date: Wed, 30 Mar 2016 14:44:03 +0000
Message-ID: <bug-94757-8800-ssxRSmG7ca@http.bugs.freedesktop.org/>
References: <bug-94757-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1401272215=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-94757-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1401272215==
Content-Type: multipart/alternative; boundary="14593490432.CAfF60.3784";
 charset="UTF-8"


--14593490432.CAfF60.3784
Date: Wed, 30 Mar 2016 14:44:03 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=94757

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Unfortunately it's not just a switch to flip on. A lot of the current code is
very confused about cpu pages vs gpu pages (which are always 4K). Also one
would need a bunch of handling code to deal with sub-cpu-page-sized allocations
on the GPU (or conversely just disallow those entirely).

Nouveau is known to not work properly on non-4K-cpu-page-size, at least with
some GPUs (maybe even all).

AFAIK the benefits of using 64K-pages are virtually non-existent outside the
HPC space (each cached 1 byte file takes up 64K of memory, so it goes a lot
faster). But that's certainly not an argument for not supporting 64K pages in
nouveau.

The argument for not supporting 64K pages is -ENOPATCH :) AFAIK benh tried for
a while and failed. This was ~2y ago.

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14593490432.CAfF60.3784
Date: Wed, 30 Mar 2016 14:44:03 +0000
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
   title="NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94757#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - powerpc64 &amp; 64Kb kernel pagesize not working with nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=94757">bug 94757</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Unfortunately it's not just a switch to flip on. A lot of the current code is
very confused about cpu pages vs gpu pages (which are always 4K). Also one
would need a bunch of handling code to deal with sub-cpu-page-sized allocations
on the GPU (or conversely just disallow those entirely).

Nouveau is known to not work properly on non-4K-cpu-page-size, at least with
some GPUs (maybe even all).

AFAIK the benefits of using 64K-pages are virtually non-existent outside the
HPC space (each cached 1 byte file takes up 64K of memory, so it goes a lot
faster). But that's certainly not an argument for not supporting 64K pages in
nouveau.

The argument for not supporting 64K pages is -ENOPATCH :) AFAIK benh tried for
a while and failed. This was ~2y ago.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>
--14593490432.CAfF60.3784--

--===============1401272215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1401272215==--
