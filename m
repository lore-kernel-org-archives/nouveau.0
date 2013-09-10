From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69168] [NVA8]Arbitrary crashes
Date: Tue, 10 Sep 2013 15:06:06 +0000
Message-ID: <bug-69168-8800-N4Qx21Pqb5@http.bugs.freedesktop.org/>
References: <bug-69168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1098401894=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69168-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1098401894==
Content-Type: multipart/alternative; boundary="1378825566.E434cCBB2.32037"; charset="us-ascii"


--1378825566.E434cCBB2.32037
Date: Tue, 10 Sep 2013 15:06:06 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69168

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
What you have in your logs is a warning (one that was supposed to be fixed in
3.11, odd, but it should be harmless). There's also an error in the fifo
command pusher (claims to be an invalid command, but that command looks fine to
me), but it happens much before the warning.

When you say "crashes", what do you mean? Just that X restarts? In that case,
seeing a Xorg.0.log.old would be instructional.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378825566.E434cCBB2.32037
Date: Tue, 10 Sep 2013 15:06:06 +0000
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
   title="NEW --- - [NVA8]Arbitrary crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69168#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA8]Arbitrary crashes"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69168">bug 69168</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>What you have in your logs is a warning (one that was supposed to be fixed in
3.11, odd, but it should be harmless). There's also an error in the fifo
command pusher (claims to be an invalid command, but that command looks fine to
me), but it happens much before the warning.

When you say &quot;crashes&quot;, what do you mean? Just that X restarts? In that case,
seeing a Xorg.0.log.old would be instructional.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378825566.E434cCBB2.32037--

--===============1098401894==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1098401894==--
