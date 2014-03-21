From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 76376] mesa does not build after nouveau loader
	changes
Date: Fri, 21 Mar 2014 16:27:06 +0000
Message-ID: <bug-76376-8800-hp9pImpT0a@http.bugs.freedesktop.org/>
References: <bug-76376-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1982182725=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-76376-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1982182725==
Content-Type: multipart/alternative; boundary="1395419225.Ab6B51.4454"; charset="us-ascii"


--1395419225.Ab6B51.4454
Date: Fri, 21 Mar 2014 16:27:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=76376

--- Comment #4 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Pardon for cutting in:

Jonathan, apart from exynos is there any compelling reason why *BSD uses such
an "old libdrm", and syncs "random files" rather than the whole repo ?

IMHO one could ping the exynos people to correct the license, similarly to what
Rob did recently with freedreno[1], and then just use the upstream libdrm.


Ilia, I have the same impression as well. AFAICS the headers *_drm.h (provided
by libdrm) are meant to be independent from on the device specific libraries/
packages libdrm_*.

[1]
http://cgit.freedesktop.org/mesa/drm/commit/?id=128e74cf6492025e63e035566bd6e2203e8da5e1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1395419225.Ab6B51.4454
Date: Fri, 21 Mar 2014 16:27:05 +0000
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
   title="NEW --- - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - mesa does not build after nouveau loader changes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=76376">bug 76376</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Pardon for cutting in:

Jonathan, apart from exynos is there any compelling reason why *BSD uses such
an &quot;old libdrm&quot;, and syncs &quot;random files&quot; rather than the whole repo ?

IMHO one could ping the exynos people to correct the license, similarly to what
Rob did recently with freedreno[1], and then just use the upstream libdrm.


Ilia, I have the same impression as well. AFAICS the headers *_drm.h (provided
by libdrm) are meant to be independent from on the device specific libraries/
packages libdrm_*.

[1]
<a href="http://cgit.freedesktop.org/mesa/drm/commit/?id=128e74cf6492025e63e035566bd6e2203e8da5e1">http://cgit.freedesktop.org/mesa/drm/commit/?id=128e74cf6492025e63e035566bd6e2203e8da5e1</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1395419225.Ab6B51.4454--

--===============1982182725==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1982182725==--
