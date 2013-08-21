From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 66176] nouveau.perflvl kernel parameter doesn't work
Date: Wed, 21 Aug 2013 06:10:50 +0000
Message-ID: <bug-66176-8800-zE2WUse4ZM@http.bugs.freedesktop.org/>
References: <bug-66176-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0924154321=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-66176-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0924154321==
Content-Type: multipart/alternative; boundary="1377065450.FB4fECF52.20010"; charset="us-ascii"


--1377065450.FB4fECF52.20010
Date: Wed, 21 Aug 2013 06:10:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=66176

--- Comment #7 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Note that a NV40 reclocking fix just went into the nouveau/linux-2.6 tree:
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=dde3164f85035787ce7c63b791ce3c565ff3e3ff

Can you re-test with this fix in place?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1377065450.FB4fECF52.20010
Date: Wed, 21 Aug 2013 06:10:50 +0000
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
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEEDINFO "
   title="NEEDINFO --- - nouveau.perflvl kernel parameter doesn't work"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=66176">bug 66176</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Note that a NV40 reclocking fix just went into the nouveau/linux-2.6 tree:
<a href="http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=dde3164f85035787ce7c63b791ce3c565ff3e3ff">http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=dde3164f85035787ce7c63b791ce3c565ff3e3ff</a>

Can you re-test with this fix in place?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1377065450.FB4fECF52.20010--

--===============0924154321==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0924154321==--
