From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60516] nouveau driver graphics corrupted in 3.7
 kernel for nvidia FX5200 [NV34] hardware
Date: Mon, 06 May 2013 06:01:36 +0000
Message-ID: <bug-60516-8800-M8rRpdNX5C@http.bugs.freedesktop.org/>
References: <bug-60516-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0309340243=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60516-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0309340243==
Content-Type: multipart/alternative; boundary="1367820096.6ccb4.26563"; charset="us-ascii"


--1367820096.6ccb4.26563
Date: Mon, 6 May 2013 06:01:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60516

--- Comment #5 from Lee Matheson <lee_matheson-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> ---
This comment is just a confirmation of the fix ( - drm/nouveau: Fix typo in
init_idx_addr_latched()  ).

On my 32-bit openSUSE-12.3 setup (with the FX5200 graphic card) I updated the
kernel to the latest SuSE-GmbH built 3.7.10-1.4 kernel (where that kernel has
the noted 'typo fix' ) and the nouveau graphic driver works well with it.

Thank you all for the fix.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1367820096.6ccb4.26563
Date: Mon, 6 May 2013 06:01:36 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60516#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED FIXED - nouveau driver graphics corrupted in 3.7 kernel for nvidia FX5200 [NV34] hardware"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60516">bug 60516</a>
              from <span class="vcard"><a class="email" href="mailto:lee_matheson&#64;hotmail.com" title="Lee Matheson &lt;lee_matheson&#64;hotmail.com&gt;"> <span class="fn">Lee Matheson</span></a>
</span></b>
        <pre>This comment is just a confirmation of the fix ( - drm/nouveau: Fix typo in
init_idx_addr_latched()  ).

On my 32-bit openSUSE-12.3 setup (with the FX5200 graphic card) I updated the
kernel to the latest SuSE-GmbH built 3.7.10-1.4 kernel (where that kernel has
the noted 'typo fix' ) and the nouveau graphic driver works well with it.

Thank you all for the fix.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1367820096.6ccb4.26563--

--===============0309340243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0309340243==--
