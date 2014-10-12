From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84932] Optimus with nouveau no longer works with
 xorg-server 1.16.1
Date: Sun, 12 Oct 2014 14:55:26 +0000
Message-ID: <bug-84932-8800-cjSd4EsBTb@http.bugs.freedesktop.org/>
References: <bug-84932-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1477596631=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84932-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1477596631==
Content-Type: multipart/alternative; boundary="1413125725.424C0.1693"; charset="UTF-8"


--1413125725.424C0.1693
Date: Sun, 12 Oct 2014 14:55:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84932

--- Comment #3 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
You appear to have bbswtich referenced in your dmesg. Bumblebee is more likely
to just mess things up, and adds nothing over the runtime pm functionality
present in nouveau since 3.12 or so. [There are situations where that's not
working for one reason or another, but this is the minority of situations.]

Do you have customized xorg.conf settings? If so, try moving them out of the
way. (I notice that you're probably explicitly loading glamoregl -- no reason
to do that, can only cause trouble...)

Probably the big difference between 1.15 and 1.16 is DRI3, perhaps something is
going wrong there... you could either try a git xf86-video-intel ddx or disable
DRI3 (either at build time or with Option "DRI" "2" in the driver section).
However I'm moderately sure this has worked fine for others.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1413125725.424C0.1693
Date: Sun, 12 Oct 2014 14:55:25 +0000
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
   title="NEW - Optimus with nouveau no longer works with xorg-server 1.16.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84932#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Optimus with nouveau no longer works with xorg-server 1.16.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84932">bug 84932</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>You appear to have bbswtich referenced in your dmesg. Bumblebee is more likely
to just mess things up, and adds nothing over the runtime pm functionality
present in nouveau since 3.12 or so. [There are situations where that's not
working for one reason or another, but this is the minority of situations.]

Do you have customized xorg.conf settings? If so, try moving them out of the
way. (I notice that you're probably explicitly loading glamoregl -- no reason
to do that, can only cause trouble...)

Probably the big difference between 1.15 and 1.16 is DRI3, perhaps something is
going wrong there... you could either try a git xf86-video-intel ddx or disable
DRI3 (either at build time or with Option &quot;DRI&quot; &quot;2&quot; in the driver section).
However I'm moderately sure this has worked fine for others.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1413125725.424C0.1693--

--===============1477596631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1477596631==--
