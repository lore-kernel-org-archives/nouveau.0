From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 55449] Problems identifying card
Date: Mon, 19 Aug 2013 15:59:55 +0000
Message-ID: <bug-55449-8800-VjBxWmGji5@http.bugs.freedesktop.org/>
References: <bug-55449-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0692088660=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-55449-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0692088660==
Content-Type: multipart/alternative; boundary="1376927995.6dFa2.9466"; charset="us-ascii"


--1376927995.6dFa2.9466
Date: Mon, 19 Aug 2013 15:59:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=55449

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
OK, so the fundamental problem is that it's being detected as a NV30 card
instead of NV15 due to a lack of byteswapping when reading in the the PMC.ID
register (which should have come out as 0x015000a3). Once that goes wrong, all
bets are off.

I know that another user was pretty close to getting a NV4x card to work (benh,
the ppc maintainer), which would largely go through the same init paths (at
least as far as mmio reads/writes are concerned). Could you test a more recent
kernel (like 3.10 or 3.11) and see if this particular issue is still there?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1376927995.6dFa2.9466
Date: Mon, 19 Aug 2013 15:59:55 +0000
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
   title="NEW --- - Problems identifying card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55449#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Problems identifying card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=55449">bug 55449</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>OK, so the fundamental problem is that it's being detected as a NV30 card
instead of NV15 due to a lack of byteswapping when reading in the the PMC.ID
register (which should have come out as 0x015000a3). Once that goes wrong, all
bets are off.

I know that another user was pretty close to getting a NV4x card to work (benh,
the ppc maintainer), which would largely go through the same init paths (at
least as far as mmio reads/writes are concerned). Could you test a more recent
kernel (like 3.10 or 3.11) and see if this particular issue is still there?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1376927995.6dFa2.9466--

--===============0692088660==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0692088660==--
