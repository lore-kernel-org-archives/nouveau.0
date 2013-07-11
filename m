From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66696] Nouveau does DMA to/from unexpected address
Date: Thu, 11 Jul 2013 08:19:07 +0000
Message-ID: <bug-66696-8800-UkyU8ONiNx@http.bugs.freedesktop.org/>
References: <bug-66696-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0545856946=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66696-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0545856946==
Content-Type: multipart/alternative; boundary="1373530747.DEbDA1.5464"; charset="us-ascii"


--1373530747.DEbDA1.5464
Date: Thu, 11 Jul 2013 08:19:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66696

--- Comment #6 from Stijn Tintel <stijn+bugs-VfPWfsRibaPZj6PxcwrBaQ@public.gmane.org> ---
After correcting the typos (mv_wr32 -> nv_wr32), I was able to build the
kernel. Unfortunately I still see the same DMAR errors.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1373530747.DEbDA1.5464
Date: Thu, 11 Jul 2013 08:19:07 +0000
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
   title="NEW --- - Nouveau does DMA to/from unexpected address"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66696#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau does DMA to/from unexpected address"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66696">bug 66696</a>
              from <span class="vcard"><a class="email" href="mailto:stijn+bugs&#64;linux-ipv6.be" title="Stijn Tintel &lt;stijn+bugs&#64;linux-ipv6.be&gt;"> <span class="fn">Stijn Tintel</span></a>
</span></b>
        <pre>After correcting the typos (mv_wr32 -&gt; nv_wr32), I was able to build the
kernel. Unfortunately I still see the same DMAR errors.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1373530747.DEbDA1.5464--

--===============0545856946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0545856946==--
