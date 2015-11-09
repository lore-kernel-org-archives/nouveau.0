From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 92870] GF117M nvkm_pmu_pgob fault
Date: Mon, 09 Nov 2015 10:11:11 +0000
Message-ID: <bug-92870-8800-SmEWsmBpzR@http.bugs.freedesktop.org/>
References: <bug-92870-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1752035318=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-92870-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1752035318==
Content-Type: multipart/alternative; boundary="1447063871.E7Ebdc1.8948"; charset="UTF-8"


--1447063871.E7Ebdc1.8948
Date: Mon, 9 Nov 2015 10:11:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=92870

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Interesting. The v4.3 kernel has:

void
nvkm_pmu_pgob(struct nvkm_pmu *pmu, bool enable)
{
        if (pmu->func->pgob)
                pmu->func->pgob(pmu, enable);
}

But Ben's latest upstream has:

void
nvkm_pmu_pgob(struct nvkm_pmu *pmu, bool enable)
{
        if (pmu && pmu->func->pgob)
                pmu->func->pgob(pmu, enable);
}

And indeed it looks like the GF117 is missing a PMU definition. I have no idea
why that'd be the case, but it was that way before the rewrite as well. The
simplest thing is to fix up that function as above, but I think we may also
want to enable the PMU on GF117.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1447063871.E7Ebdc1.8948
Date: Mon, 9 Nov 2015 10:11:11 +0000
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
   title="NEW - GF117M nvkm_pmu_pgob fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92870#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - GF117M nvkm_pmu_pgob fault"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=92870">bug 92870</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Interesting. The v4.3 kernel has:

void
nvkm_pmu_pgob(struct nvkm_pmu *pmu, bool enable)
{
        if (pmu-&gt;func-&gt;pgob)
                pmu-&gt;func-&gt;pgob(pmu, enable);
}

But Ben's latest upstream has:

void
nvkm_pmu_pgob(struct nvkm_pmu *pmu, bool enable)
{
        if (pmu &amp;&amp; pmu-&gt;func-&gt;pgob)
                pmu-&gt;func-&gt;pgob(pmu, enable);
}

And indeed it looks like the GF117 is missing a PMU definition. I have no idea
why that'd be the case, but it was that way before the rewrite as well. The
simplest thing is to fix up that function as above, but I think we may also
want to enable the PMU on GF117.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1447063871.E7Ebdc1.8948--

--===============1752035318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1752035318==--
