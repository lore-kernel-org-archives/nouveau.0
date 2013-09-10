From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 47556] [NV17] nouveau driver can't handle xrandr
	requests
Date: Tue, 10 Sep 2013 12:03:35 +0000
Message-ID: <bug-47556-8800-kDs9Sa5nap@http.bugs.freedesktop.org/>
References: <bug-47556-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0309625062=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-47556-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0309625062==
Content-Type: multipart/alternative; boundary="1378814615.cAa7711.10997"; charset="us-ascii"


--1378814615.cAa7711.10997
Date: Tue, 10 Sep 2013 12:03:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=47556

--- Comment #14 from Elmar Stellnberger <estellnb-7Km2I/eHSAQdnm+yROfE0A@public.gmane.org> ---
Well done!; it works with oS13.1_MS4,
xorg-x11-driver-video-nouveau-1.0.9-1.2.i586 for most practical purposes very
well. However by finally plugging xranding and unplugging different monitors I
did finally get an error on re-enabling the same screen with different
resolution (i.e. --off -right-of --mode newone). The error may or may not have
to do something with nouveau; see for the logs (using
xorg-x11-7.6_1-9.2.noarch, Xorg server 1.14.2, release date 2013-06-25).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1378814615.cAa7711.10997
Date: Tue, 10 Sep 2013 12:03:35 +0000
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
   title="NEW --- - [NV17] nouveau driver can't handle xrandr requests"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47556#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV17] nouveau driver can't handle xrandr requests"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=47556">bug 47556</a>
              from <span class="vcard"><a class="email" href="mailto:estellnb&#64;elstel.org" title="Elmar Stellnberger &lt;estellnb&#64;elstel.org&gt;"> <span class="fn">Elmar Stellnberger</span></a>
</span></b>
        <pre>Well done!; it works with oS13.1_MS4,
xorg-x11-driver-video-nouveau-1.0.9-1.2.i586 for most practical purposes very
well. However by finally plugging xranding and unplugging different monitors I
did finally get an error on re-enabling the same screen with different
resolution (i.e. --off -right-of --mode newone). The error may or may not have
to do something with nouveau; see for the logs (using
xorg-x11-7.6_1-9.2.noarch, Xorg server 1.14.2, release date 2013-06-25).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1378814615.cAa7711.10997--

--===============0309625062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0309625062==--
