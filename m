From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 58984] DRM NOUVEAU: probe of 0001:01:00.0 failed
	with error -12
Date: Wed, 13 Mar 2013 02:33:01 +0000
Message-ID: <bug-58984-8800-1utdO1vRg9@http.bugs.freedesktop.org/>
References: <bug-58984-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0919503885=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-58984-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0919503885==
Content-Type: multipart/alternative; boundary="1363141981.eA28E1.11952"; charset="us-ascii"


--1363141981.eA28E1.11952
Date: Wed, 13 Mar 2013 02:33:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=58984

--- Comment #13 from Patrick Baggett <baggett.patrick-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hmm, so I saw nouveau_bo_new() has this line:

nvbo->page_shift = 12

That imples a page size of 4KB (default on 32-bit x86). When I changed it to
"nvbo->page_shift = PAGE_SHIFT", the problem was fixed!

I now see as the final message:

[drm] Initialized nouveau 1.1.0 20120801 for 0001:01:00.0 on minor 0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1363141981.eA28E1.11952
Date: Wed, 13 Mar 2013 02:33:01 +0000
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
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - DRM NOUVEAU: probe of 0001:01:00.0 failed with error -12"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=58984">bug 58984</a>
              from <span class="vcard"><a class="email" href="mailto:baggett.patrick&#64;gmail.com" title="Patrick Baggett &lt;baggett.patrick&#64;gmail.com&gt;"> <span class="fn">Patrick Baggett</span></a>
</span></b>
        <pre>Hmm, so I saw nouveau_bo_new() has this line:

nvbo-&gt;page_shift = 12

That imples a page size of 4KB (default on 32-bit x86). When I changed it to
&quot;nvbo-&gt;page_shift = PAGE_SHIFT&quot;, the problem was fixed!

I now see as the final message:

[drm] Initialized nouveau 1.1.0 20120801 for 0001:01:00.0 on minor 0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1363141981.eA28E1.11952--

--===============0919503885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0919503885==--
