From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67597] nouveau E Xorg failed to idle channel on NVA0
Date: Thu, 01 Aug 2013 02:41:42 +0000
Message-ID: <bug-67597-8800-QTDg6iv9hz@http.bugs.freedesktop.org/>
References: <bug-67597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0151974309=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67597-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0151974309==
Content-Type: multipart/alternative; boundary="1375324902.e88fdD2.23706"; charset="us-ascii"


--1375324902.e88fdD2.23706
Date: Thu, 1 Aug 2013 02:41:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67597

--- Comment #2 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
Actually all the fence stuff was redone between... 3.4 and 3.5 or 3.5 and 3.6
(sorry, I forgot), and that created regressions for at least one other user (on
a nvc0 card though). The unfortunate thing is that the fence redo actually had
some suspend bugs in it that were fixed over time (but I guess not all of
them!) so this may end up being tricky to bisect, if you indeed zero in on
those fence commits.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375324902.e88fdD2.23706
Date: Thu, 1 Aug 2013 02:41:42 +0000
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
   title="NEW --- - nouveau E Xorg failed to idle channel on NVA0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67597#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - nouveau E Xorg failed to idle channel on NVA0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67597">bug 67597</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>Actually all the fence stuff was redone between... 3.4 and 3.5 or 3.5 and 3.6
(sorry, I forgot), and that created regressions for at least one other user (on
a nvc0 card though). The unfortunate thing is that the fence redo actually had
some suspend bugs in it that were fixed over time (but I guess not all of
them!) so this may end up being tricky to bisect, if you indeed zero in on
those fence commits.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375324902.e88fdD2.23706--

--===============0151974309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0151974309==--
