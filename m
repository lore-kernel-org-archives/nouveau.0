From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58776] DRM NOUVEAU: cannot boot with kernel >=3.7
Date: Mon, 07 Jan 2013 11:57:58 +0000
Message-ID: <bug-58776-8800-npYLXTS92d@http.bugs.freedesktop.org/>
References: <bug-58776-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1435615841=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58776-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1435615841==
Content-Type: multipart/alternative; boundary="1357559878.E2526Bac1.30878"; charset="us-ascii"


--1357559878.E2526Bac1.30878
Date: Mon, 7 Jan 2013 11:57:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58776

--- Comment #15 from gabriele balducci <balducci-KqplAB4qOuE@public.gmane.org> ---
hi there,

sorry for the delay (busy time at work and first time doing a git
bisect).

Here is the final result of the bisection:

---8<-------8<-------8<----

e5f186c4f9812eccbc291da6dfe8b15da546f961 is the first bad commit
commit e5f186c4f9812eccbc291da6dfe8b15da546f961
Author: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date:   Thu Sep 27 08:55:29 2012 +1000

    drm/nv44/vm: fix and enable use of "real" pciegart

    Something seems to be missing in regards to flushing specific ranges of
    the TLB.  For the moment, flushing the entire thing seems to make it
    work alright.

    Should give 39-bit DMA addressing on the relevant chipsets.

    v2: allocate contig 16KiB for dummy pages, reported by mwk on irc

    Signed-off-by: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

:040000 040000 7dd13fec39439ac29561ada8b22f6d2666f46ff5
cf817ecb40b80ebb8446457ea4420005438ebd8e M      drivers

---8<-------8<-------8<----

Don't hesitate to ask me any other piece of information that might be
useful


I thank you very much for your assistance

ciao
gabriele

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1357559878.E2526Bac1.30878
Date: Mon, 7 Jan 2013 11:57:58 +0000
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
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58776#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: cannot boot with kernel &gt;=3.7"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58776">bug 58776</a>
              from <span class="vcard"><a class="email" href="mailto:balducci&#64;units.it" title="gabriele balducci &lt;balducci&#64;units.it&gt;"> <span class="fn">gabriele balducci</span></a>
</span></b>
        <pre>hi there,

sorry for the delay (busy time at work and first time doing a git
bisect).

Here is the final result of the bisection:

---8&lt;-------8&lt;-------8&lt;----

e5f186c4f9812eccbc291da6dfe8b15da546f961 is the first bad commit
commit e5f186c4f9812eccbc291da6dfe8b15da546f961
Author: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;
Date:   Thu Sep 27 08:55:29 2012 +1000

    drm/nv44/vm: fix and enable use of &quot;real&quot; pciegart

    Something seems to be missing in regards to flushing specific ranges of
    the TLB.  For the moment, flushing the entire thing seems to make it
    work alright.

    Should give 39-bit DMA addressing on the relevant chipsets.

    v2: allocate contig 16KiB for dummy pages, reported by mwk on irc

    Signed-off-by: Ben Skeggs &lt;<a href="mailto:bskeggs&#64;redhat.com">bskeggs&#64;redhat.com</a>&gt;

:040000 040000 7dd13fec39439ac29561ada8b22f6d2666f46ff5
cf817ecb40b80ebb8446457ea4420005438ebd8e M      drivers

---8&lt;-------8&lt;-------8&lt;----

Don't hesitate to ask me any other piece of information that might be
useful


I thank you very much for your assistance

ciao
gabriele</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1357559878.E2526Bac1.30878--

--===============1435615841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1435615841==--
